import duckdb

con = duckdb.connect("project_data.duckdb")

print("Schemas encontrados:")
schemas = con.execute("show schemas").fetchall()
print(schemas)

print("\nTabelas de staging encontradas:")
df_staging = con.execute("""
    select table_schema, table_name
    from information_schema.tables
    where table_schema like '%staging%'
    order by table_name
""").fetchdf()

print(df_staging)

for tabela in ["stg_icg_escolas", "stg_ied_escolas", "stg_gestor_escolar"]:
    print(f"\n--- {tabela} ---")
    print(con.execute(f"select * from main_staging.{tabela} limit 5").fetchdf())

con.close()