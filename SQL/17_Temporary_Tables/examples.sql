-- ==========================================
-- SQL Temporary Tables Practice
-- ==========================================

CREATE DATABASE IF NOT EXISTS Store;

USE Store;

-- ==========================================
-- Create Orders Table
-- ==========================================

CREATE TABLE Orders(

    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL

);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Orders(customer_name, product_name, amount)
VALUES
('Ali','Laptop',90000),
('Asad','Mouse',1500),
('Usman','Keyboard',4500),
('Arman','Monitor',30000),
('Ahmad','USB Cable',800);

SELECT * FROM Orders;

-- ==========================================
-- Create Temporary Table from Query
-- ==========================================

CREATE TEMPORARY TABLE HighValueOrders AS

SELECT *
FROM Orders
WHERE amount >= 5000;

SELECT * FROM HighValueOrders;

-- ==========================================
-- Create Empty Temporary Table
-- ==========================================

CREATE TEMPORARY TABLE TempOrders(

    id INT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2)

);

INSERT INTO TempOrders
VALUES
(1,'Ali',5000),
(2,'Usman',7000);

SELECT * FROM TempOrders;

-- ==========================================
-- Update Temporary Table
-- ==========================================

UPDATE TempOrders
SET amount = amount + 1000
WHERE id = 1;

SELECT * FROM TempOrders;

-- ==========================================
-- Delete Data from Temporary Table
-- ==========================================

DELETE FROM TempOrders
WHERE id = 2;

SELECT * FROM TempOrders;

-- ==========================================
-- Drop Temporary Table
-- ==========================================

DROP TEMPORARY TABLE IF EXISTS HighValueOrders;

DROP TEMPORARY TABLE IF EXISTS TempOrders;

-- ==========================================
-- End of Session
-- ==========================================

-- If you do NOT drop a temporary table,
-- MySQL automatically removes it
-- when the current database session ends.