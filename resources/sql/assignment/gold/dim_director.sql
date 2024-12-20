DROP TABLE IF EXISTS gold_assignment.dim_director;

CREATE TABLE gold_assignment.dim_director AS
SELECT
    director_id,
    name,
    birth_date,
    nationality
FROM silver_assignment.director;
