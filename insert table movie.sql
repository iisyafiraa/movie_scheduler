INSERT INTO movie.movie (movie_id, title, release_date, language, description)
VALUES
(1, 'Inception', '2010-07-16', 'English', 'A mind-bending thriller about dreams.'),
(2, 'Parasite', '2019-05-30', 'Korean', 'A dark comedy about class struggle.'),
(3, 'Avengers: Endgame', '2019-04-26', 'English', 'The culmination of the Marvel saga.'),
(4, 'The Dark Knight', '2008-07-18', 'English', 'A tale of heroism and chaos in Gotham.'),
(5, 'Interstellar', '2014-11-07', 'English', 'A space odyssey to save humanity.'),
(6, 'La La Land', '2016-12-09', 'English', 'A romantic musical journey.'),
(7, 'Spirited Away', '2001-07-20', 'Japanese', 'A magical adventure in a spirit world.'),
(8, 'Joker', '2019-10-04', 'English', 'An origin story of the infamous villain.'),
(9, 'Coco', '2017-11-22', 'Spanish', 'A heartwarming story about family and music.'),
(10, 'The Matrix', '1999-03-31', 'English', 'A cyberpunk classic about reality and AI.');

INSERT INTO movie.genre (genre_id, genre_name)
VALUES
(1, 'Sci-Fi'),
(2, 'Drama'),
(3, 'Action'),
(4, 'Comedy'),
(5, 'Animation'),
(6, 'Musical'),
(7, 'Thriller'),
(8, 'Fantasy');

INSERT INTO movie.director (director_id, name, birth_date, nationality)
VALUES
(1, 'Christopher Nolan', '1970-07-30', 'British-American'),
(2, 'Bong Joon-ho', '1969-09-14', 'South Korean'),
(3, 'Anthony Russo', '1970-02-03', 'American'),
(4, 'Hayao Miyazaki', '1941-01-05', 'Japanese'),
(5, 'Damien Chazelle', '1985-01-19', 'American'),
(6, 'Todd Phillips', '1970-12-20', 'American'),
(7, 'Lana Wachowski', '1965-06-21', 'American');

INSERT INTO movie.actor (actor_id, name, birth_date, nationality, gender)
VALUES
(1, 'Leonardo DiCaprio', '1974-11-11', 'American', 'Male'),
(2, 'Song Kang-ho', '1967-01-17', 'South Korean', 'Male'),
(3, 'Robert Downey Jr.', '1965-04-04', 'American', 'Male'),
(4, 'Scarlett Johansson', '1984-11-22', 'American', 'Female'),
(5, 'Heath Ledger', '1979-04-04', 'Australian', 'Male'),
(6, 'Emma Stone', '1988-11-06', 'American', 'Female'),
(7, 'Chiwetel Ejiofor', '1977-07-10', 'British', 'Male'),
(8, 'Joaquin Phoenix', '1974-10-28', 'American', 'Male'),
(9, 'Keanu Reeves', '1964-09-02', 'Canadian', 'Male'),
(10, 'Rami Malek', '1981-05-12', 'American', 'Male');

INSERT INTO movie.studio (studio_id, studio_name, country, founded_year)
VALUES
(1, 'Warner Bros.', 'United States', 1923),
(2, 'CJ Entertainment', 'South Korea', 1995),
(3, 'Marvel Studios', 'United States', 1993),
(4, 'Studio Ghibli', 'Japan', 1985),
(5, 'Pixar Animation Studios', 'United States', 1986);

INSERT INTO movie.movie_genre (movie_id, genre_id)
VALUES
(1, 1), (1, 7), -- Inception
(2, 2),         -- Parasite
(3, 3), (3, 1), -- Avengers: Endgame
(4, 3), (4, 7), -- The Dark Knight
(5, 1),         -- Interstellar
(6, 6), (6, 2), -- La La Land
(7, 8), (7, 5), -- Spirited Away
(8, 2), (8, 7), -- Joker
(9, 5), (9, 2), -- Coco
(10, 1), (10, 7); -- The Matrix

INSERT INTO movie.movie_director (movie_id, director_id)
VALUES
(1, 1), -- Christopher Nolan untuk Inception
(2, 2), -- Bong Joon-ho untuk Parasite
(3, 3), -- Anthony Russo untuk Avengers: Endgame
(4, 1), -- Christopher Nolan untuk The Dark Knight
(5, 1), -- Christopher Nolan untuk Interstellar
(6, 5), -- Damien Chazelle untuk La La Land
(7, 4), -- Hayao Miyazaki untuk Spirited Away
(8, 6), -- Todd Phillips untuk Joker
(9, 4), -- Studio Ghibli untuk Coco
(10, 7); -- Lana Wachowski untuk The Matrix

INSERT INTO movie.movie_actor (movie_id, actor_id, role_name)
VALUES
(1, 1, 'Dom Cobb'),
(2, 2, 'Kim Ki-taek'),
(3, 3, 'Tony Stark'), (3, 4, 'Natasha Romanoff'),
(4, 5, 'Joker'),
(6, 6, 'Mia Dolan'),
(7, 7, 'Chihiro Ogino'),
(8, 8, 'Arthur Fleck'),
(9, 6, 'Miguel'),
(10, 9, 'Neo');

INSERT INTO movie.movie_studio (movie_id, studio_id)
VALUES
(1, 1), (2, 2), (3, 3), -- Warner Bros, CJ, Marvel Studios
(4, 1), -- Warner Bros.
(5, 1), -- Warner Bros.
(6, 5), -- Pixar
(7, 4), -- Studio Ghibli
(8, 1), -- Warner Bros.
(9, 5), -- Pixar
(10, 1); -- Warner Bros.

INSERT INTO movie.review (review_id, movie_id, reviewer_name, review_text, rating, review_date)
VALUES
(1, 1, 'John Doe', 'Amazing visuals!', 9.0, '2020-01-15'),
(2, 2, 'Jane Smith', 'Masterpiece!', 9.5, '2020-01-20'),
(3, 3, 'Alex Lee', 'Epic conclusion.', 8.5, '2020-01-25'),
(4, 4, 'Kim Soo', 'Best Batman movie.', 9.8, '2020-02-01'),
(5, 5, 'Liam Neeson', 'Brilliant concept.', 8.7, '2020-02-10'),
(6, 6, 'Emily Blunt', 'Heartwarming.', 9.2, '2020-02-15'),
(7, 7, 'Hiro Yuki', 'Magical experience.', 9.6, '2020-02-20'),
(8, 8, 'Oscar Wild', 'Chilling story.', 9.0, '2020-02-25'),
(9, 9, 'Maya Lee', 'Touching tale.', 9.4, '2020-03-01'),
(10, 10, 'Neo Chan', 'Groundbreaking.', 9.1, '2020-03-05');
