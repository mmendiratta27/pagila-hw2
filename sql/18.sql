/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
SELECT "rank", title, revenue, "total revenue", TO_CHAR((100*"total revenue")/sum(revenue) OVER (), 'FM900.00') AS "percent revenue"
FROM (
	SELECT "rank", title, revenue, SUM(revenue) OVER (ORDER BY revenue desc) as "total revenue" FROM (
       		SELECT
        	RANK () OVER (
                	ORDER BY sum(case when amount is NULL then 0.00 else amount end)  desc
        	),
        	title, sum(case when amount is NULL then 0.00 else amount end) revenue
        	FROM film
        	LEFT JOIN inventory USING (film_id)
        	LEFT JOIN rental USING (inventory_id)
        	LEFT JOIN payment USING (rental_id)
        	GROUP BY film.title
        	ORDER BY revenue desc
	) temp
) temp2 ORDER BY revenue desc, title;

