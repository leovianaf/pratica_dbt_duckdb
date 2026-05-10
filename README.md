# Atividade prática Modelagem + DBT

## Pergunta de Pesquisa (UF = BA)

**Pergunta:** Nas escolas da Bahia (BA) em 2025, escolas com maior nível de complexidade de gestão apresentam maior proporção de docentes em altos níveis de esforço (níveis 5+6)?

**Hipótese:** Escolas com maior `nivel_complexidade_gestao` têm maior `pct_docentes_alto_esforco`.

**Fontes utilizadas:**

- `ICG_ESCOLAS_2025` (Indicador de Complexidade de Gestão)
- `IED_ESCOLAS_2025` (Indicador de Esforço Docente)
- `Tabela_Gestor_Escolar_2025` (Perfil dos gestores)

**Métrica esperada:** Média/mediana de `pct_docentes_alto_esforco` por nível de `nivel_complexidade_gestao`.

---

## 1. Como rodar a Staging

### 1.1 Preparar ambiente

```bash
source venv/bin/activate
pip install -r requirements.txt
```

### 1.2 Carregar dados brutos no DuckDB (raw_data)

```bash
python 01_inserir_dados.py
```

### 1.3 Rodar modelos da staging

```bash
dbt run --select staging
```

### 1.4 Testar staging

```bash
dbt test --select staging
```

### 1.5 Validar tabelas geradas

```bash
python 01.1_validar_duck_db.py
```

Schemas esperados nesta etapa:

- `raw_data` (tabelas brutas)
- `main_staging` (modelos dbt da camada staging)

## 2. Como rodar a Intermediate

### 2.1 Rodar modelos da intermediate

```bash
dbt run --select intermediate
```

### 2.2 Testar intermediate

```bash
dbt test --select intermediate
```

### 2.3 Rodar sanity checks

Use o notebook de validação da intermediate (`02_checks_intermediate.ipynb`) para conferir:

- filtro de UF = BA
- contagens staging vs intermediate
- percentual de nulos em colunas-chave
- consistência dos joins e hipótese preliminar

### 2.4 Gerar documentação dbt

```bash
dbt docs generate
dbt docs serve
```

Schema esperado nesta etapa:

- `main_intermediate` (modelos intermediários para BA)
