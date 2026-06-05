--Existing schemas
SELECT
	schema_name
FROM information_schema.schemata
WHERE schema_name NOT IN ('pg_catalog', 'pg_toast', 'information_schema')
ORDER BY schema_name;
--Inspection of tables and tables types from the schema
SELECT
		table_name,
		table_type
FROM information_schema.tables
WHERE table_schema = 'supermarket'
ORDER BY table_type, table_name;
--Tables in the schema
SELECT
			table_name,
			column_name,
			data_type,
			is_nullable
FROM 		information_schema.columns
WHERE 		table_schema = 'supermarket'
ORDER BY 	table_name,
			ordinal_position;
--
SELECT * FROM supermarket.cart_events LIMIT 5;
SELECT * FROM supermarket.cart_items LIMIT 5;
SELECT * FROM supermarket.carts LIMIT 5;
SELECT * FROM supermarket.categories LIMIT 5;
SELECT * FROM supermarket.cities LIMIT 5;
SELECT * FROM supermarket.claim_categories LIMIT 5;
SELECT * FROM supermarket.claim_events LIMIT 5;
SELECT * FROM supermarket.customer_addresses LIMIT 5;

SELECT * FROM supermarket.customer_claims LIMIT 5;

SELECT * FROM supermarket.customers LIMIT 5;
SELECT * FROM supermarket.deliveries LIMIT 5;
SELECT * FROM supermarket.delivery_drivers LIMIT 5;
SELECT * FROM supermarket.delivery_events LIMIT 5;
SELECT * FROM supermarket.events LIMIT 5;
SELECT * FROM supermarket.inventory LIMIT 5;
SELECT * FROM supermarket.inventory_movements LIMIT 5;
SELECT * FROM supermarket.order_items LIMIT 5;
SELECT * FROM supermarket.orders LIMIT 5;
SELECT * FROM supermarket.payment_methods LIMIT 5;

SELECT * FROM supermarket.product_reviews LIMIT 5;

SELECT * FROM supermarket.products LIMIT 5;
SELECT * FROM supermarket.promotion_products LIMIT 5;
SELECT * FROM supermarket.promotion_usage LIMIT 5;
SELECT * FROM supermarket.promotions LIMIT 5;
SELECT * FROM supermarket.sessions LIMIT 5;

SELECT * FROM supermarket.store_reviews LIMIT 5;

SELECT * FROM supermarket.stores LIMIT 5;

SELECT * FROM supermarket.warehouses LIMIT 5;


SELECT 'cart_events' AS table_name,
	COUNT(*) AS registers
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
FROM supermarket.warehouses;



--ver relaciones entre tablas
--este lo copie, me va a faltar practica para recordarlo, se estila aprenderlo de memoria o es un codigo que se puede tener copiado y usarlo cuando se necesita?
--puede estar en preguntas de entrevista?

SELECT
    tc.table_name           AS tabla,
    kcu.column_name         AS columna,
    ccu.table_name          AS referencia_tabla,
    ccu.column_name         AS referencia_columna
FROM
    information_schema.table_constraints      AS tc
JOIN
    information_schema.key_column_usage       AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN
    information_schema.constraint_column_usage AS ccu
    ON tc.constraint_name = ccu.constraint_name
    AND tc.table_schema = ccu.table_schema
WHERE
    tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'supermarket'
ORDER BY
    tc.table_name,
    kcu.column_name;

--Ver si una relación es realmente 1:N (validación básica)
SELECT
    COUNT(*) AS total_filas_hija,
    COUNT(DISTINCT product_id) AS filas_padre_con_hijas
FROM
    supermarket.products;
-- columnas padres sin hijos
SELECT
    COUNT(*) AS total_filas_hija,
    COUNT(DISTINCT product_id) AS filas_padre_con_hijas
FROM
    supermarket.cart_events;

SELECT
	COUNT(*) total_filas_hijas,
	COUNT(DISTINCT session_id)
FROM supermarket.sessions;

SELECT
	COUNT(*),
	COUNT(DISTINCT )
FROM
--Ver si una relación es 1:1 o 1:N (por cada valor de FK)




SELECT
    order_id,
    COUNT(*) AS cantidad_items
FROM
    supermarket.order_items
GROUP BY
    order_id
HAVING
    COUNT(*) > 1;

SELECT
    order_id,
    COUNT(*) AS cantidad_entregas
FROM
    supermarket.deliveries
GROUP BY
    order_id
HAVING
    COUNT(*) > 1;

SELECT
    COUNT(*) AS pedidos_sin_entrega
FROM
    supermarket.orders o
LEFT JOIN supermarket.deliveries d
    ON o.order_id = d.order_id
WHERE
    d.order_id IS NULL;
