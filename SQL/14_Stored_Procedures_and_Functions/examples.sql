-- ==========================================
-- Stored Procedures & Functions Practice
-- ==========================================

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

INSERT INTO Employee(name,salary,department)
VALUES
('Zaman',40000,'Electrician'),
('Ahmad',100000,'CEO'),
('Zain',100000,'Software Engineer'),
('Ali',50000,'HR'),
('Asad',10000,'Software Engineer'),
('Hamid',8000,'Software Engineer'),
('Usman',40000,'Manager'),
('Arman',30000,'Manager');

SELECT * FROM Employee;

-- ==========================================
-- Stored Procedure
-- ==========================================

DELIMITER //

CREATE PROCEDURE GetEmployees()

BEGIN

    SELECT *
    FROM Employee;

END //

DELIMITER ;

CALL GetEmployees();

-- ==========================================
-- Stored Procedure with Parameter
-- ==========================================

DELIMITER //

CREATE PROCEDURE GetEmployeeBySalary(
    IN minSalary DECIMAL(10,2)
)

BEGIN

    SELECT *
    FROM Employee
    WHERE salary >= minSalary;

END //

DELIMITER ;

CALL GetEmployeeBySalary(40000);

CALL GetEmployeeBySalary(90000);

-- ==========================================
-- Update Using Procedure
-- ==========================================

DELIMITER //

CREATE PROCEDURE IncreaseSalary(

    IN employeeId INT,
    IN amount DECIMAL(10,2)

)

BEGIN

    UPDATE Employee
    SET salary = salary + amount
    WHERE id = employeeId;

END //

DELIMITER ;

CALL IncreaseSalary(1,5000);

SELECT * FROM Employee;

-- ==========================================
-- Function
-- ==========================================

DELIMITER //

CREATE FUNCTION AnnualSalary(
    monthlySalary DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN monthlySalary * 12;

END //

DELIMITER ;

SELECT
name,
salary,
AnnualSalary(salary) AS annual_salary
FROM Employee;

-- ==========================================
-- View
-- ==========================================

CREATE VIEW HRDepartment AS

SELECT *
FROM Employee
WHERE department='HR';

SELECT *
FROM HRDepartment;

-- ==========================================
-- Drop Objects
-- ==========================================

DROP VIEW IF EXISTS HRDepartment;

DROP PROCEDURE IF EXISTS GetEmployees;
DROP PROCEDURE IF EXISTS GetEmployeeBySalary;
DROP PROCEDURE IF EXISTS IncreaseSalary;

DROP FUNCTION IF EXISTS AnnualSalary;