-- Lab | SQL Intro
-- In this lab, you will be using the Sakila database of movie rentals. 
-- You can follow the steps listed here to get the data locally: Sakila sample database - installation.
--  You can work with two sql query files - sakila-schema.sql (creates the schema) + sakila-data.sql which inserts the data.

-- INSTRUCTIONS
-- 1. Review the tables in the database. √
USE sakila;
SHOW TABLES;

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client. √
SELECT * 
FROM actor;

SELECT * 
FROM city;

-- etc.

-- 3. Select one column from a table. Get film titles. √
SELECT title
FROM film;

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. √
-- Note that we are not asking you to obtain the language per each film, 
-- but this is a good time to think about how you might get that information in the future. √
SELECT DISTINCT name AS languages
FROM language;


-- 5. Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? 
-- A. How many records are returned?
SELECT DISTINCT
    COUNT(return_date) AS returned_records, rental_id
FROM
    rental
GROUP BY rental_id;

-- seems like 1001 records were returned

-- or below
SELECT 
    COUNT(return_date)
FROM
    rental;
-- 15861 rows returnt

SELECT 
    COUNT(DISTINCT return_date)
FROM
    rental;
-- 15836 rows returned (without the null values) and these are returnt rows



SELECT *
FROM staff;
-- the query above gave us 2 employees with staff_id 1 and 2 and names such as Mike Hilyer and Jon Stephens
-- there are 2 store_id, 1 and 2, from that I assume there are only 2 stores
-- in total the company has 2 staff members (if we do not count management staff in that), and 2 stores

SELECT COUNT(store_id)
FROM  store; 
-- we can also run this query above to check the count of stores (through store_id)

SELECT DISTINCT COUNT(manager_staff_id)
FROM store;
-- this query above will return the count of manager staff

-- Can you return a list of employee first names only?
SELECT first_name
FROM staff;
-- there are 2 employees and their names are Mike and John


-- 6. Bonus: How many unique days did customers rent movies in this dataset?
-- solve this later, make a note