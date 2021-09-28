USE sakila;
-- 1. Select all the actors with the first name 'Scarlett'.
SELECT 
    *
FROM
    actor a
WHERE
    first_name = 'Scarlett';
-- 2. How many films (movies) are available for rent?
-- let's get an overview first
select *
from rental;

-- we count the rows of inventory_id that don't have NULL values
SELECT 
    COUNT(inventory_id) AS AmountOfMoviesAvailable
FROM
    rental
WHERE
    return_date IS NOT NULL;
-- 15861 movies are available for rent



-- b. and how many films have been rented?
-- let's check the rows of rental_date and return-date
SELECT 
    (COUNT(DISTINCT rental_date) - COUNT(DISTINCT return_date)) AS rented_films
FROM
    rental;
-- 21 movies have been rented

-- or

SELECT 
    COUNT(inventory_id) AS AmountOfMoviesOnRent
FROM
    rental
WHERE
    return_date IS NULL;
-- this will return 183 rows, so 183 DVD have been rented


-- 3. What are the shortest and longest movie duration?
SELECT 
    MIN(length) AS min_duration, MAX(length) AS max_duration
FROM
    film f;
-- min_duration is 46
-- max_duration is 185

-- 4. What's the average movie duration expressed in format (hours, minutes) 
-- Return the result as columns with the names hours and minutes.

SELECT 
    length,
    FLOOR(AVG(f.length) / 60) AS hours,
    FLOOR(AVG(f.length) % 60) AS min
FROM
    film f;

-- 5. How many distinct (different) actors' last names are there?
SELECT count(DISTINCT last_name) as NumbersOfUniqeLastName
FROM actor;
-- 121 actors approx

-- 6. Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table

SELECT 
    DATEDIFF(MIN(rental_date), MAX(return_date)) AS OperatingDays
FROM
    rental;
-- 101 days

-- 7. Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.



-- 8: Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    *, DAYOFWEEK(rental_date) AS WORKDAY
FROM
    rental
WHERE
    DAYOFWEEK(rental_date) NOT IN (1 , 7);
-- try to turn this into a CTE or subquery later

SELECT 
    *, DAYOFWEEK(rental_date) AS WEEKEND
FROM
    rental
WHERE
    DAYOFWEEK(rental_date) IN (1 , 7);


-- 9: How many rentals were made in the last month of renting activity? 
-- search for last year
SELECT 
    YEAR(MAX(rental_date))
FROM
    rental;

-- get the latest year and month 
SELECT 
    YEAR(MAX(r.rental_date)),
    MONTH(MAX(r.rental_date)) AS LastRent
FROM
    sakila.rental r;


