-- 1. In the actor table, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd,
-- Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. 
-- So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
-- first I want to get an overview of the table
SELECT 
    *
FROM
    sakila.actor act;
-- coming up with a query
SELECT 
    COUNT(act.last_name) AS unique_last_name, last_name
FROM
    sakila.actor act
GROUP BY act.last_name
HAVING COUNT(*) = 1;

-- 2. Which last names appear more than once?
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
-- run this query to get an overview
SELECT 
    *
FROM
    sakila.actor act;
-- coming up with a query
SELECT 
    COUNT(act.last_name) AS unique_last_name, last_name
FROM
    sakila.actor act
GROUP BY act.last_name
HAVING COUNT(*) > 1;

-- 3.Using the rental table, find out how many rentals were processed by each employee.
-- this query is for overview
SELECT 
    *
FROM
    sakila.rental;
-- this query to find out the number of processed rentals by each employee
SELECT 
    COUNT(rental_id), staff_id
FROM
    sakila.rental r
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year
-- run this for overview
SELECT 
    *
FROM
    sakila.film f;

-- crafted query

SELECT 
    COUNT(title) AS AmountOfMOvies, release_year
FROM
    sakila.film f
GROUP BY release_year;

-- 1000 titles in release_year 2006

-- 5. Using the film table, find out for each rating how many films were there.
-- overview
SELECT 
    *
FROM
    sakila.film f;
-- crafted query
SELECT 
    COUNT(title), rating
FROM
    sakila.film f
GROUP BY rating;

-- 6. What is the average length of films for each rating? Round off the average lengths to two decimal places.
-- overview
SELECT 
    *
FROM
    sakila.film f;

-- crafted query
SELECT 
    ROUND(AVG(length), 2) AS AverageLength, f.rating
FROM
    sakila.film f
GROUP BY f.rating;

-- 7. Which kind of movies (based on rating) have an average duration of two hours or more?
-- overview
SELECT 
    *
FROM
    sakila.film f;
-- crafted query
SELECT 
    f.rating,
    f.description,
    ROUND(AVG(length), 2) AS AverageLength
FROM
    sakila.film f
GROUP BY f.rating , f.description
HAVING AVG(length) > 120
ORDER BY AVG(length);
