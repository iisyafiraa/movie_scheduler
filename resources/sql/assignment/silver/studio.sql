-- Membuat tabel silver_assignment.studio jika belum ada
ALTER TABLE silver_assignment.movie_studio DROP CONSTRAINT IF EXISTS movie_studio_movie_id_fkey;
ALTER TABLE silver_assignment.movie_studio DROP CONSTRAINT IF EXISTS movie_studio_studio_id_fkey;

DROP TABLE IF EXISTS silver_assignment.studio;

CREATE TABLE silver_assignment.studio (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    founded_year INT CHECK (founded_year > 0)  -- Menambahkan validasi bahwa founded_year harus lebih besar dari 0
);

-- Menyusun data dari raw_studio_data ke silver_assignment.studio
INSERT INTO silver_assignment.studio (studio_id, studio_name, country, founded_year)
SELECT
    studio_id,
    studio_name,
    country,
    CASE 
        WHEN founded_year > 0 THEN founded_year
        ELSE NULL  -- Tahun yang tidak valid diganti dengan NULL
    END AS founded_year
FROM bronze_assignment.studio
WHERE studio_name IS NOT NULL;  -- Memastikan bahwa studio_name tidak kosong
