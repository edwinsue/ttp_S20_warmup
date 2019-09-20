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

Did not complete