/*
    Filename: customer_queries.sql
    Author: Jeff Gladstone
    Date: 7/25/2017
    Description:
    This SQL file tracks the daily,
	monthly and yearly number of
	customers who place orders from
	the sample Superstore.
*/

SELECT OrderDate AS 'Day', COUNT(DISTINCT CustomerID) AS 'Total Customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Daily Number of Customers

SELECT STRFTIME('%Y-%m', OrderDate) AS 'Month', COUNT(DISTINCT CustomerID) AS 'Total Customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Monthly Number of Customers

SELECT STRFTIME('%Y', OrderDate) AS 'Year', COUNT(DISTINCT CustomerID) AS 'Total Customers'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Yearly Number of Customers