DROP TABLE IF EXISTS gold_assignment.dim_studio;

CREATE TABLE gold_assignment.dim_studio AS
SELECT
    studio_id,
    studio_name,
    country,
    founded_year
FROM silver_assignment.studio;