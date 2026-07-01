-- ==========================================
-- SQL Transactions Practice
-- ==========================================

CREATE DATABASE IF NOT EXISTS BankingSystem;

USE BankingSystem;

-- ==========================================
-- Create Accounts Table
-- ==========================================

CREATE TABLE Accounts(

    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(50) NOT NULL,
    balance DECIMAL(10,2) NOT NULL

);

INSERT INTO Accounts(account_name, balance)
VALUES
('Ali',1000),
('Sara',500);

SELECT * FROM Accounts;

-- ==========================================
-- BEGIN & COMMIT Example
-- Money Transfer
-- ==========================================

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 100
WHERE account_name = 'Ali';

UPDATE Accounts
SET balance = balance + 100
WHERE account_name = 'Sara';

COMMIT;

SELECT * FROM Accounts;

-- ==========================================
-- BEGIN & ROLLBACK Example
-- ==========================================

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 200
WHERE account_name = 'Ali';

-- Something went wrong...

ROLLBACK;

SELECT * FROM Accounts;

-- ==========================================
-- SAVEPOINT Example
-- ==========================================

START TRANSACTION;

-- Step 1
UPDATE Accounts
SET balance = balance - 100
WHERE account_name = 'Ali';

SAVEPOINT deduct_done;

-- Step 2
UPDATE Accounts
SET balance = balance + 100
WHERE account_name = 'Sara';

SAVEPOINT transfer_done;

-- Step 3
INSERT INTO Accounts(account_name, balance)
VALUES ('Transaction Log',0);

SAVEPOINT log_saved;

-- Suppose the last step fails.

ROLLBACK TO transfer_done;

COMMIT;

SELECT * FROM Accounts;

-- ==========================================
-- Multiple Savepoints Example
-- Banking Workflow
-- ==========================================

START TRANSACTION;

-- Deduct money
UPDATE Accounts
SET balance = balance - 50
WHERE account_name='Ali';

SAVEPOINT money_deducted;

-- Credit receiver
UPDATE Accounts
SET balance = balance + 50
WHERE account_name='Sara';

SAVEPOINT money_transferred;

-- Create log
INSERT INTO Accounts(account_name,balance)
VALUES('Audit Record',0);

SAVEPOINT log_created;

-- Imagine SMS sent successfully.

SAVEPOINT sms_sent;

-- Email service fails.

ROLLBACK TO sms_sent;

COMMIT;

-- ==========================================
-- Transaction Isolation Levels
-- ==========================================

-- READ UNCOMMITTED
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

SELECT * FROM Accounts;

COMMIT;

-- READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM Accounts;

COMMIT;

-- REPEATABLE READ (MySQL Default)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM Accounts;

COMMIT;

-- SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT * FROM Accounts;

COMMIT;