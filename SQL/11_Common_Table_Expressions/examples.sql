-- ==========================================
-- SQL Common Table Expressions (CTEs) Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS CompanyDB;

-- Select Database
USE CompanyDB;

-- ==========================================
-- Create Table
-- ==========================================

CREATE TABLE Employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department VARCHAR(50) NOT NULL,
    manager_id INT
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Employees(name, salary, department, manager_id)
VALUES
('Ali',    8000, 'IT',  NULL),
('Sara',   7000, 'HR',  1),
('Ahmed',  6500, 'IT',  1),
('John',   4500, 'HR',  2),
('Ayesha', 9000, 'IT',  NULL),
('Bilal',  5200, 'Sales', 5),
('Hamza',  4800, 'Sales', 6);

-- ==========================================
-- View Data
-- ==========================================

SELECT * FROM Employees;

-- ==========================================
-- 1. Basic CTE
-- ==========================================

-- Employees earning more than 5000

WITH HighSalary AS
(
    SELECT *
    FROM Employees
    WHERE salary > 5000
)

SELECT *
FROM HighSalary;

-- ==========================================
-- Basic CTE with Aggregate Function
-- ==========================================

WITH DepartmentSalary AS
(
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
)

SELECT *
FROM DepartmentSalary;

-- ==========================================
-- 2. Multiple CTEs
-- ==========================================

WITH

ITEmployees AS
(
    SELECT *
    FROM Employees
    WHERE department = 'IT'
),

HREmployees AS
(
    SELECT *
    FROM Employees
    WHERE department = 'HR'
)

SELECT
    employee_id,
    name,
    department
FROM ITEmployees

UNION ALL

SELECT
    employee_id,
    name,
    department
FROM HREmployees;

-- ==========================================
-- Multiple CTEs Referencing Each Other
-- ==========================================

WITH

HighSalary AS
(
    SELECT *
    FROM Employees
    WHERE salary > 5000
),

ITHighSalary AS
(
    SELECT *
    FROM HighSalary
    WHERE department = 'IT'
)

SELECT *
FROM ITHighSalary;

-- ==========================================
-- 3. Recursive CTE
-- ==========================================

WITH RECURSIVE EmployeeHierarchy AS
(
    -- Base Case
    SELECT
        employee_id,
        name,
        manager_id,
        1 AS level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Part
    SELECT
        e.employee_id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
        ON e.manager_id = eh.employee_id
)

SELECT *
FROM EmployeeHierarchy;

-- ==========================================
-- Recursive CTE with Manager Name
-- ==========================================

WITH RECURSIVE EmployeeTree AS
(
    SELECT
        employee_id,
        name,
        manager_id,
        CAST(name AS CHAR(200)) AS hierarchy
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.name,
        e.manager_id,
        CONCAT(et.hierarchy, ' -> ', e.name)
    FROM Employees e
    INNER JOIN EmployeeTree et
        ON e.manager_id = et.employee_id
)

SELECT *
FROM EmployeeTree;