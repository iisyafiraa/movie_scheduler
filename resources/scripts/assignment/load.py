import pandas as pd
from airflow.providers.postgres.hooks.postgres import PostgresHook

def load_table(table, **kwargs):

    data_interval_start = kwargs['data_interval_start']
    data_interval_end   = kwargs['data_interval_end']
    ingestion_mode  = kwargs["params"][table]

    df = pd.read_parquet(f"data/assignment/{table}/{data_interval_start}_{data_interval_end}_{ingestion_mode}.parquet")

    engine = PostgresHook("postgres_dibimbing").get_sqlalchemy_engine()
    with engine.connect() as conn:
        # Lock table before inserting
        conn.execute(f"LOCK TABLE bronze_assignment.{table} IN ACCESS EXCLUSIVE MODE;")
        
        if ingestion_mode == "incremental":
            if_exists = "replace"
        else:
            if_exists = "append"
        
        df.to_sql(table, conn, schema="bronze_assignment", index=False, if_exists=if_exists)