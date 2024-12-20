-- Membuat tabel silver_assignment.genre jika belum ada
ALTER TABLE silver_assignment.movie_genre DROP CONSTRAINT IF EXISTS movie_genre_movie_id_fkey;
ALTER TABLE silver_assignment.movie_genre DROP CONSTRAINT IF EXISTS movie_genre_genre_id_fkey;

DROP TABLE IF EXISTS silver_assignment.genre;

CREATE TABLE silver_assignment.genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) UNIQUE NOT NULL
);

-- Menyusun data dari raw_genre_data ke silver_assignment.genre
INSERT INTO silver_assignment.genre (genre_id, genre_name)
SELECT
    genre_id,
    genre_name
FROM bronze_assignment.genre
WHERE genre_name IS NOT NULL;
