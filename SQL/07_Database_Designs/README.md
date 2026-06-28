# SQL Database Design

Database design is the process of organizing data into tables and defining relationships between them. A well-designed database improves data integrity, reduces duplication, and makes queries more efficient.

---

# Topics Covered

- Primary Key
- Foreign Key
- Composite Primary Key
- Constraints
- Advanced Constraints
- Relationships
  - One-to-One
  - One-to-Many
  - Many-to-Many
- ON DELETE
  - RESTRICT
  - CASCADE
  - SET NULL
- ON UPDATE
  - CASCADE
  - SET NULL

---

# 1. Relationships

Relationships define how tables are connected.

---

## One-to-One (1:1)

One row in Table A relates to exactly one row in Table B.

### Example

**Person**

| PersonID | Name |
|---------:|------|
| 1 | Ali |
| 2 | Sara |

**Passport**

| PassportID | PersonID |
|-----------:|---------:|
| 101 | 1 |
| 102 | 2 |

Each person has one passport.

---

## One-to-Many (1:N)

One record can have many related records.

### Example

**Students**

| StudentID | Name |
|----------:|------|
| 1 | Ali |
| 2 | Sara |

**Results**

| ResultID | StudentID |
|---------:|----------:|
| 1 | 1 |
| 2 | 1 |
| 3 | 2 |

A student can have many results.

This is the most common relationship.

---

## Many-to-Many (M:N)

Many records in one table relate to many records in another.

This requires a **junction table**.

### Students

| StudentID | Name |
|----------:|------|
| 1 | Ali |
| 2 | Sara |

### Courses

| CourseID | Course |
|---------:|--------|
| 1 | Python |
| 2 | SQL |

### Enrollments

| StudentID | CourseID |
|----------:|----------:|
| 1 | 1 |
| 1 | 2 |
| 2 | 1 |

Ali studies both Python and SQL.

---

# 2. Primary Key

A Primary Key uniquely identifies every row.

## Properties

- Unique
- Cannot be NULL
- One Primary Key per table

```sql
id INT PRIMARY KEY AUTO_INCREMENT
```

---

# 3. Foreign Key

A Foreign Key creates a relationship between tables.

```sql
FOREIGN KEY(student_id)
REFERENCES Students(id)
```

Benefits

- Maintains data integrity
- Prevents invalid references
- Connects related tables

---

# 4. Composite Primary Key

A Composite Primary Key uses multiple columns together as the primary key.

```sql
PRIMARY KEY(student_id, course_id)
```

Commonly used in Many-to-Many relationships.

---

# 5. Constraints

Constraints ensure valid data.

---

## PRIMARY KEY

Unique identifier.

```sql
PRIMARY KEY(id)
```

---

## FOREIGN KEY

Creates table relationships.

```sql
FOREIGN KEY(student_id)
REFERENCES Students(id)
```

---

## NOT NULL

Column cannot contain NULL.

```sql
name VARCHAR(50) NOT NULL
```

---

## UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

---

## DEFAULT

Provides a default value.

```sql
country VARCHAR(50) DEFAULT 'Pakistan'
```

---

## CHECK

Restricts values.

```sql
age INT CHECK(age >= 18)
```

---

# 6. Advanced Constraints

---

## UNIQUE (Multiple Columns)

```sql
UNIQUE(student_id, course_id)
```

A student cannot enroll in the same course twice.

---

## Composite Primary Key

```sql
PRIMARY KEY(student_id, course_id)
```

---

# 7. Cascading Actions

Foreign keys can define what happens when the parent row changes.

---

## ON DELETE RESTRICT

Prevents deleting the parent row if child rows exist.

```sql
FOREIGN KEY(student_id)
REFERENCES Students(id)
ON DELETE RESTRICT
```

Result

❌ Delete fails.

---

## ON DELETE CASCADE

Deleting the parent automatically deletes all related child rows.

```sql
ON DELETE CASCADE
```

Result

```
Student deleted
↓
Enrollments deleted
↓
Results deleted
```

---

## ON DELETE SET NULL

Deletes the parent but keeps the child rows.

Foreign key becomes NULL.

```sql
ON DELETE SET NULL
```

Result

| student_id |
|------------|
| NULL |

---

## ON UPDATE CASCADE

Updates the foreign key automatically when the parent key changes.

```sql
ON UPDATE CASCADE
```

---

## ON UPDATE SET NULL

Sets the foreign key to NULL if the parent key changes.

```sql
ON UPDATE SET NULL
```

---

# RESTRICT vs CASCADE vs SET NULL

| Action | Parent Deleted | Child Rows |
|---------|---------------|------------|
| RESTRICT | ❌ Not Allowed | Remain |
| CASCADE | ✅ Deleted | Deleted |
| SET NULL | ✅ Deleted | Remain with NULL |

---

# Query Flow Example

```text
Students
      │
      │ 1
      │
      │
      ▼
Enrollments
      ▲
      │
      │ Many
      │
Courses
```

---

# Summary

| Concept | Purpose |
|---------|---------|
| Primary Key | Unique row identifier |
| Foreign Key | Connect tables |
| Composite Primary Key | Multiple columns form a key |
| NOT NULL | Prevent NULL values |
| UNIQUE | Prevent duplicate values |
| DEFAULT | Default column value |
| CHECK | Restrict values |
| One-to-One | One record ↔ One record |
| One-to-Many | One record ↔ Many records |
| Many-to-Many | Many records ↔ Many records |
| CASCADE | Delete/update child rows automatically |
| SET NULL | Keep child rows and set FK to NULL |
| RESTRICT | Prevent deletion if child exists |

---
