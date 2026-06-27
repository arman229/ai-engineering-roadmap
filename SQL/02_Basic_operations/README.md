# SQL Basics

This repository contains the basic SQL commands that every beginner should know. Each topic includes a short explanation and practical examples.

---

# Topics Covered

- Create Database
- Use Database
- Create Table
- Insert Data
- SELECT
- SELECT DISTINCT
- Aliases
- DELETE
- TRUNCATE
- DROP TABLE
- DROP DATABASE

---

# 1. Create Database

Creates a new database.

### Syntax

```sql
CREATE DATABASE database_name;
```

### Example

```sql
CREATE DATABASE IF NOT EXISTS SkillTable;
```

**Explanation**

- Creates a database named `SkillTable`.
- `IF NOT EXISTS` prevents an error if the database already exists.

---

# 2. Use Database

Selects the database to work with.

### Syntax

```sql
USE database_name;
```

### Example

```sql
USE SkillTable;
```

---

# 3. Create Table

Creates a table inside the selected database.

### Syntax

```sql
CREATE TABLE table_name(
    column datatype constraints
);
```

### Example

```sql
CREATE TABLE IF NOT EXISTS Student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    education VARCHAR(50) NOT NULL,
    skills VARCHAR(50) NOT NULL
);
```

### Explanation

- `INT` → Integer values
- `VARCHAR(50)` → Text up to 50 characters
- `PRIMARY KEY` → Unique identifier
- `AUTO_INCREMENT` → Automatically increases the ID
- `NOT NULL` → Cannot store empty values

---

# 4. Insert Data

Adds records into a table.

### Syntax

```sql
INSERT INTO table_name(column1, column2)
VALUES(value1, value2);
```

### Example

```sql
INSERT INTO Student(name, city, education, skills)
VALUES
('Arman','Sialkot','Bachelor Degree','Python,SQL, React'),
('Asad','Sialkot','Master Degree','Python, React'),
('Asad','Sialkot','Master Degree','Python, React');
```

---

# 5. SELECT

Retrieves data from a table.

### Syntax

```sql
SELECT * FROM table_name;
```

### Example

```sql
SELECT * FROM Student;
```

### Explanation

`*` means **all columns**.

---

# 6. SELECT DISTINCT

Returns only unique values.

### Syntax

```sql
SELECT DISTINCT column_name
FROM table_name;
```

### Example

```sql
SELECT DISTINCT name
FROM Student;
```

---

# 7. Aliases (AS)

Temporarily renames a column in the output.

### Syntax

```sql
SELECT column_name AS alias_name
FROM table_name;
```

### Example

```sql
SELECT name AS Student_Name
FROM Student;
```

---

# 8. DELETE

Deletes rows from a table.

### Syntax

```sql
DELETE FROM table_name;
```

### Example

```sql
DELETE FROM Student;
```

### Notes

- Deletes only the data.
- Table structure remains.
- Can be used with `WHERE`.

Example:

```sql
DELETE FROM Student
WHERE id = 1;
```

---

# 9. TRUNCATE

Removes all rows quickly.

### Syntax

```sql
TRUNCATE TABLE table_name;
```

### Example

```sql
TRUNCATE TABLE Student;
```

### Notes

- Deletes all records.
- Keeps the table.
- Resets AUTO_INCREMENT.

---

# 10. DROP TABLE

Deletes the table completely.

### Syntax

```sql
DROP TABLE table_name;
```

### Example

```sql
DROP TABLE Student;
```

### Notes

Removes:

- Table
- Data
- Structure

---

# 11. DROP DATABASE

Deletes the entire database.

### Syntax

```sql
DROP DATABASE database_name;
```

### Example

```sql
DROP DATABASE SkillTable;
```

### Notes

Removes:

- Database
- All tables
- All records

---

# Difference Between DELETE, TRUNCATE and DROP

| Command | Deletes Data | Deletes Table | WHERE Allowed | Resets AUTO_INCREMENT |
|----------|--------------|---------------|---------------|----------------------|
| DELETE | ✅ | ❌ | ✅ | ❌ |
| TRUNCATE | ✅ | ❌ | ❌ | ✅ |
| DROP | ✅ | ✅ | ❌ | N/A |

---

# Practice Flow

```text
Create Database
        ↓
Use Database
        ↓
Create Table
        ↓
Insert Data
        ↓
SELECT
        ↓
SELECT DISTINCT
        ↓
Aliases
        ↓
DELETE
        ↓
TRUNCATE
        ↓
DROP TABLE
        ↓
DROP DATABASE
```

---

---

# SQL_SAFE_UPDATES

`SQL_SAFE_UPDATES` is a MySQL safety feature that helps prevent accidental updates or deletions of large amounts of data.

## Disable Safe Update Mode

```sql
SET SQL_SAFE_UPDATES = 0;
```

**Explanation**

- Disables safe update mode.
- Allows `UPDATE` and `DELETE` queries without a `WHERE` clause or `LIMIT`.
- Use with caution, as it can modify or delete all rows.

### Example

```sql
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Student;
```

---

## Enable Safe Update Mode

```sql
SET SQL_SAFE_UPDATES = 1;
```

**Explanation**

- Enables safe update mode.
- Prevents `UPDATE` or `DELETE` statements that don't use a `WHERE` clause with a key column or a `LIMIT`.
- Helps protect your data from accidental changes.

### Example

```sql
SET SQL_SAFE_UPDATES = 1;
```
