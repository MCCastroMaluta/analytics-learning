/*
File: table_sizes.sql

Purpose:
Measure the relative size of each table in the supermarket schema
based on row counts.

Business Value:
Helps identify:
- High-volume transactional tables
- Dimension tables
- Potential analytical fact tables
- Areas that may require optimization in future workloads

Dataset:
supermarket

Created:
2026-06-05

Last Updated:
2026-06-05
*/

-- Row count by table
SELECT *
FROM (
		SELECT 'cart_events' AS table_name,
			COUNT(*) AS total_rows
		FROM supermarket.cart_events
		UNION ALL
		SELECT 'cart_items', COUNT(*) 
		FROM supermarket.cart_items
		UNION ALL
		SELECT 'carts', COUNT(*)  
		FROM supermarket.carts
		UNION ALL
		SELECT 'categories', COUNT(*)  
		FROM supermarket.categories
		UNION ALL
		SELECT 'cities', COUNT(*)  
		FROM supermarket.cities
		UNION ALL
		SELECT 'claim_categories', COUNT(*)  
		FROM supermarket.claim_categories 
		UNION ALL
		SELECT 'claim_events', COUNT(*) 
		FROM supermarket.claim_events 
		UNION ALL
		SELECT 'customer_addresses', COUNT(*) 
		FROM supermarket.customer_addresses
		UNION ALL
		SELECT 'customer_claims', COUNT(*)  
		FROM supermarket.customer_claims
		UNION ALL
		SELECT 'customers', COUNT(*)  
		FROM supermarket.customers
		UNION ALL
		SELECT 'deliveries', COUNT(*) 
		FROM supermarket.deliveries
		UNION ALL
		SELECT 'delivery_drivers', COUNT(*) 
		FROM supermarket.delivery_drivers 
		UNION ALL
		SELECT 'delivery_events', COUNT(*) 
		FROM supermarket.delivery_events
		UNION ALL
		SELECT 'events', COUNT(*) 
		FROM supermarket.events
		UNION ALL
		SELECT 'inventory', COUNT(*) 
		FROM supermarket.inventory
		UNION ALL
		SELECT 'inventory_movements', COUNT(*) 
		FROM supermarket.inventory_movements
		UNION ALL
		SELECT 'order_items', COUNT(*) 
		FROM supermarket.order_items
		UNION ALL
		SELECT 'orders', COUNT(*) 
		FROM supermarket.orders 
		UNION ALL
		SELECT 'payment_methods', COUNT(*) 
		FROM supermarket.payment_methods
		UNION ALL
		SELECT 'product_reviews', COUNT(*) 
		FROM supermarket.product_reviews
		UNION ALL
		SELECT 'products', COUNT(*) 
		FROM supermarket.products
		UNION ALL
		SELECT 'promotion_products', COUNT(*) 
		FROM supermarket.promotion_products
		UNION ALL
		SELECT 'promotion_usage', COUNT(*) 
		FROM supermarket.promotion_usage
		UNION ALL
		SELECT 'promotions', COUNT(*) 
		FROM supermarket.promotions 
		UNION ALL
		SELECT 'sessions', COUNT(*) 
		FROM supermarket.sessions
		UNION ALL
		SELECT 'store_reviews', COUNT(*) 
		FROM supermarket.store_reviews
		UNION ALL
		SELECT 'stores', COUNT(*) 
		FROM supermarket.stores
		UNION ALL
		SELECT 'warehouses', COUNT(*) 
		FROM supermarket.warehouses
) t
ORDER BY total_rows DESC;

