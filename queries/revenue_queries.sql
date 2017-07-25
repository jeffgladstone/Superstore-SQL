/*
    Filename: revenue_queries.sql
    Author: Jeff Gladstone
    Date: 7/20/2017
    Description:
    This SQL file tracks the daily,
	monthly and yearly revenue of
	the sample Superstore.
*/

SELECT OrderDate AS 'Day', ROUND(SUM(Sales), 2) AS 'Total Sales', ROUND(SUM(Profit), 2) AS 'Total Profit'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Daily Revenue and Profit

SELECT STRFTIME('%Y-%m', OrderDate) AS 'Month', ROUND(SUM(Sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_orders
GROUP BY 1 ORDER BY 1; -- Lists the Monthly Revenue and Profit

SELECT STRFTIME('%Y', OrderDate) AS 'Year', ROUND(SUM(Sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_orders
GROUP BY 1 ORDER BY 1; -- Lists the Yearly Revenue and Profit