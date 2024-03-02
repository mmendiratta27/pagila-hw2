/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT title from film f
JOIN inventory i USING(film_id)
LEFT JOIN (
	SELECT DISTINCT film_id from rental
       	JOIN inventory USING(inventory_id)
	JOIN customer USING(customer_id)
	JOIN address USING(address_id)
	JOIN city USING(city_id)
	JOIN country USING(country_id)
	WHERE country = 'United States'
) as us_rentals ON i.film_id = us_rentals.film_id
WHERE us_rentals.film_id is NULL
ORDER BY title;
