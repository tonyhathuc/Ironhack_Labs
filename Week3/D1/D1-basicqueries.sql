USE sakila;
SHOW TABLES;
DESCRIBE film;
SELECT * FROM film;
-- all rows, selected columns
SELECT title, rating, length FROM film;
-- distinct listing of ratings
SELECT DISTINCT rating
FROM film
ORDER BY rating;
-- one criteria
SELECT title, rating, length
FROM film
WHERE rating = "R";
-- one or more criteria
SELECT title, rating, length
FROM film 
WHERE rating ="R" OR length < 75;

-- multiple criteria
SELECT title, rating, length
FROM film
WHERE rating = "R" AND length < 75;

-- shortcut for OR
SELECT title, rating, length
FROM film
WHERE rating IN ("R", "NC-17");

-- sorting 
SELECT title, rating, length
FROM film
WHERE rating IN ("R", "NC-17")
ORDER BY length DESC;

