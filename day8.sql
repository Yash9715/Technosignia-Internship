-- SQL (Structured Query Language) is a language used to create, retrieve, filter, and manage data stored in relational databases.
-- creating new database

CREATE DATABASE day8;
USE day8;

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
name VARCHAR (50),
city VARCHAR (50),
age INT
);

INSERT INTO Customers (customer_id,name,city,age)
values
(1,'Rahul','Pune',22),
(2,'Priya','Mumbai',24),
(3,'Amit','Pune',21),
(4,'sneha','Nashik',21);

-- SELECT 
-- SELECT is used to retrieve data from one or more database tables.
SELECT * FROM Customers;

SELECT name,city FROM Customers;

-- Filters records according to a specified condition
-- The equality operator; checks whether two values are equal
SELECT * FROM Customers WHERE city='Pune';

-- Comparison operators =,<,>,>=,<=,<>

SELECT * FROM Customers WHERE age > 21;
SELECT * FROM Customers WHERE name ='Amit';

-- AND 
-- AND: Combines conditions; both conditions must be true.

SELECT * FROM Customers WHERE city='Pune' AND age > 21;

-- OR
-- OR: Combines conditions; at least one condition must be true.

SELECT * FROM Customers WHERE city ='Pune' or city ='Mumbai';

-- ORDER BY
-- Sorts the result according to one or more columns

SELECT * FROM Customers ORDER BY age ASC;

-- DISTINCT 
-- DISTINCT: Removes duplicate values from the query result.

SELECT DISTINCT city FROM Customers;

-- ALIAS
-- AS: Assigns an alias, or temporary name, to a column or table in a query.

SELECT name AS customer_name,city AS customer_city FROM Customers;

-- NULL
-- IS NOT NULL: Checks whether a column contains a non-NULL value.
-- IS NULL: Checks whether a column contains a NULL value.

SELECT * FROM Customers WHERE age IS NOT NULL;
SELECT * FROM Customers WHERE age IS NULL;






