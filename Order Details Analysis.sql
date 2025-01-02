-- Order Details Analysis
-- View the order_details table
SELECT * 
FROM [dbo].[order_details];

-- what is the date range of the table
SELECT MIN ([order_date]), MAX([order_date])
FROM [dbo].[order_details];

-- How many orders were made within this date range?
SELECT COUNT(DISTINCT([order_id])) AS 'NUMBER OF ORDERS'
FROM [dbo].[order_details];

-- How many items were ordered within this date range?
SELECT COUNT(*) AS 'NUMBER OF ITEMS WERE ORDERED'
FROM [dbo].[order_details];

-- Which orders had the most number of items?
SELECT [order_id], COUNT(*) AS 'NUM_ITEMS'
FROM [dbo].[order_details]
GROUP BY [order_id] 
ORDER BY NUM_ITEMS DESC;

-- How many orders had more than 12 items?
SELECT COUNT(*) AS NUM_ORDERS
FROM (
    SELECT [order_id], COUNT(*) AS NUM_ITEMS
    FROM [dbo].[order_details]
    GROUP BY [order_id]
    HAVING COUNT(*) > 12
) AS NUM_ORDERS;

