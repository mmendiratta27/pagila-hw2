/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT sf as special_features, count(sf) FROM (
	SELECT unnest(special_features) sf
	FROM film
) temp
GROUP BY sf
ORDER BY sf;
