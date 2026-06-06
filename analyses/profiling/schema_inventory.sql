
--Inspection of tables and tables types from the schema
SELECT
		table_name,
		table_type
FROM information_schema.tables
WHERE table_schema = 'supermarket'
ORDER BY table_type, table_name;