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


WITH monthly_revenue AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
monthly_customers AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
monthly_products_sold AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', SUM(Quantity) AS 'products'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT monthly_revenue.dt AS 'Month', monthly_customers.customers AS 'Customers',
monthly_products_sold.products AS 'Products Sold',  monthly_revenue.rev AS 'Total Profit',
ROUND(monthly_revenue.rev / monthly_customers.customers, 2) AS 'ARPC'
FROM monthly_revenue JOIN monthly_customers ON monthly_revenue.dt == monthly_customers.dt
JOIN monthly_products_sold ON monthly_revenue.dt == monthly_products_sold.dt;
-- Lists the Monthly Customers, Products Sold, Total Profit and Average Revenue Per Customer


WITH yearly_revenue AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
yearly_customers AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
yearly_products_sold AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', SUM(Quantity) AS 'products'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT yearly_revenue.dt AS 'Year', yearly_customers.customers AS 'Customers',
yearly_products_sold.products AS 'Products Sold',  yearly_revenue.rev AS 'Total Profit',
ROUND(yearly_revenue.rev / yearly_customers.customers, 2) AS 'ARPC'
FROM yearly_revenue JOIN yearly_customers ON yearly_revenue.dt == yearly_customers.dt
JOIN yearly_products_sold ON yearly_revenue.dt == yearly_products_sold.dt;
-- Lists the Yearly Customers, Products Sold, Total Profit and Average Revenue Per Customer

