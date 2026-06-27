-- ============================================
-- SQL Filtering Data Practice
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS Pakistan;

-- Select Database
USE Pakistan;

-- Create Table
CREATE TABLE IF NOT EXISTS PrimeMinsters(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    education VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    age INT
);

-- Insert Records
INSERT INTO PrimeMinsters(name, city, education, joining_date, age)
VALUES
('Nawaz Shrief', 'Lahore', 'Bachelor Degree', '2013-01-10', NULL),
('Imran Khan', 'MianWali', 'Master Degree', '2018-07-25', 73),
('Shahbaz Shrief', 'Lahore', 'Bachelor Degree', '2024-02-14', NULL);

-- ============================================
-- WHERE
-- ============================================

SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore';

-- ============================================
-- UPDATE
-- ============================================

UPDATE PrimeMinsters
SET city = 'Mian Wali'
WHERE city <> 'Lahore';

-- ============================================
-- Comparison Operators
-- ============================================

SELECT *
FROM PrimeMinsters
WHERE city != 'Lahore';

SELECT *
FROM PrimeMinsters
WHERE city <> 'Lahore';

-- ============================================
-- LIKE
-- ============================================

-- Ends with "Shrief"
SELECT *
FROM PrimeMinsters
WHERE name LIKE '%Shrief';

-- Starts with "N"
SELECT *
FROM PrimeMinsters
WHERE name LIKE 'N%';

-- Contains "han"
SELECT *
FROM PrimeMinsters
WHERE name LIKE '%han%';

-- Second character is "m"
SELECT *
FROM PrimeMinsters
WHERE name LIKE '_m%';

-- ============================================
-- IN
-- ============================================

SELECT *
FROM PrimeMinsters
WHERE city IN ('Lahore', 'Mian Wali', 'Sialkot');

-- ============================================
-- BETWEEN
-- ============================================

SELECT *
FROM PrimeMinsters
WHERE joining_date
BETWEEN '2013-01-09' AND '2018-07-26';

-- ============================================
-- Logical Operators
-- ============================================

-- AND
SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore'
AND education = 'Bachelor Degree';

-- OR
SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore'
OR city = 'Karachi';

-- NOT
SELECT *
FROM PrimeMinsters
WHERE NOT city = 'Lahore';

-- ============================================
-- REGEXP
-- ============================================

-- Starts with N, P or S
SELECT *
FROM PrimeMinsters
WHERE name REGEXP '^[NPS]';

-- Ends with "n"
SELECT *
FROM PrimeMinsters
WHERE name REGEXP 'n$';

-- ============================================
-- NULL
-- ============================================

-- NULL values
SELECT *
FROM PrimeMinsters
WHERE age IS NULL;

-- NOT NULL values
SELECT *
FROM PrimeMinsters
WHERE age IS NOT NULL;