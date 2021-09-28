![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | SQL Queries - Lesson 2.5

In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You can follow the steps listed here to get the data locally: [Sakila sample database - installation](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

The database is structured as follows:
![DB schema](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

<br><br>

### Instructions

1. Select all the actors with the first name ‘Scarlett’.
2. How many films (movies) are available for rent and how many films have been rented?
3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
4. What's the average movie duration expressed in format (hours, minutes)?
5. How many distinct (different) actors' last names are there?
6. Since how many days has the company been operating (check DATEDIFF() function)?
7. Show rental info with additional columns month and weekday. Get 20 results.
8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
9. How many rentals were in the last month of activity?

### 06.04.2021 - New Instructions

Lab | SQL Queries - Lesson 2.5
1. Select all the actors with the first name ‘Scarlett’.
2. How many films (movies) are available for rent and how many films have been rented?
3. What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
4. What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
5. How many distinct (different) actors' last names are there?
6. Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
7. Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
9. How many rentals were made in the last month of renting activity?
.... stay tuned, improved instructions for the other labs will maybe follow
