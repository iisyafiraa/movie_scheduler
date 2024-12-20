-- Membuat tabel silver_assignment.movie jika belum ada
ALTER TABLE silver_assignment.movie_actor DROP CONSTRAINT IF EXISTS movie_actor_movie_id_fkey;
ALTER TABLE silver_assignment.movie_director DROP CONSTRAINT IF EXISTS movie_director_movie_id_fkey;
ALTER TABLE silver_assignment.movie_genre DROP CONSTRAINT IF EXISTS movie_genre_movie_id_fkey;
ALTER TABLE silver_assignment.movie_studio DROP CONSTRAINT IF EXISTS movie_studio_movie_id_fkey;
ALTER TABLE silver_assignment.review DROP CONSTRAINT IF EXISTS review_movie_id_fkey;

DROP TABLE IF EXISTS silver_assignment.movie;

CREATE TABLE silver_assignment.movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    duration_minutes INT,
    language VARCHAR(50),
    description TEXT
);

-- Menyusun data dari raw_movie_data ke silver_assignment.movie
INSERT INTO silver_assignment.movie (movie_id, title, release_date, duration_minutes, language, description)
SELECT
    CAST(movie_id AS INTEGER) AS movie_id,
    title,
    TO_DATE(release_date, 'YYYY-MM-DD') AS release_date,  -- Menstandarkan format tanggal
    CAST(duration_minutes AS INTEGER) AS duration_number,
    language,
    description
FROM bronze_assignment.movie
WHERE title IS NOT NULL AND release_date IS NOT NULL;
