-- Membuat tabel silver_assignment.review jika belum ada
DROP TABLE IF EXISTS silver_assignment.review;

CREATE TABLE silver_assignment.review (
    review_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    reviewer_name VARCHAR(255) NOT NULL,
    review_text TEXT,
    rating INT CHECK (rating BETWEEN 0 AND 10),  -- Membatasi rating antara 0 dan 10
    review_date TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES silver_assignment.movie(movie_id) ON DELETE CASCADE
);

-- Menyusun data dari raw_review_data ke silver_assignment.review
INSERT INTO silver_assignment.review (review_id, movie_id, reviewer_name, review_text, rating, review_date)
SELECT
    CAST(review_id AS INTEGER) review_id,
    CAST(movie_id AS INTEGER) movie_id,
    reviewer_name,
    review_text,
    CASE
        WHEN CAST(rating AS INTEGER) BETWEEN 0 AND 10 THEN CAST(rating AS INTEGER)
        ELSE NULL  -- Rating yang tidak valid diganti dengan NULL
    END AS rating,
    TO_TIMESTAMP(review_date, 'YYYY-MM-DD HH24:MI:SS') AS review_date  -- Menstandarkan format tanggal
FROM bronze_assignment.review;
