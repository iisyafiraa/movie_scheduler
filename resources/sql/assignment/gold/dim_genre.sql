DROP TABLE IF EXISTS gold_assignment.dim_genre;

CREATE TABLE gold_assignment.dim_genre AS
SELECT
    genre_id,
    genre_name
FROM silver_assignment.genre;