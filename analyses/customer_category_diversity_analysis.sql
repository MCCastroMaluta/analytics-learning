/*
Business Question:
Which customers purchase from more categories than the average customer?

Grain:
1 row = 1 customer

Metrics:
- total_categories: number of distinct categories purchased by a customer
- avg_categories: average number of categories purchased across all customers

Filter:
Keep only customers where:
total_categories > avg_categories

Expected Output:
- customer_id
- total_categories
- avg_categories
*/

-- Grain: 1 row = 1 purchased product linked to a customer and a category
WITH base_customers_categories AS (
	SELECT
		o.order_id,
		o.customer_id,
		c.category_id,
		c.category_name
	FROM supermarket.order_items oi
	JOIN supermarket.orders o
		ON oi.order_id = o.order_id
	JOIN supermarket.products p
		ON oi.product_id = p.product_id
	JOIN supermarket.categories c
		ON p.category_id = c.category_id
),

-- Number of distinct categories purchased by each customer
customers_purchased_categories AS (
	SELECT
		customer_id,
		COUNT(DISTINCT category_id) AS total_categories
	FROM base_customers_categories
	GROUP BY customer_id
),

-- Global average number of categories purchased per customer
avg_categories_metric AS (
	SELECT
		AVG(total_categories) AS avg_categories
	FROM customers_purchased_categories
)

-- Customers above the average
SELECT 
	cpc.customer_id,
	cpc.total_categories,
	ROUND(acm.avg_categories, 2) AS avg_categories
FROM customers_purchased_categories cpc
CROSS JOIN avg_categories_metric acm
WHERE cpc.total_categories > acm.avg_categories
ORDER BY cpc.total_categories DESC;