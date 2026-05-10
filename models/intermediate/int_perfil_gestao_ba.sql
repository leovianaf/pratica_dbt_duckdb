-- Intermediate: perfil de gestão por escola (BA)
with gestor_agg as (
    select
        ano_censo,
        id_escola,
        sum(coalesce(qtd_gestores_total,0)) as qtd_gestores_total,
        sum(coalesce(qtd_gestores_feminino,0)) as qtd_gestores_feminino,
        sum(coalesce(qtd_gestores_masculino,0)) as qtd_gestores_masculino,
        sum(coalesce(qtd_gestores_brancos,0)) as qtd_gestores_brancos,
        sum(coalesce(qtd_gestores_pretos,0)) as qtd_gestores_pretos,
        sum(coalesce(qtd_gestores_pardos,0)) as qtd_gestores_pardos,
        sum(coalesce(qtd_gestores_graduacao,0)) as qtd_gestores_graduacao,
        sum(coalesce(qtd_gestores_pos_especializacao,0)) as qtd_gestores_pos_especializacao,
        sum(coalesce(qtd_gestores_pos_mestrado,0)) as qtd_gestores_pos_mestrado,
        sum(coalesce(qtd_gestores_pos_doutorado,0)) as qtd_gestores_pos_doutorado
    from {{ ref('stg_gestor_escolar') }}
    group by ano_censo, id_escola
),
icg_ba as (
    select ano_censo, id_escola, uf, nome_escola
    from {{ ref('stg_icg_escolas') }}
    where uf = 'BA'
)

select
    i.ano_censo,
    i.id_escola,
    i.uf,
    i.nome_escola,
    coalesce(g.qtd_gestores_total,0) as qtd_gestores_total,
    coalesce(g.qtd_gestores_feminino,0) as qtd_gestores_feminino,
    coalesce(g.qtd_gestores_masculino,0) as qtd_gestores_masculino,
    coalesce(g.qtd_gestores_brancos,0) as qtd_gestores_brancos,
    coalesce(g.qtd_gestores_pretos,0) as qtd_gestores_pretos,
    coalesce(g.qtd_gestores_pardos,0) as qtd_gestores_pardos,
    coalesce(g.qtd_gestores_graduacao,0) as qtd_gestores_graduacao,
    coalesce(g.qtd_gestores_pos_especializacao,0) as qtd_gestores_pos_especializacao,
    coalesce(g.qtd_gestores_pos_mestrado,0) as qtd_gestores_pos_mestrado,
    coalesce(g.qtd_gestores_pos_doutorado,0) as qtd_gestores_pos_doutorado,
    case when coalesce(g.qtd_gestores_total,0) = 0 then null
         else (g.qtd_gestores_pos_especializacao * 1.0) / nullif(g.qtd_gestores_total,0)
    end as prop_pos_especializacao
from icg_ba i
left join gestor_agg g
    on i.ano_censo = g.ano_censo
    and i.id_escola = g.id_escola
