-- Membuat tabel silver_assignment.movie_actor jika belum ada
DROP TABLE IF EXISTS silver_assignment.movie_actor;

CREATE TABLE silver_assignment.movie_actor (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    role_name VARCHAR(255),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES silver_assignment.movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES silver_assignment.actor(actor_id) ON DELETE CASCADE
);

-- Menyusun data dari raw_movie_actor_data ke silver_assignment.movie_actor
INSERT INTO silver_assignment.movie_actor (movie_id, actor_id, role_name)
SELECT
    movie_id,
    actor_id,
    role_name
FROM bronze_assignment.movie_actor
WHERE movie_id IN (SELECT movie_id FROM silver_assignment.movie)
AND actor_id IN (SELECT actor_id FROM silver_assignment.actor);
