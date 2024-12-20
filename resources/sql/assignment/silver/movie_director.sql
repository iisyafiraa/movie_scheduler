-- Membuat tabel silver_assignment.movie_director jika belum ada
DROP TABLE IF EXISTS silver_assignment.movie_director;

CREATE TABLE silver_assignment.movie_director (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES silver_assignment.movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES silver_assignment.director(director_id) ON DELETE CASCADE
);

-- Menyusun data dari raw_movie_director_data ke silver_assignment.movie_director
INSERT INTO silver_assignment.movie_director (movie_id, director_id)
SELECT
    movie_id,
    director_id
FROM bronze_assignment.movie_director
WHERE movie_id IN (SELECT movie_id FROM silver_assignment.movie)
AND director_id IN (SELECT director_id FROM silver_assignment.director);