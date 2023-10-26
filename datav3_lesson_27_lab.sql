-- Lab | SQL Join (Part I)
USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT film_category.category_id as 'film category', COUNT(film.film_id) as 'number of films'
FROM film
JOIN film_category ON film.film_id = film_category.film_id
GROUP BY film_category.category_id
ORDER BY film_category.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
-- I assume that total amount 'rung up' corresponds to the total amount collected/received by staff from payment table
SELECT payment.staff_id as 'staff id', staff.first_name as 'firs name', staff.last_name as 'last name', SUM(payment.amount) as 'total amount'
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY payment.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT film_actor.actor_id as 'actor id', actor.first_name as 'first name', actor.last_name as 'last name', COUNT(film_actor.film_id) as 'number of films'
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT rental.customer_id as 'customer id', customer.first_name as 'first name', customer.last_name as 'last name', COUNT(rental.customer_id) as 'number of films rented'
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id
ORDER BY COUNT(rental.customer_id) DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT staff.first_name 'first name', staff.last_name as 'last name', address.address as 'first address'
FROM staff
JOIN address ON staff.address_id = address.address_id
ORDER BY staff.last_name, staff.first_name;

-- 6. List each film and the number of actors who are listed for that film.
SELECT film_actor.film_id as 'film id', film.title as 'film tittle', COUNT(film_actor.actor_id) as 'number of actors'
FROM film_actor
JOIN film ON film_actor.film_id = film.film_id
GROUP BY film_actor.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT payment.customer_id as 'customer id', customer.first_name as 'first name', customer.last_name as 'last name', SUM(payment.amount) as 'total paid'
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY customer.last_name;

-- 8. List the titles of films per category.
SELECT film_category.category_id as 'Category', film.title as 'film title'
FROM film_category
JOIN film ON film_category.film_id = film.film_id
ORDER BY film_category.category_id;


