-- ==========================================
-- SQL Views Practice
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
-- Create View
-- ==========================================

CREATE VIEW HRDepartment AS

SELECT *
FROM Employee
WHERE department = 'HR';

SELECT *
FROM HRDepartment;

-- ==========================================
-- Update Through View
-- ==========================================

UPDATE HRDepartment
SET salary = 60000
WHERE name = 'Ali';

-- Verify underlying table is updated

SELECT *
FROM Employee;

SELECT *
FROM HRDepartment;

-- ==========================================
-- Create Another View
-- ==========================================

CREATE VIEW EmployeeSalary AS

SELECT
name,
salary
FROM Employee;

SELECT *
FROM EmployeeSalary;

-- ==========================================
-- Non-Updatable View
-- ==========================================

CREATE VIEW DepartmentAverage AS

SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT *
FROM DepartmentAverage;

-- The following UPDATE will fail because
-- aggregate views are not updatable.

-- UPDATE DepartmentAverage
-- SET average_salary = 50000
-- WHERE department = 'HR';

-- ==========================================
-- Materialized View (PostgreSQL)
-- ==========================================

/*

CREATE MATERIALIZED VIEW DepartmentAverageMV AS

SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT * FROM DepartmentAverageMV;

UPDATE Employee
SET salary = 120000
WHERE id = 5;

-- Still shows old values

SELECT * FROM DepartmentAverageMV;

REFRESH MATERIALIZED VIEW DepartmentAverageMV;

SELECT * FROM DepartmentAverageMV;

*/

-- ==========================================
-- MySQL Alternative to Materialized View
-- ==========================================

CREATE TABLE DepartmentAverageCache AS

SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT *
FROM DepartmentAverageCache;

-- Refresh manually after data changes

TRUNCATE TABLE DepartmentAverageCache;

INSERT INTO DepartmentAverageCache

SELECT
department,
AVG(salary)
FROM Employee
GROUP BY department;

SELECT *
FROM DepartmentAverageCache;

-- ==========================================
-- Drop Views
-- ==========================================

DROP VIEW IF EXISTS HRDepartment;

DROP VIEW IF EXISTS EmployeeSalary;

DROP VIEW IF EXISTS DepartmentAverage;