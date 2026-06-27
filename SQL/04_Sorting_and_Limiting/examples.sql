-- ============================================
-- SQL Sorting and Limiting Practice
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS School;

-- Select Database
USE School;

-- Create Table
CREATE TABLE IF NOT EXISTS Class1(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

-- Insert Records
INSERT INTO Class1(name, city, age)
VALUES
('Ali', 'Sialkot', 10),
('Ali', 'Lahore', 1),
('Baber', 'Karachi', 10),
('Hatim', 'Sialkot', 3),
('Zain', 'Islamabad', 10);

-- ============================================
-- View All Records
-- ============================================

SELECT *
FROM Class1;

-- ============================================
-- DISTINCT
-- ============================================

-- Unique names
SELECT DISTINCT name
FROM Class1;

-- Unique cities
SELECT DISTINCT city
FROM Class1;

-- ============================================
-- ORDER BY
-- ============================================

-- Sort names (A-Z)
SELECT *
FROM Class1
ORDER BY name ASC;

-- Sort age (Highest to Lowest)
SELECT *
FROM Class1
ORDER BY age DESC;

-- Sort by multiple columns
SELECT *
FROM Class1
ORDER BY name ASC, city DESC;

-- ============================================
-- LIMIT
-- ============================================

-- First 2 rows
SELECT *
FROM Class1
LIMIT 2;

-- First 3 rows
SELECT *
FROM Class1
LIMIT 3;

-- ============================================
-- OFFSET
-- ============================================

-- Skip first 3 rows and return next 2
SELECT *
FROM Class1
LIMIT 2 OFFSET 3;

-- MySQL shortcut (same result)
SELECT *
FROM Class1
LIMIT 3, 2;

-- ============================================
-- Combined Example
-- ============================================

SELECT DISTINCT name
FROM Class1
ORDER BY name ASC
LIMIT 2;