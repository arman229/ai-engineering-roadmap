-- ==========================================
-- SQL Built-in Functions Practice
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
('Laptop', '1', 1100, 2.33, '2023-09-02'),
('Charger', '1', 20, 1.30, '2023-03-09');

-- ==========================================
-- View Records
-- ==========================================

SELECT * FROM Orders;

-- ==========================================
-- Aggregate Functions
-- ==========================================

SELECT COUNT(items) AS Total_Items FROM Orders;

SELECT SUM(price) AS Total_Price FROM Orders;

SELECT AVG(price) AS Average_Price FROM Orders;

SELECT MAX(price) AS Max_Price FROM Orders;

SELECT MIN(price) AS Min_Price FROM Orders;

-- ==========================================
-- String Functions
-- ==========================================

SELECT name, LENGTH(name) AS Length FROM Orders;

SELECT name, UPPER(name) AS Upper_Name FROM Orders;

SELECT name, LOWER(name) AS Lower_Name FROM Orders;

SELECT CONCAT(name, ' Product') AS Product_Name FROM Orders;

-- ==========================================
-- Numeric Functions
-- ==========================================

SELECT name, ROUND(weight,1) AS Rounded_Weight
FROM Orders;

SELECT CEIL(weight) FROM Orders;

SELECT FLOOR(weight) FROM Orders;

SELECT ABS(-50);

-- ==========================================
-- Date & Time Functions
-- ==========================================

SELECT NOW();

SELECT CURDATE();

SELECT CURTIME();

SELECT DAYNAME(order_date) AS Order_Day
FROM Orders;

SELECT YEAR(order_date)
FROM Orders;

SELECT MONTH(order_date)
FROM Orders;

-- ==========================================
-- CASE Expression
-- ==========================================

SELECT *,
CASE
    WHEN price < 50 THEN 'No Send Gift'
    WHEN price < 100 THEN 'Send Watch Gift'
    ELSE 'Send iPhone Gift'
END AS Category
FROM Orders;

-- ==========================================
-- NULL Handling
-- ==========================================

SELECT COALESCE(NULL, NULL, 'Laptop');

SELECT IFNULL(NULL, 'Unknown');

SELECT NULLIF(10,10);

SELECT NULLIF(10,20);