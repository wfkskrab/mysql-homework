SELECT * FROM sakila.country;

SELECT country_id, country
from country
where country IN ('Afghanistan', 'Bangladesh', 'China')