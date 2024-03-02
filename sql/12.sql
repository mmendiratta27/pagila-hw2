/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT title FROM (
	SELECT title, unnest(special_features) sf
	FROM film
) bts
JOIN (
	SELECT title, unnest(special_features) sf
	FROM film
) trl
USING (title)
WHERE bts.sf = 'Behind the Scenes'
   AND trl.sf = 'Trailers'
ORDER BY title;
