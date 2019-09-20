-- What is the average of the amount of stock each store has in their inventory? (Use inventory table)

SELECT 
store_id,
COUNT(inventory_id)
FROM inventory
GROUP BY store_id

-- What is the average customer lifetime spending, for each staff member? 

WITH lifetime_spending_by_staff AS (
	SELECT 
	customer_id,
	staff_id,
	SUM(amount)
	FROM payment 
	GROUP BY customer_id, staff_id
	ORDER BY customer_id
	LIMIT 20
)

SELECT 
staff_id,
ROUND(AVG(sum),2) 
FROM lifetime_spending_by_staff
GROUP BY staff_id

-- What is the average number of films we have per genre (category)?

WITH film_category_count AS (
	SELECT 
	c.name,
	COUNT(c.name)
	FROM film f
	JOIN film_category fc USING (film_id)
	JOIN category c USING (category_id)
	GROUP BY c.name
)

SELECT ROUND(AVG(count),2)
FROM film_category_count