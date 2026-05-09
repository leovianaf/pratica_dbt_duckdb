select
    cast(NU_ANO_CENSO as integer) as ano_censo,
    cast(CO_ENTIDADE as integer) as id_escola,

    cast(QT_GEST_BAS as integer) as qtd_gestores_total,

    cast(QT_GEST_BAS_FEM as integer) as qtd_gestores_feminino,
    cast(QT_GEST_BAS_MASC as integer) as qtd_gestores_masculino,
    cast(QT_GEST_BAS_ND as integer) as qtd_gestores_genero_nao_declarado,

    cast(QT_GEST_BAS_BRANCA as integer) as qtd_gestores_brancos,
    cast(QT_GEST_BAS_PRETA as integer) as qtd_gestores_pretos,
    cast(QT_GEST_BAS_PARDA as integer) as qtd_gestores_pardos,
    cast(QT_GEST_BAS_AMARELA as integer) as qtd_gestores_amarelos,
    cast(QT_GEST_BAS_INDIGENA as integer) as qtd_gestores_indigenas,

    cast(QT_GEST_BAS_NACIO_BRASILEIRA as integer) as qtd_gestores_nacionalidade_brasileira,
    cast(QT_GEST_BAS_NACIO_ESTRANG as integer) as qtd_gestores_nacionalidade_estrangeira,

    cast(QT_GEST_BAS_0_24 as integer) as qtd_gestores_0_24_anos,
    cast(QT_GEST_BAS_25_29 as integer) as qtd_gestores_25_29_anos,
    cast(QT_GEST_BAS_30_39 as integer) as qtd_gestores_30_39_anos,
    cast(QT_GEST_BAS_40_49 as integer) as qtd_gestores_40_49_anos,
    cast(QT_GEST_BAS_50_54 as integer) as qtd_gestores_50_54_anos,
    cast(QT_GEST_BAS_55_59 as integer) as qtd_gestores_55_59_anos,
    cast(QT_GEST_BAS_60_MAIS as integer) as qtd_gestores_60_anos_ou_mais,

    cast(QT_GEST_BAS_PCD as integer) as qtd_gestores_pcd,

    cast(QT_GEST_BAS_ZR_URB as integer) as qtd_gestores_zona_urbana,
    cast(QT_GEST_BAS_ZR_RUR as integer) as qtd_gestores_zona_rural,
    cast(QT_GEST_BAS_ZR_NA as integer) as qtd_gestores_zona_nao_aplicavel,

    cast(QT_GEST_BAS_ESCO_EF as integer) as qtd_gestores_escolaridade_ensino_fundamental,
    cast(QT_GEST_BAS_ESCO_EM as integer) as qtd_gestores_escolaridade_ensino_medio,
    cast(QT_GEST_BAS_ESCO_SUP_GRAD as integer) as qtd_gestores_graduacao,
    cast(QT_GEST_BAS_ESCO_SUP_GRAD_LICEN as integer) as qtd_gestores_graduacao_licenciatura,
    cast(QT_GEST_BAS_ESCO_SUP_GRAD_SLICEN as integer) as qtd_gestores_graduacao_sem_licenciatura,
    cast(QT_GEST_BAS_ESCO_SUP_POS_ESPEC as integer) as qtd_gestores_pos_especializacao,
    cast(QT_GEST_BAS_ESCO_SUP_POS_MESTRA as integer) as qtd_gestores_pos_mestrado,
    cast(QT_GEST_BAS_ESCO_SUP_POS_DOUTO as integer) as qtd_gestores_pos_doutorado,
    cast(QT_GEST_BAS_ESCO_SUP_POS_NENHUM as integer) as qtd_gestores_sem_pos_graduacao,

    cast(QT_GEST_BAS_VINCULO_CONCUR as integer) as qtd_gestores_vinculo_concursado,
    cast(QT_GEST_BAS_VINCULO_CONTRA as integer) as qtd_gestores_vinculo_contrato,
    cast(QT_GEST_BAS_VINCULO_TERCEIR as integer) as qtd_gestores_vinculo_terceirizado,
    cast(QT_GEST_BAS_VINCULO_CLT as integer) as qtd_gestores_vinculo_clt,

    cast(QT_GEST_BAS_DIRETOR as integer) as qtd_gestores_diretor,
    cast(QT_GEST_BAS_OUTRO as integer) as qtd_gestores_outro_cargo,

    cast(QT_GEST_BAS_ACESSO_CARGO_PROP as integer) as qtd_gestores_acesso_proprietario,
    cast(QT_GEST_BAS_ACESSO_CARGO_INDIC as integer) as qtd_gestores_acesso_indicacao,
    cast(QT_GEST_BAS_ACESSO_CARGO_SEL as integer) as qtd_gestores_acesso_selecao,
    cast(QT_GEST_BAS_ACESSO_CARGO_CONC as integer) as qtd_gestores_acesso_concurso,
    cast(QT_GEST_BAS_ACESSO_CARGO_ELEIC as integer) as qtd_gestores_acesso_eleicao,
    cast(QT_GEST_BAS_ACESSO_CARGO_P_SEL as integer) as qtd_gestores_acesso_processo_seletivo,
    cast(QT_GEST_BAS_ACESSO_CARGO_OUTRO as integer) as qtd_gestores_acesso_outro,

    cast(QT_GEST_BAS_ESPEC_CRE as integer) as qtd_gestores_especializacao_creche,
    cast(QT_GEST_BAS_ESPEC_PRE_ESCOLA as integer) as qtd_gestores_especializacao_pre_escola,
    cast(QT_GEST_BAS_ESPEC_ANOS_INICIAIS as integer) as qtd_gestores_especializacao_anos_iniciais,
    cast(QT_GEST_BAS_ESPEC_ANOS_FINAIS as integer) as qtd_gestores_especializacao_anos_finais,
    cast(QT_GEST_BAS_ESPEC_ENS_MEDIO as integer) as qtd_gestores_especializacao_ensino_medio,
    cast(QT_GEST_BAS_ESPEC_EJA as integer) as qtd_gestores_especializacao_eja,
    cast(QT_GEST_BAS_ESPEC_ED_ESPECIAL as integer) as qtd_gestores_especializacao_educacao_especial,
    cast(QT_GEST_BAS_ESPEC_BIL_SURDOS as integer) as qtd_gestores_especializacao_bilingue_surdos,
    cast(QT_GEST_BAS_ESPEC_ED_INDIGENA as integer) as qtd_gestores_especializacao_educacao_indigena,
    cast(QT_GEST_BAS_ESPEC_CAMPO as integer) as qtd_gestores_especializacao_educacao_campo,
    cast(QT_GEST_BAS_ESPEC_AMBIENTAL as integer) as qtd_gestores_especializacao_educacao_ambiental,
    cast(QT_GEST_BAS_ESPEC_DIR_HUMANOS as integer) as qtd_gestores_especializacao_direitos_humanos,
    cast(QT_GEST_BAS_ESPEC_DIV_SEXUAL as integer) as qtd_gestores_especializacao_diversidade_sexual,
    cast(QT_GEST_BAS_ESPEC_DIR_ADOLESC as integer) as qtd_gestores_especializacao_direitos_crianca_adolescente,
    cast(QT_GEST_BAS_ESPEC_AFRO as integer) as qtd_gestores_especializacao_afro,
    cast(QT_GEST_BAS_ESPEC_GESTAO as integer) as qtd_gestores_especializacao_gestao_escolar,
    cast(QT_GEST_BAS_ESPEC_EDUC_TIC as integer) as qtd_gestores_especializacao_tic,
    cast(QT_GEST_BAS_ESPEC_OUTROS as integer) as qtd_gestores_especializacao_outros,
    cast(QT_GEST_BAS_ESPEC_NENHUM as integer) as qtd_gestores_sem_especializacao
from {{ source('raw_data', 'Tabela_Gestor_Escolar_2025') }}
where CO_ENTIDADE is not null