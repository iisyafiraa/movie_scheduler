DROP TABLE IF EXISTS gold_assignment.dim_actor;

CREATE TABLE gold_assignment.dim_actor AS
SELECT
    actor_id,
    name,
    birth_date,
    nationality,
    gender
FROM silver_assignment.actor;
