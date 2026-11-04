-- Day 15 Foundation Assessment: SQL
-- Import sample_sales_dataset.csv into a table named sales.

SELECT SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM sales;

SELECT Category, SUM(Sales) AS category_sales, SUM(Profit) AS category_profit
FROM sales
GROUP BY Category
ORDER BY category_sales DESC;

SELECT Product, SUM(Sales) AS product_sales
FROM sales
GROUP BY Product
ORDER BY product_sales DESC
LIMIT 5;

SELECT Order_Date, SUM(Sales) AS daily_sales
FROM sales
GROUP BY Order_Date
ORDER BY Order_Date;
