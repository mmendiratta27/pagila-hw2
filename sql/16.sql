/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */
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
ORDER BY revenue desc;
