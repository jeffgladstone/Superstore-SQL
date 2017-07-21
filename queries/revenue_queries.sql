SELECT OrderDate as 'Day', ROUND(SUM(Sales), 2) AS 'Total Sales', ROUND(SUM(Profit), 2) AS 'Total Profit'
FROM sample_superstore_sales GROUP BY 1 ORDER BY 1; -- Lists the Daily Revenue

SELECT STRFTIME('%Y-%m', orderdate) AS 'Month', ROUND(SUM(sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_sales
GROUP BY 1 ORDER BY 1; -- Lists the Monthly Revenue

SELECT STRFTIME('%Y', orderdate) AS 'Year', ROUND(SUM(sales), 2) AS 'Total Sales',
ROUND(SUM(Profit), 2) AS 'Total Profit' FROM sample_superstore_sales
GROUP BY 1 ORDER BY 1; -- Lists the Yearly Revenue