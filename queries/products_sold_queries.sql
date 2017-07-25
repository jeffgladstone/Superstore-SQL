/*
    Filename: products_sold_queries.sql
    Author: Jeff Gladstone
    Date: 7/25/2017
    Description:
    This SQL file tracks the
	daily, monthly and yearly
	number of products sold
	from the sample Superstore.
*/

SELECT OrderDate AS 'Day', SUM(Quantity) AS 'Total Products Sold'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Daily Number of Products Sold

SELECT STRFTIME('%Y-%m', OrderDate) AS 'Month', SUM(Quantity) AS 'Total Products Sold'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Monthly Number of Products Sold

SELECT STRFTIME('%Y', OrderDate) AS 'Year', SUM(Quantity) AS 'Total Products Sold'
FROM sample_superstore_orders GROUP BY 1 ORDER BY 1; -- Lists the Yearly Number of Products Sold