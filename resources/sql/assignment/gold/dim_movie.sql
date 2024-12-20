DROP TABLE IF EXISTS gold_assignment.dim_movie;
CREATE TABLE gold_assignment.dim_movie AS
SELECT
    movie_id,
    title,
    release_date,
    duration_minutes,
    language,
    description
FROM silver_assignment.movie;
