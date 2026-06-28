-- ==========================================
-- SQL Subqueries Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS UniversityLMS;

USE UniversityLMS;

-- ==========================================
-- Create Tables
-- ==========================================

CREATE TABLE Students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    score DECIMAL(10,2) NOT NULL,
    major VARCHAR(100) NOT NULL
);

CREATE TABLE Country(
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id)
);

-- ==========================================
-- Insert Data
-- ==========================================

INSERT INTO Students(name, course_name, score, major)
VALUES
('Ahmad', 'Python', 90.3, 'IT'),
('Hatim', 'Python', 20.3, 'IT'),
('Ahsan', 'Python', 34.9, 'Software Engineering'),
('Azeem', 'Python', 9.9, 'Math'),
('Asad', 'Python', 19.3, 'Software Engineering'),
('Usman', 'Python', 30.3, 'IT'),
('Ali', 'Python', 95.3, 'Math'),
('Arman', 'Python', 99.3, 'Software Engineering');

INSERT INTO Country(student_id, name)
VALUES
(1, 'Pakistan'),
(2, 'USA'),
(3, 'USA'),
(4, 'Palestine');

-- ==========================================
-- View Tables
-- ==========================================

SELECT * FROM Students;

SELECT * FROM Country;

-- ==========================================
-- Scalar Subquery
-- ==========================================

-- Student with highest score

SELECT *
FROM Students
WHERE score = (
    SELECT MAX(score)
    FROM Students
);

-- ==========================================
-- Correlated Subquery
-- ==========================================

-- Students having a country

SELECT *
FROM Students s
WHERE EXISTS (
    SELECT *
    FROM Country c
    WHERE c.student_id = s.student_id
);

-- ==========================================
-- EXISTS
-- ==========================================

-- Students whose country is Palestine

SELECT *
FROM Students s
WHERE EXISTS (
    SELECT *
    FROM Country c
    WHERE c.name = 'Palestine'
      AND c.student_id = s.student_id
);

-- ==========================================
-- ANY
-- ==========================================

SELECT *
FROM Students
WHERE score > ANY (
    SELECT score
    FROM Students
    WHERE major = 'Software Engineering'
);

-- ==========================================
-- ALL
-- ==========================================

SELECT *
FROM Students
WHERE score >= ALL (
    SELECT score
    FROM Students
    WHERE major = 'IT'
);

-- ==========================================
-- Additional Examples
-- ==========================================

-- Students scoring above the average

SELECT *
FROM Students
WHERE score >
(
    SELECT AVG(score)
    FROM Students
);

-- Students having the minimum score

SELECT *
FROM Students
WHERE score =
(
    SELECT MIN(score)
    FROM Students
);