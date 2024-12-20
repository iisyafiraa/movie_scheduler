-- Membuat tabel silver_assignment.movie_studio jika belum ada
DROP TABLE IF EXISTS silver_assignment.movie_studio;

CREATE TABLE silver_assignment.movie_studio (
    movie_id INT NOT NULL,
    studio_id INT NOT NULL,
    PRIMARY KEY (movie_id, studio_id),
    FOREIGN KEY (movie_id) REFERENCES silver_assignment.movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (studio_id) REFERENCES silver_assignment.studio(studio_id) ON DELETE CASCADE
);

-- Menyusun data dari raw_movie_studio_data ke silver_assignment.movie_studio
INSERT INTO silver_assignment.movie_studio (movie_id, studio_id)
SELECT
    movie_id,
    studio_id
FROM bronze_assignment.movie_studio
WHERE movie_id IN (SELECT movie_id FROM silver_assignment.movie)
AND studio_id IN (SELECT studio_id FROM silver_assignment.studio);
