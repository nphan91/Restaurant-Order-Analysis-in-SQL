--OBJECT 1: 
-- View the menu items table and write a query to find the number of items on the menu
Select *
From [dbo].[menu_items];

Select COUNT(*) AS Number_of_items
From [dbo].[menu_items];

-- What are the least and most expensive items on the menu?
Select *
From [dbo].[menu_items]
Order By [price] ASC;

Select *
From [dbo].[menu_items]
Order By [price] DESC;
-- How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu
SELECT COUNT(*) as 'Number of Italian Dishses'
FROM [dbo].[menu_items]
WHERE [category]='Italian';

SELECT *
FROM [dbo].[menu_items]
WHERE [category]='Italian'
ORDER BY [price] ASC;

SELECT *
FROM [dbo].[menu_items]
WHERE [category]='Italian'
ORDER BY [price] DESC;

-- How many dishes are in each category? What is the average dish price within each category?
SELECT [category], COUNT([menu_item_id]) AS 'Number of dishes'
FROM [dbo].[menu_items]
GROUP BY [category];

SELECT [category], AVG([price]) AS 'Average Price'
FROM [dbo].[menu_items]
GROUP BY [category];
