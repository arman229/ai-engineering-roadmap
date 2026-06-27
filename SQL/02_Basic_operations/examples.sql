-- =====================================
-- SQL Basics Practice
-- =====================================
SET SQL_SAFE_UPDATES = 0;
-- Create Database
CREATE DATABASE IF NOT EXISTS SkillTable;

-- Select Database
USE SkillTable;

-- Create Table
CREATE TABLE IF NOT EXISTS Student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    education VARCHAR(50) NOT NULL,
    skills VARCHAR(50) NOT NULL
);

-- Insert Data
INSERT INTO Student(name, city, education, skills)
VALUES
('Arman','Sialkot','Bachelor Degree','Python,SQL, React'),
('Asad','Sialkot','Master Degree','Python, React'),
('Asad','Sialkot','Master Degree','Python, React');

-- View All Records
SELECT * FROM Student;

-- Unique Names
SELECT DISTINCT name
FROM Student;

-- Alias Example
SELECT name AS Student_Name
FROM Student;

-- Disable Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- Delete all records
DELETE FROM Student;

-- Enable Safe Update Mode
SET SQL_SAFE_UPDATES = 1;

-- Delete All Records
DELETE FROM Student;

-- Delete Specific Record
DELETE FROM Student
WHERE id = 1;

-- Remove All Records (Fast)
TRUNCATE TABLE Student;

-- Delete Table
DROP TABLE Student;

-- Delete Database
DROP DATABASE SkillTable;