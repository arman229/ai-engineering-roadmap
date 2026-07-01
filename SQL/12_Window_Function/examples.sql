-- ==========================================
-- SQL Window Functions Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS EmployeeManagement;

USE EmployeeManagement;

-- ==========================================
-- Create Table
-- ==========================================

CREATE TABLE Employee(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- ==========================================
-- Insert Data
-- ==========================================

INSERT INTO Employee(name, salary, department)
VALUES
('Zaman', 40000, 'Electrician'),
('Ahmad', 100000, 'CEO'),
('Zain', 100000, 'Software Engineer'),
('Ahmad', 100000, 'HR'),
('Ali', 50000, 'HR'),
('Asad', 10000, 'Software Engineer'),
('Hamid', 8000, 'Software Engineer'),
('Usman', 40000, 'Manager'),
('Arman', 30000, 'Manager');

-- ==========================================
-- View Data
-- ==========================================

SELECT * FROM Employee;

-- ==========================================
-- OVER + PARTITION BY
-- ==========================================

SELECT *,
AVG(salary) OVER(PARTITION BY department) AS avg_department_salary
FROM Employee;

-- ==========================================
-- ROW_NUMBER
-- ==========================================

SELECT *,
ROW_NUMBER() OVER(ORDER BY salary ASC) AS row_number
FROM Employee;

-- ==========================================
-- RANK
-- ==========================================

SELECT *,
RANK() OVER(ORDER BY salary ASC) AS rank_number
FROM Employee;

-- ==========================================
-- DENSE_RANK
-- ==========================================

SELECT *,
DENSE_RANK() OVER(ORDER BY salary ASC) AS dense_rank
FROM Employee;

-- ==========================================
-- LEAD
-- ==========================================

SELECT *,
LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM Employee;

-- ==========================================
-- LAG
-- ==========================================

SELECT *,
LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM Employee;

-- ==========================================
-- FIRST_VALUE
-- ==========================================

SELECT *,
FIRST_VALUE(salary)
OVER(ORDER BY salary DESC) AS highest_salary
FROM Employee;

-- ==========================================
-- LAST_VALUE
-- ==========================================

SELECT *,
LAST_VALUE(salary)
OVER(
ORDER BY salary
ROWS BETWEEN
UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) AS lowest_salary
FROM Employee;

-- ==========================================
-- Running Total
-- ==========================================

SELECT *,
SUM(salary)
OVER(ORDER BY salary) AS cumulative_salary
FROM Employee;

-- ==========================================
-- Moving Average
-- ==========================================

SELECT *,
AVG(salary)
OVER(
ORDER BY salary
ROWS BETWEEN
2 PRECEDING
AND CURRENT ROW
) AS moving_average
FROM Employee;