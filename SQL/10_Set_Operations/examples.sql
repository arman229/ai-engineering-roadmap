-- ==========================================
-- SQL Set Operations Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS UniversityLMS;

USE UniversityLMS;

-- ==========================================
-- Create Tables
-- ==========================================

CREATE TABLE StudentsOnCampus(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(100) NOT NULL
);

CREATE TABLE StudentsOnline(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(100) NOT NULL
);

-- ==========================================
-- Insert Data
-- ==========================================

INSERT INTO StudentsOnCampus(name, major)
VALUES
('Ahmad', 'IT'),
('Hatim', 'IT'),
('Ahsan', 'Software Engineering'),
('Azeem', 'Math');

INSERT INTO StudentsOnline(name, major)
VALUES
('Hassan', 'IT'),
('Ahmad', 'IT'),
('Hatim', 'IT'),
('Ahsan', 'Software Engineering'),
('Azeem', 'Math'),
('Asad', 'Software Engineering'),
('Usman', 'IT'),
('Ali', 'Math'),
('Hassan', 'IT'),
('Arman', 'Software Engineering');

-- ==========================================
-- View Tables
-- ==========================================

SELECT * FROM StudentsOnCampus;

SELECT * FROM StudentsOnline;

-- ==========================================
-- UNION
-- ==========================================

SELECT 'OnCampus' AS Type, name
FROM StudentsOnCampus

UNION

SELECT 'Online', name
FROM StudentsOnline;

SELECT name
FROM StudentsOnCampus

UNION

SELECT name
FROM StudentsOnline;

SELECT name, major
FROM StudentsOnCampus

UNION

SELECT name, major
FROM StudentsOnline;

-- ==========================================
-- UNION ALL
-- ==========================================

SELECT name, major
FROM StudentsOnCampus

UNION ALL

SELECT name, major
FROM StudentsOnline;

-- ==========================================
-- INTERSECT (Standard SQL)
-- ==========================================

SELECT name, major
FROM StudentsOnCampus

INTERSECT

SELECT name, major
FROM StudentsOnline;

-- ==========================================
-- EXCEPT (Standard SQL)
-- ==========================================

SELECT name, major
FROM StudentsOnline

EXCEPT

SELECT name, major
FROM StudentsOnCampus;

-- ==========================================
-- MySQL Alternative for INTERSECT
-- ==========================================

SELECT DISTINCT o.name, o.major
FROM StudentsOnCampus o
INNER JOIN StudentsOnline n
ON o.name = n.name
AND o.major = n.major;

-- ==========================================
-- MySQL Alternative for EXCEPT
-- ==========================================

SELECT o.name, o.major
FROM StudentsOnline o
WHERE NOT EXISTS (
    SELECT 1
    FROM StudentsOnCampus c
    WHERE c.name = o.name
      AND c.major = o.major
);