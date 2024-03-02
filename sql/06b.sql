/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT title from film
LEFT JOIN inventory i using(film_id)
WHERE i.film_id is NULL;
