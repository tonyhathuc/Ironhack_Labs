use sakila;
-- 1. Write a query to display for each store its store ID, city, and country.
-- select store ID, city, and country
-- find the right table
-- use the schema inspector to get an easy overview
-- get an overview first
-- from store, address and city table
SELECT 
    s1.store_id, c1.city, c2.country
FROM
    store s1
        INNER JOIN
    address a1 ON s1.address_id = a1.address_id
        INNER JOIN
    city c1 ON a1.city_id = c1.city_id
        INNER JOIN
    country c2 ON c1.country_id = c2.country_id;
-- store_id is 1 and 2, resided in Lethbrige, Canada and Woodridge, Australia

-- 2. Write a query to display how much business, in dollars, each store brought in.
-- select count business in dollars and 
-- slect a
SELECT 
    c2.store_id, SUM(p1.amount)
FROM
    store s1
        INNER JOIN
    staff s2 ON s1.store_id = s2.store_id
        INNER JOIN
    payment p1 ON s2.staff_id = p1.staff_id
        INNER JOIN
    customer c2 ON p1.customer_id = c2.customer_id;
-- seems like only store_id 1 one is bringing revenue in the amount of 67416.51 dollars

-- 3. What is the average running time of films by category?
-- select avg(length) from film, by category_id from film_category

SELECT 
    AVG(f1.length) AS AverageLength, c3.name
FROM
    film f1
        INNER JOIN
    film_category f2 ON f1.film_id = f2.film_id
        INNER JOIN
    category c3 ON f2.category_id = c3.category_id
GROUP BY c3.name;

-- we got 2 columns with the average lenth of movies per category

-- 4. Which film categories are longest?
SELECT 
    AVG(f1.length) AS AverageLength, c3.name
FROM
    film f1
        INNER JOIN
    film_category f2 ON f1.film_id = f2.film_id
        INNER JOIN
    category c3 ON f2.category_id = c3.category_id
GROUP BY c3.name
ORDER BY AverageLength DESC;

-- 5. Display the most frequently rented movies in descending order.
-- I copy pasted the query from above and added ORDER BY clause
-- ordered it by AverageLength in a descending order
SELECT 
    AVG(f1.length) AS AverageLength, c3.name
FROM
    film f1
        INNER JOIN
    film_category f2 ON f1.film_id = f2.film_id
        INNER JOIN
    category c3 ON f2.category_id = c3.category_id
GROUP BY c3.name
ORDER BY AverageLength DESC;

-- 6. List the top five genres in gross revenue in descending order.
SELECT 
    SUM(amount) AS TotalSales, c3.name
FROM
    category c3
        INNER JOIN
    film_category f2 ON c3.category_id = f2.category_id
        INNER JOIN
    film f1 ON f1.film_id = f2.film_id
        INNER JOIN
    inventory i1 ON f1.film_id = i1.film_id
        INNER JOIN
    rental r1 ON i1.inventory_id = r1.inventory_id
        INNER JOIN
    payment p1 ON r1.rental_id = p1.rental_id
GROUP BY c3.name
ORDER BY TotalSales DESC
LIMIT 5;
-- The TOP5 genres are Sports, Sci-FI, Animation, Drama and Comedy

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
-- Step 1: Which copies of "Academy Dinosaur" is available at Store 1
SELECT 
    f1.film_id, f1.title, s1.store_id, i1.inventory_id
FROM
    film f1
        INNER JOIN
    inventory i1 ON f1.film_id = i1.film_id
        INNER JOIN
    store s1 ON i1.store_id = s1.store_id
WHERE
    f1.title = 'Academy Dinosaur'
        AND s1.store_id = 1;
-- the film_id of "Academy Dinosaur" is 1 and there are 4 of them in Store 1, their inventory_id is 1, 2, 3, and 4

