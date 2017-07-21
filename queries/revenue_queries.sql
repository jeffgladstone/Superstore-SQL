SELECT OrderDate AS 'Day', ROUND(SUM(Sales), 2) AS 'Total Sales', ROUND(SUM(Profit), 2) AS 'Total Profit'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Daily Revenue

SELECT STRFTIME('%Y-%m', OrderDate) AS 'Month', ROUND(SUM(Sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_orders
GROUP BY 1 ORDER BY 1; -- Lists the Monthly Revenue

SELECT STRFTIME('%Y', OrderDate) AS 'Year', ROUND(SUM(Sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_orders
GROUP BY 1 ORDER BY 1; -- Lists the Yearly Revenue