-- Membuat tabel silver_assignment.director jika belum ada
ALTER TABLE silver_assignment.movie_director DROP CONSTRAINT IF EXISTS movie_director_movie_id_fkey;
ALTER TABLE silver_assignment.movie_director DROP CONSTRAINT IF EXISTS movie_director_director_id_fkey;

DROP TABLE IF EXISTS silver_assignment.director;

CREATE TABLE silver_assignment.director (
    director_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100)
);

-- Menyusun data dari raw_director_data ke silver_assignment.director
INSERT INTO silver_assignment.director (director_id, name, birth_date, nationality)
SELECT
    CAST(director_id AS INT) AS director_id,
    name,
    TO_DATE(birth_date, 'YYYY-MM-DD') AS birth_date,  -- Menstandarkan format tanggal
    nationality
FROM bronze_assignment.director
WHERE name IS NOT NULL AND birth_date IS NOT NULL;
