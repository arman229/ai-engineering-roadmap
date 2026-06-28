-- ==========================================
-- SQL Joins Practice
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
    country VARCHAR(50),
    leader_id INT
);

CREATE TABLE Courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    remarks VARCHAR(500),

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id)
);

-- ==========================================
-- Insert Data
-- ==========================================

INSERT INTO Students(name, country, leader_id)
VALUES
('Arman', 'Pakistan', NULL),
('Asad', 'India', 1),
('Usman', 'USA', 2),
('Ahmad', 'UK', 3);

INSERT INTO Courses(student_id, course_name, remarks)
VALUES
(2, 'Python', 'Mandatory course'),
(1, 'Operating System', NULL),
(3, 'System Design', 'Frequently asked in interviews');

-- ==========================================
-- View Tables
-- ==========================================

SELECT * FROM Students;

SELECT * FROM Courses;

-- ==========================================
-- INNER JOIN
-- ==========================================

SELECT *
FROM Students s
INNER JOIN Courses c
ON s.student_id = c.student_id;

-- ==========================================
-- LEFT JOIN
-- ==========================================

SELECT *
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id;

-- ==========================================
-- RIGHT JOIN
-- ==========================================

SELECT *
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;

-- ==========================================
-- FULL OUTER JOIN (MySQL)
-- ==========================================

SELECT *
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id

UNION

SELECT *
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;

-- ==========================================
-- SELF JOIN
-- ==========================================

SELECT
    s.name AS Student,
    l.name AS Leader
FROM Students s
LEFT JOIN Students l
ON s.leader_id = l.student_id;

-- ==========================================
-- CROSS JOIN
-- ==========================================

SELECT *
FROM Students
CROSS JOIN Courses;

-- ==========================================
-- NATURAL JOIN
-- ==========================================

SELECT *
FROM Students
NATURAL JOIN Courses;