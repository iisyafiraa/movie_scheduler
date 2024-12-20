import os
import pandas as pd
from airflow.providers.mysql.hooks.mysql import MySqlHook

def extract_table(table, **kwargs):

    data_interval_start = kwargs['data_interval_start']
    data_interval_end   = kwargs['data_interval_end']
    ingestion_mode  = kwargs["params"][table]

    engine  = MySqlHook("mysql_dibimbing").get_sqlalchemy_engine()
    with engine.connect() as conn:
        
        timestamp_cols  = pd.read_sql(f"""
                SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'movie'
                    AND DATA_TYPE IN ('date','datetime','timestamp')
                    AND TABLE_NAME = '{table}'
            """, conn).COLUMN_NAME.tolist()
        
        print("Timestamp Column: ", timestamp_cols)

        query = f"SELECT *, CURRENT_TIMESTAMP as extracted_at FROM movie.{table}"
        if ingestion_mode == "incremental" and timestamp_cols:
            query += " WHERE "
            query += " OR ".join(f"{col} BETWEEN '{data_interval_start}' AND '{data_interval_end}'" for col in timestamp_cols)

        print("query:", query)

        df = pd.read_sql(query, conn)
        print(df)
    
    os.makedirs(f"data/assignment/{table}", exist_ok=True)
    df.to_parquet(f"data/assignment/{table}/{data_interval_start}_{data_interval_end}_{ingestion_mode}.parquet", index=False)
