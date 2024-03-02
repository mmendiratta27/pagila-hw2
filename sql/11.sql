/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT first_name || ' ' || last_name as "Actor Name" FROM (
	SELECT first_name, last_name, unnest(special_features) sf from film
	JOIN film_actor using(film_id)
	JOIN actor using(actor_id)
) as temp
WHERE sf ilike 'Behind the Scenes'
ORDER BY "Actor Name";
