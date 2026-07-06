
--Data Quality check: Bronze schema was created

SELECT
	*
FROM
	information_schema.schemata
WHERE
	schema_name LIKE '%bronze%';

--Data Quality check: Tables in bronze schema were created:
--1. src_gym_activity
--2. src_membership_transactions
--3. ext_gym_activity
--4. ext_membership_transactions

SELECT
	*
FROM
	information_schema.tables
WHERE
	table_schema LIKE '%bronze%'
	OR ( table_name LIKE 'src_gym_activity%'
		AND table_name LIKE 'src_membership_transactions%'
		AND table_name LIKE 'ext_gym_activity'
		AND table_name LIKE 'ext_membership_transactions'
);

--Data Quality check: All Columns in bronze schema were created
SELECT
	ordinal_position
	,	
table_schema
	,
	table_name
	,
	column_name
FROM
	information_schema.COLUMNS
WHERE
	table_schema LIKE '%bronze%'
	OR ( table_name LIKE 'src_gym_activity%'
		AND table_name LIKE 'src_membership_transactions%')
ORDER BY
	table_name ASC
	, 
	ordinal_position ASC ;


--Data Quality check: column names match between external and bronze layer tables 
--If names match, the query should not return a row
 
WITH external_tables AS (
SELECT
	ordinal_position
	,	
	table_schema
	,
	table_name
	,
	column_name
FROM
	information_schema.COLUMNS
WHERE 
	table_name LIKE 'ext%')
	
SELECT 
	
	
	e.table_name 
	,
	e.column_name
	,
	src.column_name
	,
	src.table_name
FROM external_tables e
LEFT JOIN (
	SELECT 
		ordinal_position
		,	
		table_schema
		,
		table_name
		,
		column_name
	FROM information_schema.COLUMNS src
	WHERE 
		table_name LIKE 'src%') src 

ON e.column_name = src.column_name

WHERE 
	e.column_name <> src.column_name;

--Data Quality check: Total count of records in source and bronze layers match

SELECT 
(SELECT count (*) FROM ext_membership_transactions) AS count_ext_membership_transactions,
(SELECT count (*) FROM src_membership_transactions) AS count_src_membership_transactions,
(SELECT count (*) FROM ext_gym_activity) AS count_ext_gym_activity,
(SELECT count (*) FROM src_gym_activity) AS count_src_gym_activity




