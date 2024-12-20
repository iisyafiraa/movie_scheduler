-- Membuat tabel silver_assignment.movie_genre jika belum ada
DROP TABLE IF EXISTS silver_assignment.movie_genre;

CREATE TABLE silver_assignment.movie_genre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES silver_assignment.movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES silver_assignment.genre(genre_id) ON DELETE CASCADE
);

-- Menyusun data dari raw_movie_genre_data ke silver_assignment.movie_genre
INSERT INTO silver_assignment.movie_genre (movie_id, genre_id)
SELECT
    movie_id,
    genre_id
FROM bronze_assignment.movie_genre
WHERE movie_id IN (SELECT movie_id FROM silver_assignment.movie)
AND genre_id IN (SELECT genre_id FROM silver_assignment.genre);
