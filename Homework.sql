USE sakila;
SELECT * FROM sakila.actor;


#Select first_name, last_name
#from actor;

#1a works
#SELECT first_name, last_name FROM actor;
#1b works
#SELECT CONCAT(first_name, " ", last_name) as "ACTOR NAME" FROM actor;

#2a																							
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name = 'Joe';


  
  
  #2b works
#Select last_name 
#from actor
#Where last_name Like '%GEN%';
  
  #2c works
#Select last_name, first_name
#FROM actor
#Where last_name Like '%LI%';

 #3a works
#Alter Table actor
#Drop COLUMN desription;

#4a works
select last_name, count(last_name) as "last-name-frequency"
From actor 
group by last_name;

#4B works
SELECT last_name, COUNT(last_name) AS "LAST-NAME-FREQUENCY"
FROM actor
GROUP BY last_name  
HAVING `LAST-NAME-FREQUENCY` >=2;

 #4c works
Update actor
Set first_name = 'HARPO'
where first_name = 'GROUCHO' and last_name = 'WILLIAMS';


#4d works
Update actor
Set first_name = 'GROUCHO'
where first_name = 'HARPO' and last_name = 'WILLIAMS';

SELECT first_name 
FROM actor
where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

#5a works
SHOW CREATE TABLE address;

 #6a
SELECT staff.first_name, staff.last_name, address.address
FROM staff
Inner JOIN address
on staff.address_id = address.address_id;

#6b
SELECT staff.first_name, staff.last_name,payment_date, sum( payment.amount)
FROM staff
Inner JOIN payment
WHERE MONTH(p.payment_date) = 08 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id;

#6c
SELECT f.title AS 'Film Title', COUNT(fa.actor_id) AS `Number of Actors`
FROM film_actor fa
INNER JOIN film f 
ON fa.film_id= f.film_id
GROUP BY f.title;

#6d
SELECT title, (
SELECT COUNT(*) FROM inventory
WHERE film.film_id = inventory.film_id
) AS 'Number of Copies'
FROM film
WHERE title = "Hunchback Impossible";

 #6e
SELECT 
    last_name, first_name, SUM(amount) AS total_paid
FROM
    payment
        INNER JOIN
    customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY last_name ASC;
  
  #7a
SELECT title FROM film
WHERE language_id IN
	(SELECT language_id 
	FROM language
	WHERE name = "English" )
AND (title LIKE "K%") OR (title LIKE "Q%");

  #7b
SELECT last_name, first_name
FROM actor
WHERE actor_id IN
	(SELECT actor_id FROM film_actor
	WHERE film_id IN 
		(SELECT film_id FROM film
		WHERE title = "Alone Trip"));

 #7c
 SELECT 
    customer.last_name, customer.first_name, customer.email
FROM
    customer
        INNER JOIN
    customer_list ON customer.customer_id = customer_list.ID
WHERE
    customer_list.country = 'Canada';
    
 #7d
SELECT title
FROM film
Where film_id IN (Select
film_id
FROM film_category
WHERE category_id IN (SELECT
Category_id
FROM category
Where name = 'Family')); 

 #7e
SELECT film.title, COUNT(*) AS 'rent_count'
FROM film, inventory, rental
WHERE film.film_id = inventory.film_id
        AND rental.inventory_id = inventory.inventory_id
GROUP BY inventory.film_id
ORDER BY COUNT(*) DESC, film.title ASC;

 #7f
SELECT store.store_id, SUM(amount) AS revenue
FROM store
INNER JOIN
    staff ON store.store_id = staff.store_id
INNER JOIN
    payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id;

 #7g
SELECT store.store_id, city.city, country.country
FROM store
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id;

 #7h
SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross' 
FROM category c
JOIN film_category fc 
ON (c.category_id=fc.category_id)
JOIN inventory i 
ON (fc.film_id=i.film_id)
JOIN rental r 
ON (i.inventory_id=r.inventory_id)
JOIN payment p 
ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross  LIMIT 5;

 #7h

  	

  