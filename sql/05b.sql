/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT a.last_name, a.first_name from actor a
LEFT JOIN customer c
ON c.first_name = a.first_name AND a.last_name = c.last_name
WHERE c.last_name is NULL OR c.first_name is NULL
ORDER BY a.last_name, a.first_name;
