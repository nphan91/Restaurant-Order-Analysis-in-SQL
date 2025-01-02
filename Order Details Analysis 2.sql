-- Customer Behavior Analysis
--What were the least and most ordered items? What categories were they in?
UPDATE [dbo].[order_details]
SET [order_details_id] = NULL
WHERE [order_details_id] = 'NULL';

UPDATE [dbo].[order_details]
SET [item_id] = NULL
WHERE [item_id] = 'NULL';

SELECT 
    mi.[item_name], 
    COUNT(od.[order_details_id]) AS NUM_PURCHASES, 
    mi.[category]
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
GROUP BY mi.[item_name], mi.[category]
ORDER BY COUNT(od.[order_details_id]) ASC;


SELECT 
    mi.[item_name], 
    COUNT(od.[order_details_id]) AS NUM_PURCHASES, 
    mi.[category]
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
GROUP BY mi.[item_name], mi.[category]
ORDER BY COUNT(od.[order_details_id]) DESC;


-- What were the top 5 orders that spent the most money?
SELECT TOP 5
    OD.order_id, 
    SUM(mi.[price]) AS 'Total Amount' 
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
GROUP BY OD.order_id
ORDER BY SUM(mi.[price]) DESC;

--What do the highest spend orders look like? Which items did they buy and how much did they spend?
SELECT  [order_id], [item_name]
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
WHERE [order_id]= '440';


SELECT OD.order_id,
SUM(mi.[price]) as 'Total Amount'
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
WHERE [order_id]= '440'
GROUP BY OD.order_id;

-- View the details of top 5 highest spend orders, what insights
440	192.15
2075	191.05
1957	190.1
330	189.7
2675	185.1

SELECT 
    [category], 
    COUNT([item_id]) AS NUM_ITEMS
FROM [dbo].[order_details] od
LEFT JOIN [dbo].[menu_items] mi
ON mi.[menu_item_id] = od.[item_id]
WHERE [order_id] IN (440, 2075, 1957, 330, 2675)
GROUP BY [category];

-- Top 5 HiGHEST SPEND ORDERS, ordering more Italian Food more than other foods.
