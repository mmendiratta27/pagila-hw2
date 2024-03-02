/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
SELECT EXTRACT(YEAR FROM rental_date) AS "Year", EXTRACT(MONTH FROM rental_date) AS "Month", sum(amount) AS "Total Revenue"
FROM rental
JOIN payment USING (rental_id)
WHERE EXTRACT(YEAR FROM rental_date)  = 2005 OR EXTRACT(YEAR FROM rental_date) = 2020
GROUP BY ROLLUP (
        EXTRACT(YEAR FROM rental_date),
        EXTRACT(MONTH FROM rental_date)
)
ORDER BY EXTRACT(YEAR FROM rental_date), EXTRACT(MONTH FROM rental_date);
