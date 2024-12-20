import pytz
import yaml
from datetime import datetime, timedelta
from airflow.models.param import Param
from airflow.decorators import dag, task
from airflow.operators.empty import EmptyOperator
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from resources.scripts.assignment.extract import extract_table
from resources.scripts.assignment.load import load_table

with open("dags/resources/config/assignment.yaml", "r") as f:
    config = yaml.safe_load(f)

@dag(
    schedule_interval = "15 9-21/2 * * 5#1,5#3",
    start_date        = datetime(2024, 12, 1, tzinfo=pytz.timezone("Asia/Jakarta")),
    catchup           = False,
    params            = {
        table: Param("incremental", description="incremental / full", enum=["full", "incremental"]
)
        for table in config["tables"]
   }
)
def movie_scheduler():
    start_task          = EmptyOperator(task_id="start_task")
    wait_el_task        = EmptyOperator(task_id="wait_el_task")
    wait_transform_task = EmptyOperator(task_id="wait_transform_task")
    end_task            = EmptyOperator(task_id="end_task")

    # Extract-Load Process
    for table in config.get("tables", []):
        extract = task(extract_table, task_id=f"extract.{table}")
        load    = task(load_table, task_id=f"load.{table}")

        start_task >> extract(table) >> load(table) >> wait_el_task
    
    # Transform Process
    for filepath in config.get("transformation", []):
        transform   = SQLExecuteQueryOperator(
            task_id = f"transform.{filepath.split('/')[-1]}",
            conn_id = "postgres_dibimbing",
            sql     = filepath,
            retries = 5,
            retry_delay = timedelta(minutes=5)
        )

        wait_el_task >> transform >> wait_transform_task
    
    # Datamart
    for filepath in config.get("datamart", []):
        datamart = SQLExecuteQueryOperator(
            task_id = f"datamart.{filepath.split('/')[-1]}",
            conn_id = "postgres_dibimbing",
            sql     = filepath,
       )

        wait_transform_task >> datamart >> end_task

movie_scheduler()