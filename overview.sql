/*
    Filename: overview.sql
    Author: Jeff Gladstone
    Date: 7/25/2017
    Description:
    This SQL file is an overview
	of all the data tracked
	daily, monthly and yearly
	from the sample Superstore.
*/

WITH daily_revenue AS (
SELECT OrderDate AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_customers AS (
SELECT OrderDate AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_products_sold AS (
SELECT OrderDate AS 'dt', SUM(Quantity) AS 'products'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT daily_revenue.dt AS 'Day', daily_customers.customers AS 'Customers',
daily_products_sold.products AS 'Products Sold',  daily_revenue.rev AS 'Total Profit',
ROUND(daily_revenue.rev / daily_customers.customers, 2) AS 'ARPC'
FROM daily_revenue JOIN daily_customers ON daily_revenue.dt == daily_customers.dt
JOIN daily_products_sold ON daily_revenue.dt == daily_products_sold.dt;
-- Lists the Daily Customers, Products Sold, Total Profit and Average Revenue Per Customer


WITH daily_revenue AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_customers AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_products_sold AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', SUM(Quantity) AS 'products'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT daily_revenue.dt AS 'Month', daily_customers.customers AS 'Customers',
daily_products_sold.products AS 'Products Sold',  daily_revenue.rev AS 'Total Profit',
ROUND(daily_revenue.rev / daily_customers.customers, 2) AS 'ARPC'
FROM daily_revenue JOIN daily_customers ON daily_revenue.dt == daily_customers.dt
JOIN daily_products_sold ON daily_revenue.dt == daily_products_sold.dt;
-- Lists the Monthly Customers, Products Sold, Total Profit and Average Revenue Per Customer


WITH daily_revenue AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_customers AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_products_sold AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', SUM(Quantity) AS 'products'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT daily_revenue.dt AS 'Year', daily_customers.customers AS 'Customers',
daily_products_sold.products AS 'Products Sold',  daily_revenue.rev AS 'Total Profit',
ROUND(daily_revenue.rev / daily_customers.customers, 2) AS 'ARPC'
FROM daily_revenue JOIN daily_customers ON daily_revenue.dt == daily_customers.dt
JOIN daily_products_sold ON daily_revenue.dt == daily_products_sold.dt;
-- Lists the Yearly Customers, Products Sold, Total Profit and Average Revenue Per Customer

