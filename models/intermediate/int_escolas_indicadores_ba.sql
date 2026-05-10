-- Intermediate: indicadores por escola para UF = BA
with icg as (
    select *
    from {{ ref('stg_icg_escolas') }}
    where uf = 'BA'
),
ied as (
    select *
    from {{ ref('stg_ied_escolas') }}
    where uf = 'BA'
)

select
    coalesce(icg.ano_censo, ied.ano_censo) as ano_censo,
    coalesce(icg.id_escola, ied.id_escola) as id_escola,
    coalesce(icg.uf, ied.uf) as uf,
    coalesce(icg.nome_escola, ied.nome_escola) as nome_escola,
    coalesce(icg.id_municipio, ied.id_municipio) as id_municipio,
    coalesce(icg.nome_municipio, ied.nome_municipio) as nome_municipio,
    icg.nivel_complexidade_gestao,
    ied.pct_docentes_esforco_nivel_1,
    ied.pct_docentes_esforco_nivel_2,
    ied.pct_docentes_esforco_nivel_3,
    ied.pct_docentes_esforco_nivel_4,
    ied.pct_docentes_esforco_nivel_5,
    ied.pct_docentes_esforco_nivel_6,
    (coalesce(ied.pct_docentes_esforco_nivel_5,0) + coalesce(ied.pct_docentes_esforco_nivel_6,0)) as pct_docentes_alto_esforco
from icg
left join ied
    on icg.ano_censo = ied.ano_censo
    and icg.id_escola = ied.id_escola
