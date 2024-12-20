-- Membuat tabel silver_assignment.actor jika belum ada
ALTER TABLE silver_assignment.movie_actor DROP CONSTRAINT IF EXISTS movie_actor_movie_id_fkey;
ALTER TABLE silver_assignment.movie_actor DROP CONSTRAINT IF EXISTS movie_actor_actor_id_fkey;

DROP TABLE IF EXISTS silver_assignment.actor;

CREATE TABLE silver_assignment.actor (
    actor_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100),
    gender VARCHAR(10)
);

-- Menyusun data dari raw_actor_data ke silver_assignment.actor
INSERT INTO silver_assignment.actor (actor_id, name, birth_date, nationality, gender)
SELECT
    CAST(actor_id AS INT) AS actor_id,
    name,
    TO_DATE(birth_date, 'YYYY-MM-DD') AS birth_date,  -- Menstandarkan format tanggal
    nationality,
    CASE
        WHEN gender IN ('Male', 'Female', 'Other') THEN gender
        ELSE 'Unknown'  -- Mengganti gender yang tidak dikenal dengan 'Unknown'
    END AS gender
FROM bronze_assignment.actor
WHERE name IS NOT NULL AND birth_date IS NOT NULL;
