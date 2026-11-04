CREATE DATABASE IF NOT EXISTS day9;
USE day9;

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR (50),
city VARCHAR(50)
);

CREATE TABLE Products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL (10,2)
);

CREATE TABLE Sales(
sale_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
sale_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

INSERT INTO Customers VALUES
(1, 'Rahul', 'Pune'),
(2, 'Priya', 'Mumbai'),
(3, 'Amit', 'Pune'),
(4, 'Sneha', 'Nashik');

INSERT INTO Products VALUES
(101, 'Laptop', 50000),
(102, 'Mouse', 500),
(103, 'Keyboard', 1000),
(104, 'Monitor', 12000);

INSERT INTO Sales VALUES
(1, 1, 101, 1, '2026-01-10'),
(2, 1, 102, 2, '2026-01-15'),
(3, 2, 103, 1, '2026-02-05'),
(4, 3, 102, 3, '2026-02-10'),
(5, 2, 101, 1, '2026-03-01');

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales;

-- INNER JOIN
-- INNER JOIN returns records that have matching values in both tables.
SELECT Customers.customer_name,Sales.sale_id
FROM Customers 
INNER JOIN Sales 
ON
Customers.customer_id = Sales.customer_id;

-- LEFT JOIN
-- LEFT JOIN returns all records from the left table and matching records from the right table. If no match exists, right-table columns contain NULL.
SELECT Customers.customer_name,Sales.sale_id
FROM Customers
LEFT JOIN Sales
ON
Customers.customer_id = Sales.customer_id;

-- Aggregate functions
-- Aggregate functions calculate summary values from multiple records.
-- Aggregate functions calculate summary values from multiple records.
SELECT count(*)AS total_sales
FROM Sales;

-- SUM() — adds the values in a column
SELECT sum(quantity) AS total_quantity
FROM Sales;

-- AVG() — calculates the arithmetic mean
SELECT AVG(price) AS average_price FROM Products;

-- MIN() and MAX()
-- MIN() — returns the lowest non-NULL value.
-- MAX() — returns the highest non-NULL value.

SELECT MIN(price) AS lowest_price,
max(price) AS highest_price FROM Products;

-- GROUP BY
-- GROUP BY groups rows that share the same value, allowing aggregate calculations for each group.

SELECT customer_id,COUNT(*) AS total_orders 
FROM Sales
GROUP BY customer_id;

-- HAVING
-- Definition: HAVING filters grouped results, often using aggregate functions.
SELECT customer_id,count(*) AS total_orders 
FROM Sales 
GROUP BY customer_id 
HAVING COUNT(*)>1;

-- CASE WHEN
-- Definition: CASE WHEN evaluates conditions and returns a result based on which condition is satisfied
SELECT product_name,price,
CASE
WHEN price >= 10000 THEN 'Expensive'
WHEN price >= 1000 THEN 'Medium'
ELSE 'Affordable'
END AS price_category
FROM Products;

-- Subqueries
-- Definition: A subquery is a query nested inside another SQL query.
SELECT product_name,price
FROM Products 
WHERE price > (
SELECT AVG (price)
FROM Products);

-- Common Table Expressions (CTEs)
-- Definition: A CTE is a named temporary result set defined using the WITH clause for use within a single SQL statement.

WITH CustomerSales AS (
SELECT customer_id,count(*) AS total_orders
FROM Sales
GROUP BY customer_id )
SELECT * FROM CustomerSales
WHERE total_orders >1;
