-- ==========================================
-- SQL Database Design Practice
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS UniversityLMS;

USE UniversityLMS;

-- ==========================================
-- Parent Tables
-- ==========================================

CREATE TABLE Students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL
);

-- ==========================================
-- Many-to-Many (Composite Primary Key)
-- ==========================================

CREATE TABLE Enrollments(
    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id),

    FOREIGN KEY(student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY(course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================
-- One-to-Many
-- ==========================================

CREATE TABLE Results(
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY(student_id)
        REFERENCES Students(student_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ==========================================
-- Insert Data
-- ==========================================

INSERT INTO Students(name)
VALUES
('Arman'),
('Asad'),
('Usman'),
('Ahmad');

INSERT INTO Courses(course_name)
VALUES
('Python'),
('Operating System'),
('System Design');

INSERT INTO Enrollments
VALUES
(1,1),
(1,2),
(2,2),
(3,1);

INSERT INTO Results(student_id,status)
VALUES
(1,'Pass'),
(2,'Fail'),
(3,'Pass');

-- ==========================================
-- View Data
-- ==========================================

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Enrollments;

SELECT * FROM Results;

-- ==========================================
-- Test SET NULL
-- ==========================================

DELETE FROM Students
WHERE student_id = 1;

SELECT * FROM Results;

-- ==========================================
-- Test CASCADE
-- ==========================================

DELETE FROM Courses
WHERE course_id = 2;

SELECT * FROM Enrollments;