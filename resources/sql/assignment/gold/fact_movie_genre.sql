DROP TABLE IF EXISTS gold_assignment.fact_movie_performance;

-- Membuat fact_movie_performance di gold_assignment schema
CREATE TABLE gold_assignment.fact_movie_performance AS
SELECT
    m.movie_id,
    m.title,
    m.release_date,
    m.duration_minutes,
    m.language,
    g.genre_name,
    a.name AS actor_name,
    d.name AS director_name,
    rv.reviewer_name,
    rv.rating AS review_rating,
    rv.review_date,
    s.studio_name,
    COUNT(rv.review_id) AS total_reviews,
    AVG(rv.rating) AS average_rating
FROM silver_assignment.movie m
LEFT JOIN silver_assignment.movie_genre mg ON m.movie_id = mg.movie_id
LEFT JOIN silver_assignment.genre g ON mg.genre_id = g.genre_id
LEFT JOIN silver_assignment.movie_actor ma ON m.movie_id = ma.movie_id
LEFT JOIN silver_assignment.actor a ON ma.actor_id = a.actor_id
LEFT JOIN silver_assignment.movie_director md ON m.movie_id = md.movie_id
LEFT JOIN silver_assignment.director d ON md.director_id = d.director_id
LEFT JOIN silver_assignment.movie_studio ms ON m.movie_id = ms.movie_id
LEFT JOIN silver_assignment.studio s ON ms.studio_id = s.studio_id
LEFT JOIN silver_assignment.review rv ON m.movie_id = rv.movie_id
GROUP BY
    1,2,3,4,5,6,7,8,9,10,11,12;
