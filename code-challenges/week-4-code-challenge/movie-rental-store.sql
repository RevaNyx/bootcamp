CREATE TABLE movies (
	id serial PRIMARY KEY,
	title TEXT NOT NULL,
	genre TEXT NOT NULL,
	release_year INT NOT NULL,
	rating TEXT CHECK (rating IN ('G', 'PG', 'PG-13', 'R'))
);


CREATE TABLE Rentals (
	id SERIAL PRIMARY KEY,
	movie_id INT NOT NULL,
	rental_date DATE NOT NULL,
	return_date DATE,
	customer_id INT NOT NULL,
	cost DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES Movies(id)
);

-- Movies table data
INSERT INTO Movies (title, genre, release_year, rating) VALUES
('Inception', 'Action', 2010, 'PG-13'),
('Toy Story', 'Animation', 1995, 'G'),
('The Godfather', 'Crime', 1972, 'R'),
('The Dark Knight', 'Action', 2008, 'PG-13'),
('Pulp Fiction', 'Crime', 1994, 'R'),
('The Lion King', 'Animation', 1994, 'G'),
('Forrest Gump', 'Drama', 1994, 'PG-13'),
('The Matrix', 'Sci-Fi', 1999, 'R'),
('The Shawshank Redemption', 'Drama', 1994, 'R'),
('The Avengers', 'Action', 2012, 'PG-13'),
('Interstellar', 'Sci-Fi', 2014, 'PG-13'),
('Parasite', 'Thriller', 2019, 'R'),
('The Incredibles', 'Animation', 2004, 'PG'),
('Jurassic Park', 'Adventure', 1993, 'PG-13'),
('The Silence of the Lambs', 'Horror', 1991, 'R'),
('Gladiator', 'Action', 2000, 'R'),
('Titanic', 'Romance', 1997, 'PG-13'),
('Avatar', 'Sci-Fi', 2009, 'PG-13'),
('A Beautiful Mind', 'Drama', 2001, 'PG-13'),
('Shrek', 'Animation', 2001, 'PG');

-- Rentals table data
INSERT INTO Rentals (movie_id, rental_date, return_date, customer_id, cost) VALUES
(1, '2023-08-15', '2023-08-18', 1001, 4.99),
(2, '2023-07-10', '2023-07-12', 1002, 2.99),
(3, '2023-06-25', '2023-06-30', 1003, 3.99),
(4, '2023-05-14', '2023-05-17', 1004, 4.49),
(5, '2023-04-22', '2023-04-25', 1005, 3.99),
(6, '2023-03-10', '2023-03-12', 1006, 2.99),
(7, '2023-09-05', '2023-09-07', 1007, 3.49),
(8, '2023-10-01', '2023-10-05', 1008, 4.99),
(9, '2023-02-14', '2023-02-17', 1009, 4.49),
(10, '2023-01-20', '2023-01-22', 1010, 3.99),
(11, '2023-04-10', '2023-04-12', 1011, 3.49),
(12, '2023-07-08', '2023-07-09', 1012, 5.99),
(13, '2023-08-14', '2023-08-15', 1013, 2.99),
(14, '2023-06-12', '2023-06-13', 1014, 3.99),
(15, '2023-05-08', '2023-05-10', 1015, 4.99),
(16, '2023-03-02', '2023-03-04', 1016, 4.49),
(17, '2023-11-20', '2023-11-22', 1017, 4.99),
(18, '2023-09-30', '2023-10-01', 1018, 5.99),
(19, '2023-10-11', '2023-10-12', 1019, 2.99),
(20, '2023-11-04', '2023-11-05', 1020, 3.99);

--Basic Queries
--List all movies, showing title and genre
SELECT title, genre
FROM movies;

--Find all rentals that occured in the past year
SELECT *
FROM rentals
WHERE rental_date >= CURRENT_DATE - INTERVAL '1 year';

--Filtering Queries
--Retrieve all movies released between 2000 and 2015
SELECT title, release_year
FROM movies
WHERE release_year >= 2000 AND release_year <= 2015;

--Find all movies with a rating of 'PG-13' or 'R'
SELECT title, rating
FROM movies
WHERE rating = 'PG-13' OR rating = 'R';

--Advanced Filtering
--Find rentals where the rental cost is between $3 and $5
SELECT title, cost
FROM movies
JOIN rentals ON movies.id = rentals.movie_id
WHERE rentals.cost BETWEEN 3 AND 5;

--List all movies with genres that contain the word "Action" (use LIKE).
SELECT title, genre
FROM movies
WHERE genre ILIKE '%action%';


SELECT *
FROM rentals
ORDER BY rental_date DESC
LIMIT 3;


SELECT title, rating
FROM movies
ORDER BY rating DESC, title ASC
LIMIT 2;


SELECT title AS "Title", release_year AS "Year Released"
FROM movies;

SELECT m.title, r.rental_date
FROM movies m
JOIN rentals r ON m.id = r.movie_id;

SELECT m.title, COUNT(r.id) AS rental_count
FROM movies m
LEFT JOIN rentals r ON m.id = r.movie_id
GROUP BY m.title;

SELECT m.genre, COUNT(r.id) AS rental_count
FROM movies m
JOIN rentals r ON m.id = r.movie_id
GROUP BY m.genre;


SELECT m.rating, AVG(r.cost) AS average_cost
FROM movies m
JOIN rentals r ON m.id = r.movie_id
GROUP BY m.rating;


SELECT m.title
FROM movies m
JOIN rentals r ON m.id = r.movie_id
GROUP BY m.id
HAVING COUNT(r.id) > 2;

