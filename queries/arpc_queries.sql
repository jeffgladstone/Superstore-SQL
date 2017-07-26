/*
    Filename: arpc_queries.sql
    Author: Jeff Gladstone
    Date: 7/25/2017
    Description:
    This SQL file tracks the
	daily, monthly and yearly
	ARPC (Average Revenue Per Customer)
	for the sample Superstore.
*/

WITH daily_revenue AS (
SELECT OrderDate AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
daily_customers AS (
SELECT OrderDate AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT daily_revenue.dt AS 'Day',
ROUND(daily_revenue.rev / daily_customers.customers, 2) AS 'ARPC'
FROM daily_revenue JOIN daily_customers
ON daily_revenue.dt == daily_customers.dt; -- Lists the Daily Average Revenue Per Customer

WITH monthly_revenue AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
monthly_customers AS (
SELECT STRFTIME('%Y-%m', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT monthly_revenue.dt AS 'Month',
ROUND(monthly_revenue.rev / monthly_customers.customers, 2) AS 'ARPC'
FROM monthly_revenue JOIN monthly_customers
ON monthly_revenue.dt == monthly_customers.dt; -- Lists the Monthly Average Revenue Per Customer

WITH yearly_revenue AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', ROUND(SUM(Profit), 2) AS 'rev'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1),
yearly_customers AS (
SELECT STRFTIME('%Y', OrderDate) AS 'dt', COUNT(DISTINCT CustomerID) AS 'customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1)
SELECT yearly_revenue.dt AS 'Month',
ROUND(yearly_revenue.rev / yearly_customers.customers, 2) AS 'ARPC'
FROM yearly_revenue JOIN yearly_customers
ON yearly_revenue.dt == yearly_customers.dt; -- Lists the Yearly Average Revenue Per Customer