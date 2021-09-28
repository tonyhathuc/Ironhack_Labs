USE sakila;
-- 1.Get the unique release years. (Done)
    release_year
FROM
    film;
-- 2006

-- 2. Get all films with ARMAGEDDON in the title. (Done)
SELECT 
    title
FROM
    film
WHERE
    title LIKE '%Armageddon%';


-- 3. Get all films which  title ends with APOLLO. (Done)
SELECT 
    title
FROM
    film
WHERE
    title LIKE '%Apollo';
    
-- 4. Get 10 the longest films. (Done)
SELECT 
    title, length
FROM
    film
ORDER BY length DESC
LIMIT 10;

-- 5. How many films include Behind the Scenes content? (Done)
SELECT 
    title, special_features
FROM
    film
WHERE
    special_features LIKE '%Behind%';
    
-- 6. Drop column picture from staff (Done)
 alter table staff drop picture;
 SELECT 
    *
FROM
    staff;
    
-- 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly. (Done)
select *
from customer;

INSERT INTO `customer`(first_name, last_name) VALUES ('TAMMY', 'SANDERS');

-- 8.Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1.
-- You can use current date for the rental_date column in the rental table.
-- Hint: Check the columns in the table rental and see what information you would need to add there.
-- You can query those pieces of information in other tables. For eg., you would notice that you need customer_id information as well.
-- To get that you can use the following query: select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; Use similar method to get inventory_id, film_id, and staff_id.

select *
from customer;

insert into customer(first_name, last_name)
values('TAMMY', 'SANDERS');

