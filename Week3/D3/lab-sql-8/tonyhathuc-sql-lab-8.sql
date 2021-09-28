-- Instructions
-- 0. Inspect the database structure and find the best-fitting table to analyse for the next task. √
-- 1. Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, and the rank.
USE sakila;
-- overview
select title, length, 
rank() over (partition by f.length order by f.length desc) as 'Rank'
from sakila.film f
where length != '_' or length is not null;

-- 2. Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, rating and the rank.
-- run this query to get an overview
SELECT 
    *
FROM
    sakila.film f;

-- crafted query 
select title, length, rating,
rank() over (partition by rating order by length asc) as 'Rank'
from sakila.film f
where length !='_' or length is not null;

-- 3. How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.

SELECT 
    COUNT(f.title) AS NumberOfMOvies, fc.category_id
FROM
    film f
        INNER JOIN
    film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- 4. Which actor has appeared in the most films?
-- join tables
-- pull from the tables name and movies

-- I will run a couple of queries to get an overview
SELECT 
    *
FROM
    actor;
-- actor_id, first_name, last_name, last_update

SELECT 
    *
FROM
    film;
--  film_id, title

SELECT 
    *
FROM
    film_actor;
-- actor_id, film_id, last_update

-- now that I have seen an overview
-- I decided to join 3 tables, where I can pull the right information out from
-- Because we are looking for the actor/actress that has appeared in most movies
-- I am going to count the movie titles and then group it by actor_id
-- and order by NumOfMOvies desc, because we want to see the actor/actress with the highest count of movies´
SELECT 
    COUNT(fi.title) AS NumOfMovies,
    fa.actor_id,
    a.first_name,
    a.last_name
FROM
    actor a
        INNER JOIN
    film_actor fa ON a.actor_id = fa.actor_id
        INNER JOIN
    film fi ON fa.film_id = fi.film_id
GROUP BY fa.actor_id
ORDER BY NumOfMOvies DESC;
-- it seems like Gina Degeneres with actor_id 107 has appeared the most in movies (42)

-- 5. Most active customer (the customer that has rented the most number of films)

select * 
from customer cus;
-- customer_id, store_id, first_name, last_name, email etc

select *
from rental rent;
-- rental_id, customer_id, 

select * 
from invetory inv;

select cus.customer_id, cus.first_name, cus.last_name, count(*) as TotalRentals
from rental rent
inner join customer cus
on rent.customer_id = cus.customer_id
group by cus.customer_id, cus.first_name, cus.last_name
order by TotalRentals desc;
-- Eleanor Hunt is the most active customer (with 46 total rentals)







