CREATE DATABASE IF NOT EXISTS movie;

CREATE TABLE movie.movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    duration_minutes INT,
    language VARCHAR(50),
    rating DECIMAL(3, 1),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE movie.genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE movie.movie_genre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

CREATE TABLE movie.director (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100)
);

CREATE TABLE movie.movie_director (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES director(director_id) ON DELETE CASCADE
);

CREATE TABLE movie.actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100),
    gender VARCHAR(10)
);

CREATE TABLE movie.movie_actor (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    role_name VARCHAR(255), -- Nama karakter yang diperankan
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON DELETE CASCADE
);

CREATE TABLE movie.review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    reviewer_name VARCHAR(255),
    review_text TEXT,
    rating DECIMAL(3, 1),
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

CREATE TABLE movie.studio (
    studio_id INT AUTO_INCREMENT PRIMARY KEY,
    studio_name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    founded_year INT
);

CREATE TABLE movie.movie_studio (
    movie_id INT NOT NULL,
    studio_id INT NOT NULL,
    PRIMARY KEY (movie_id, studio_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (studio_id) REFERENCES studio(studio_id) ON DELETE CASCADE
);
