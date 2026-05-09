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
    cast(COMPLEX as integer) as nivel_complexidade_gestao
from {{ source('raw_data', 'ICG_ESCOLAS_2025') }}
where CO_ENTIDADE is not null