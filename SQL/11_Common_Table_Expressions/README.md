# SQL Common Table Expressions (CTEs)

A **Common Table Expression (CTE)** is a temporary named result set that exists only for the duration of a single SQL query.

A CTE makes complex queries easier to read, write, and maintain.

CTEs always start with the `WITH` keyword.

---

# Topics Covered

- Basic CTEs
- Multiple CTEs
- Recursive CTEs

---

# Why Use CTEs?

CTEs help you:

- Improve query readability
- Break large queries into smaller parts
- Avoid repeating the same subquery
- Work with hierarchical (tree-like) data

---

# General Syntax

```sql
WITH cte_name AS
(
    SELECT ...
)
SELECT *
FROM cte_name;
```

---

# Example Table

## Employees

| EmployeeID | Name | Salary | Department | ManagerID |
|-----------:|------|--------:|------------|----------:|
| 1 | Ali | 8000 | IT | NULL |
| 2 | Sara | 7000 | HR | 1 |
| 3 | Ahmed | 6500 | IT | 1 |
| 4 | John | 4500 | HR | 2 |

---

# 1. Basic CTE

A **Basic CTE** creates one temporary result set that can be used immediately by the main query.

## Syntax

```sql
WITH CTE_Name AS
(
    SELECT ...
)
SELECT *
FROM CTE_Name;
```

## Example

Find employees whose salary is greater than 5000.

```sql
WITH HighSalary AS
(
    SELECT *
    FROM Employees
    WHERE Salary > 5000
)

SELECT *
FROM HighSalary;
```

### Output

| Name | Salary |
|------|--------|
| Ali | 8000 |
| Sara | 7000 |
| Ahmed | 6500 |

### How It Works

1. The CTE executes first.
2. Its result is stored temporarily as `HighSalary`.
3. The main query reads from the temporary result.

---

# 2. Multiple CTEs

You can create multiple CTEs in the same query.

Each CTE is separated by a comma.

## Syntax

```sql
WITH
CTE1 AS (...),
CTE2 AS (...)
SELECT ...
```

## Example

```sql
WITH

IT_Employees AS
(
    SELECT *
    FROM Employees
    WHERE Department = 'IT'
),

HR_Employees AS
(
    SELECT *
    FROM Employees
    WHERE Department = 'HR'
)

SELECT *
FROM IT_Employees

UNION ALL

SELECT *
FROM HR_Employees;
```

### How It Works

Two temporary tables are created.

| CTE | Contains |
|------|----------|
| IT_Employees | IT employees |
| HR_Employees | HR employees |

The final query combines both results.

---

# 3. Recursive CTE

A **Recursive CTE** is a CTE that references itself.

It is useful for hierarchical data such as:

- Employee → Manager
- Categories
- Folder structures
- Family trees
- Organizational charts

Recursive CTEs have **two parts**:

1. Base Case
2. Recursive Query

---

## Syntax

```sql
WITH RECURSIVE CTE_Name AS
(
    Base Query

    UNION ALL

    Recursive Query
)
SELECT *
FROM CTE_Name;
```

---

## Example

```sql
WITH RECURSIVE EmployeeTree AS
(
    -- Base Case
    SELECT
        EmployeeID,
        Name,
        ManagerID
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive Part
    SELECT
        e.EmployeeID,
        e.Name,
        e.ManagerID
    FROM Employees e
    INNER JOIN EmployeeTree et
        ON e.ManagerID = et.EmployeeID
)

SELECT *
FROM EmployeeTree;
```

### Execution

**Step 1**

```
Ali
```

↓

**Step 2**

```
Sara
Ahmed
```

↓

**Step 3**

```
John
```

↓

No more employees.

The recursion stops automatically.

---

# Base Case vs Recursive Part

| Part | Purpose |
|------|----------|
| Base Case | Starting point |
| Recursive Part | Finds the next level |

---

# When to Use Recursive CTEs

- Employee hierarchy
- Organization chart
- Folder hierarchy
- Category tree
- Parent-child relationships
- Bill of materials

---

# CTE vs Subquery

| CTE | Subquery |
|------|----------|
| More readable | Can become difficult to read |
| Reusable within the query | Often repeated |
| Better for complex queries | Better for simple queries |
| Supports recursion | Does not support recursion |

---

# Query Execution

```
WITH
     │
     ▼
CTE Executes
     │
     ▼
Temporary Result
     │
     ▼
Main Query Executes
```

---

# Summary

| Type | Description |
|------|-------------|
| Basic CTE | One temporary result set |
| Multiple CTEs | Multiple temporary result sets |
| Recursive CTE | A CTE that references itself |

---

# Memory Trick

- **Basic CTE** → One temporary table
- **Multiple CTEs** → Multiple temporary tables
- **Recursive CTE** → Temporary table that keeps calling itself until no more rows exist

---

# Advantages of CTEs

- Easier to read
- Easier to maintain
- Reduces duplicate SQL
- Simplifies complex queries
- Supports recursive queries

---

