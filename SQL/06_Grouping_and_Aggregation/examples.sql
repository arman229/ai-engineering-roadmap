-- ==========================================
-- SQL Grouping and Aggregation Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS Store;

-- Select Database
USE Store;

-- Create Table
CREATE TABLE IF NOT EXISTS Orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    items VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    weight DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL
);

-- Insert Records
INSERT INTO Orders(name, items, price, weight, order_date)
VALUES
('Shoes', '2', 110, 0.33, '2023-03-02'),
('Bag', '1', 10, 1.30, '2024-03-02'),
('Pant', '1', 50, 0.01, '2022-03-02'),
('Shirt', '5', 110, 0.01, '2000-03-02'),
('Shirt', '5', 110, 0.01, '2001-03-02'),
('Bag', '1', 10, 1.30, '2023-03-02'),
('Shirt', '5', 110, 0.01, '2002-03-02'),
('Laptop', '1', 1100, 2.33, '2023-09-02'),
('Charger', '1', 20, 1.30, '2023-03-09');

-- ==========================================
-- View Records
-- ==========================================

SELECT *
FROM Orders;

-- ==========================================
-- GROUP BY
-- ==========================================

-- Count each product
SELECT
    name,
    COUNT(*) AS Total
FROM Orders
GROUP BY name;

-- Total price by product
SELECT
    name,
    SUM(price) AS Total_Price
FROM Orders
GROUP BY name;

-- Average price by product
SELECT
    name,
    AVG(price) AS Average_Price
FROM Orders
GROUP BY name;

-- Maximum price by product
SELECT
    name,
    MAX(price) AS Max_Price
FROM Orders
GROUP BY name;

-- Minimum price by product
SELECT
    name,
    MIN(price) AS Min_Price
FROM Orders
GROUP BY name;

-- ==========================================
-- HAVING
-- ==========================================

-- Products appearing more than once
SELECT
    name,
    COUNT(*) AS Total
FROM Orders
GROUP BY name
HAVING COUNT(*) > 1;

-- Products whose total price exceeds 100
SELECT
    name,
    SUM(price) AS Total_Price
FROM Orders
GROUP BY name
HAVING SUM(price) > 100;

-- ==========================================
-- ROLLUP
-- ==========================================

-- Count with grand total
SELECT
    name,
    COUNT(*) AS Total
FROM Orders
GROUP BY name
WITH ROLLUP;

-- Total sales with grand total
SELECT
    name,
    SUM(price) AS Total_Price
FROM Orders
GROUP BY name
WITH ROLLUP;