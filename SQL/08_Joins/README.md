# SQL Joins

Joins combine rows from two or more tables based on a related column.

Without joins, related data stored in different tables cannot be queried together.

---

# Topics Covered

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN
- NATURAL JOIN

---

# Sample Tables

### Students

| student_id | Name | Country |
|-----------:|------|----------|
| 1 | Arman | Pakistan |
| 2 | Asad | India |
| 3 | Usman | USA |
| 4 | Ahmad | UK |

### Courses

| course_id | student_id | Course |
|----------:|-----------:|---------|
| 1 | 2 | Python |
| 2 | 1 | Operating System |
| 3 | 3 | System Design |

Student **Ahmad** has no course.

---

# 1. INNER JOIN

Returns only matching rows from both tables.

## Syntax

```sql
SELECT *
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

## Example

```sql
SELECT s.name AS Student, c.course_name AS Course
FROM Students s
INNER JOIN Courses c
ON s.student_id = c.student_id;
```

### Result

| Student | Course |
|----------|---------|
| Arman | Operating System |
| Asad | Python |
| Usman | System Design |

Ahmad is **not included** because he has no course.

---

# 2. LEFT JOIN

Returns:

- All rows from the left table
- Matching rows from the right table

If no match exists, NULL is returned.

## Example

```sql
SELECT s.name AS Student, c.course_name AS Course
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id;
```

### Result

| Student | Course |
|----------|---------|
| Arman | Operating System |
| Asad | Python |
| Usman | System Design |
| Ahmad | NULL |

---

# 3. RIGHT JOIN

Returns:

- All rows from the right table
- Matching rows from the left table

## Example

```sql
SELECT *
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;
```

Every course has a student, so all courses appear.

---

# 4. FULL OUTER JOIN

Returns:

- All matching rows
- All rows from the left table
- All rows from the right table

MySQL does **not** support `FULL OUTER JOIN` directly.

Use:

```sql
SELECT *
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id

UNION

SELECT *
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;
```

---

# 5. SELF JOIN

A table joins with itself.

Useful for:

- Employee → Manager
- Student → Leader
- Category → Parent Category

## Example

```sql
SELECT
    s.name AS Student,
    l.name AS Leader
FROM Students s
LEFT JOIN Students l
ON s.leader_id = l.student_id;
```

### Result

| Student | Leader |
|----------|---------|
| Arman | NULL |
| Asad | Arman |
| Usman | Asad |
| Ahmad | Usman |

---

# 6. CROSS JOIN

Returns every possible combination.

Formula

```
Rows = Left Table × Right Table
```

If:

Students = 4

Courses = 3

Result = **12 rows**

## Example

```sql
SELECT *
FROM Students
CROSS JOIN Courses;
```

---

# 7. NATURAL JOIN

Automatically joins tables using columns with the same name.

In this example, both tables contain:

```
student_id
```

So MySQL joins using that column automatically.

```sql
SELECT *
FROM Students
NATURAL JOIN Courses;
```

> **Note:** `NATURAL JOIN` is rarely used in production because adding or renaming columns can change the join unexpectedly. Prefer `INNER JOIN ... ON` for better readability and control.


---

# Summary

| Join | Purpose |
|------|---------|
| INNER JOIN | Matching rows only |
| LEFT JOIN | All left rows + matches |
| RIGHT JOIN | All right rows + matches |
| FULL OUTER JOIN | All rows from both tables |
| SELF JOIN | Join a table with itself |
| CROSS JOIN | Every possible combination |
| NATURAL JOIN | Automatic join using common column names |

---

