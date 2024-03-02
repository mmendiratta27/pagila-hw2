/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT title from (
	SELECT title, rating, unnest(special_features) sf FROM film
) AS temp
WHERE temp.sf ILIKE 'Trailers'
AND rating = 'G'
ORDER BY title;
