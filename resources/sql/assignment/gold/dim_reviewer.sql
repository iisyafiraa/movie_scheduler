DROP TABLE IF EXISTS gold_assignment.dim_reviewer;

CREATE TABLE gold_assignment.dim_reviewer AS
SELECT
    reviewer_id,
    reviewer_name
FROM silver_assignment.review;