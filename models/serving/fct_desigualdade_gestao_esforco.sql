/*
    Serving: fct_desigualdade_gestao_esforco
    =========================================
    Tabela fato da camada Serving para a Bahia (BA), Censo Escolar 2025.

    Consolida, por escola, três dimensões de análise:
      1. Nível de complexidade de gestão (ICG — escala 1 a 6)
      2. Taxa de docentes em esforço crítico (IED — soma dos níveis 5 e 6)
      3. Perfis demográficos dos gestores (gênero e raça) e rede administrativa

    Responde à pergunta de pesquisa:
      "Escolas com maior complexidade de gestão têm maior proporção
       de docentes em alto esforço (níveis 5 e 6)?"

    Consumida diretamente pelo notebook 03_exibir_resultados.ipynb.
    Materializada como TABLE para evitar reprocessamento a cada consulta.
*/

with indicadores as (

    -- Traz nível de complexidade (ICG) e percentuais de esforço docente (IED) por escola.
    -- A coluna pct_docentes_esforco_nivel_1 é NULL quando a escola não tem registro no IED
    -- (resultado do LEFT JOIN na intermediate). Usamos isso como flag de ausência de dado IED.
    select
        ano_censo,
        id_escola,
        nome_escola,
        id_municipio,
        nome_municipio,
        nivel_complexidade_gestao,
        pct_docentes_esforco_nivel_1,    -- flag: NULL = sem dado IED para esta escola
        pct_docentes_alto_esforco        -- soma dos níveis 5+6 (0.0 quando sem dado IED)
    from {{ ref('int_escolas_indicadores_ba') }}

),

perfil_gestao as (

    -- Traz as contagens de gestores por escola necessárias para construir
    -- os perfis de gênero e raça.
    select
        id_escola,
        qtd_gestores_total,
        qtd_gestores_feminino,
        qtd_gestores_masculino,
        qtd_gestores_brancos,
        qtd_gestores_pretos,
        qtd_gestores_pardos
    from {{ ref('int_perfil_gestao_ba') }}

),

dependencia as (

    -- A dependência administrativa (Municipal, Estadual, Federal, Privada) não foi
    -- propagada na camada intermediate. Buscamos direto do staging, mantendo
    -- o filtro por BA para garantir consistência.
    select distinct
        id_escola,
        dependencia_administrativa as no_dependencia
    from {{ ref('stg_icg_escolas') }}
    where uf = 'BA'

),

final as (

    select

        -- ── Identificadores ──────────────────────────────────────────────────────────
        i.ano_censo,
        i.id_escola,
        i.nome_escola,
        i.id_municipio,
        i.nome_municipio,

        -- ── Indicador principal: complexidade de gestão ───────────────────────────
        -- Escala de 1 (mais simples) a 6 (mais complexo), conforme o ICG do INEP.
        i.nivel_complexidade_gestao     as nivel_complexidade,

        -- ── Taxa de esforço docente crítico ───────────────────────────────────────
        -- Soma dos percentuais de docentes nos níveis 5 e 6 do IED.
        -- Definida como NULL quando a escola não possui registro no IED, evitando
        -- que o coalesce(0) da intermediate distorça médias e proporções na análise.
        case
            when i.pct_docentes_esforco_nivel_1 is null then null
            else i.pct_docentes_alto_esforco
        end                             as tx_esforco_docente_critico,

        -- ── Rede / dependência administrativa ─────────────────────────────────────
        d.no_dependencia,

        -- ── Perfil de gênero dos gestores ─────────────────────────────────────────
        -- Classifica a escola com base no gênero dominante entre seus gestores.
        -- Considera "maioria" quando um gênero representa mais de 60% do total,
        -- evitando classificações enganosas em escolas com poucos gestores.
        case
            when coalesce(g.qtd_gestores_total, 0) = 0
                then 'Equilibrado / Não Informado'
            when g.qtd_gestores_feminino * 1.0 / nullif(g.qtd_gestores_total, 0) > 0.6
                then 'Maioria Feminina'
            when g.qtd_gestores_masculino * 1.0 / nullif(g.qtd_gestores_total, 0) > 0.6
                then 'Maioria Masculina'
            else
                'Equilibrado / Não Informado'
        end                             as perfil_genero,

        -- ── Perfil racial dos gestores ────────────────────────────────────────────
        -- Classifica pela raça majoritária (> 50% do total de gestores).
        -- Pretos e pardos são agrupados como "Negra", seguindo a classificação
        -- do IBGE que reconhece ambas as categorias como população negra.
        case
            when coalesce(g.qtd_gestores_total, 0) = 0
                then 'Misto / Não Informado'
            when g.qtd_gestores_brancos * 1.0 / nullif(g.qtd_gestores_total, 0) > 0.5
                then 'Maioria Branca'
            when (g.qtd_gestores_pretos + g.qtd_gestores_pardos) * 1.0
                 / nullif(g.qtd_gestores_total, 0) > 0.5
                then 'Maioria Negra (Pretos + Pardos)'
            else
                'Misto / Não Informado'
        end                             as perfil_raca

    from indicadores i
    left join perfil_gestao g
        on i.id_escola = g.id_escola
    left join dependencia d
        on i.id_escola = d.id_escola

)

select * from final
