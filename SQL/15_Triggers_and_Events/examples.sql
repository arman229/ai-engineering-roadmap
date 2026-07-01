-- ==========================================
-- SQL Triggers & Events Practice
-- ==========================================

CREATE DATABASE IF NOT EXISTS CompanyDB;

USE CompanyDB;

-- ==========================================
-- Create Tables
-- ==========================================

CREATE TABLE Employees(

    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL

);

CREATE TABLE EmployeeLogs(

    log_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    action_type VARCHAR(30),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE DeletedEmployees(

    id INT,
    name VARCHAR(50),
    salary DECIMAL(10,2)

);

-- ==========================================
-- BEFORE INSERT Trigger
-- Prevent Negative Salary
-- ==========================================

DELIMITER //

CREATE TRIGGER before_insert_employee

BEFORE INSERT
ON Employees

FOR EACH ROW

BEGIN

    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;

END//

DELIMITER ;

-- ==========================================
-- AFTER INSERT Trigger
-- Log New Employee
-- ==========================================

DELIMITER //

CREATE TRIGGER after_insert_employee

AFTER INSERT
ON Employees

FOR EACH ROW

BEGIN

INSERT INTO EmployeeLogs
(employee_id,action_type,new_salary)

VALUES
(NEW.id,'INSERT',NEW.salary);

END//

DELIMITER ;

-- ==========================================
-- BEFORE UPDATE Trigger
-- Prevent Salary Decrease
-- ==========================================

DELIMITER //

CREATE TRIGGER before_update_employee

BEFORE UPDATE
ON Employees

FOR EACH ROW

BEGIN

IF NEW.salary < OLD.salary THEN
SET NEW.salary = OLD.salary;
END IF;

END//

DELIMITER ;

-- ==========================================
-- AFTER UPDATE Trigger
-- Save Salary History
-- ==========================================

DELIMITER //

CREATE TRIGGER after_update_employee

AFTER UPDATE
ON Employees

FOR EACH ROW

BEGIN

INSERT INTO EmployeeLogs(

employee_id,
action_type,
old_salary,
new_salary

)

VALUES(

NEW.id,
'UPDATE',
OLD.salary,
NEW.salary

);

END//

DELIMITER ;

-- ==========================================
-- BEFORE DELETE Trigger
-- Backup Employee
-- ==========================================

DELIMITER //

CREATE TRIGGER before_delete_employee

BEFORE DELETE
ON Employees

FOR EACH ROW

BEGIN

INSERT INTO DeletedEmployees

VALUES(
OLD.id,
OLD.name,
OLD.salary
);

END//

DELIMITER ;

-- ==========================================
-- AFTER DELETE Trigger
-- Log Delete
-- ==========================================

DELIMITER //

CREATE TRIGGER after_delete_employee

AFTER DELETE
ON Employees

FOR EACH ROW

BEGIN

INSERT INTO EmployeeLogs(

employee_id,
action_type

)

VALUES(

OLD.id,
'DELETE'

);

END//

DELIMITER ;

-- ==========================================
-- Trigger Examples
-- ==========================================

INSERT INTO Employees(name,salary)
VALUES('Ali',50000);

INSERT INTO Employees(name,salary)
VALUES('Sara',-1000);

UPDATE Employees
SET salary = 70000
WHERE id = 1;

DELETE FROM Employees
WHERE id = 2;

SELECT * FROM Employees;

SELECT * FROM EmployeeLogs;

SELECT * FROM DeletedEmployees;

-- ==========================================
-- Events
-- ==========================================

-- Enable Event Scheduler

SET GLOBAL event_scheduler = ON;

SHOW VARIABLES LIKE 'event_scheduler';

-- ==========================================
-- Repeating Event
-- Increase Salary Monthly
-- ==========================================

CREATE EVENT MonthlySalaryIncrease

ON SCHEDULE EVERY 1 MONTH

DO

UPDATE Employees
SET salary = salary + 5000;

-- ==========================================
-- Daily Cleanup Event
-- ==========================================

CREATE EVENT DeleteOldLogs

ON SCHEDULE EVERY 1 DAY

DO

DELETE FROM EmployeeLogs
WHERE log_time < NOW() - INTERVAL 30 DAY;

-- ==========================================
-- One-Time Event
-- ==========================================

CREATE EVENT OneTimeCleanup

ON SCHEDULE
AT '2026-12-31 23:59:59'

DO

DELETE FROM DeletedEmployees;

-- ==========================================
-- Show Events
-- ==========================================

SHOW EVENTS;

-- ==========================================
-- Drop Triggers
-- ==========================================

DROP TRIGGER IF EXISTS before_insert_employee;
DROP TRIGGER IF EXISTS after_insert_employee;
DROP TRIGGER IF EXISTS before_update_employee;
DROP TRIGGER IF EXISTS after_update_employee;
DROP TRIGGER IF EXISTS before_delete_employee;
DROP TRIGGER IF EXISTS after_delete_employee;

-- ==========================================
-- Drop Events
-- ==========================================

DROP EVENT IF EXISTS MonthlySalaryIncrease;
DROP EVENT IF EXISTS DeleteOldLogs;
DROP EVENT IF EXISTS OneTimeCleanup;