select
    cast(NU_ANO_CENSO as integer) as ano_censo,
    trim(NO_REGIAO) as nome_regiao,
    upper(trim(SG_UF)) as uf,
    cast(CO_MUNICIPIO as integer) as id_municipio,
    trim(NO_MUNICIPIO) as nome_municipio,
    cast(CO_ENTIDADE as integer) as id_escola,
    trim(NO_ENTIDADE) as nome_escola,
    trim(NO_CATEGORIA) as localizacao_escola,
    trim(NO_DEPENDENCIA) as dependencia_administrativa,

    try_cast(FUN_CAT_1 as double) as pct_docentes_esforco_nivel_1,
    try_cast(FUN_CAT_2 as double) as pct_docentes_esforco_nivel_2,
    try_cast(FUN_CAT_3 as double) as pct_docentes_esforco_nivel_3,
    try_cast(FUN_CAT_4 as double) as pct_docentes_esforco_nivel_4,
    try_cast(FUN_CAT_5 as double) as pct_docentes_esforco_nivel_5,
    try_cast(FUN_CAT_6 as double) as pct_docentes_esforco_nivel_6
from {{ source('raw_data', 'IED_ESCOLAS_2025') }}
where CO_ENTIDADE is not null