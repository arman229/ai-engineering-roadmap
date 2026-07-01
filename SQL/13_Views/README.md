# SQL Views

A **View** is a virtual table created from the result of a SQL query.

Unlike a regular table, a view usually **does not store data**. Instead, it stores the SQL query and displays the latest data from the underlying table whenever it is queried.

---

# Topics Covered

- Creating Views
- Updating Views
- Materialized Views

---

# Why Use Views?

Views help you:

- Simplify complex queries
- Hide sensitive columns
- Improve security
- Reuse frequently used queries
- Make SQL easier to read

---

# What is a View?

A view behaves like a table but stores only the query definition.

## Syntax

```sql
CREATE VIEW view_name AS
SELECT ...
FROM table_name;
```

---

# Example Table

## Employee

| ID | Name | Salary | Department |
|---:|------|-------:|------------|
| 1 | Ahmad | 100000 | CEO |
| 2 | Ali | 50000 | HR |
| 3 | Asad | 10000 | Software Engineer |
| 4 | Arman | 30000 | Manager |

---

# 1. Creating a View

Create a view containing only HR employees.

```sql
CREATE VIEW HRDepartment AS
SELECT *
FROM Employee
WHERE department = 'HR';
```

Query the view.

```sql
SELECT *
FROM HRDepartment;
```

---

# 2. Updating a View

Simple views based on a single table are usually updatable.

Example

```sql
UPDATE HRDepartment
SET salary = 60000
WHERE id = 5;
```

The data is actually updated in the **Employee** table.

You can verify this by running:

```sql
SELECT *
FROM Employee;
```

---

# When is a View NOT Updatable?

Views generally cannot be updated if they contain:

- GROUP BY
- DISTINCT
- Aggregate functions (`SUM`, `AVG`, `COUNT`, etc.)
- UNION
- Subqueries in the SELECT list
- Multiple complex joins

Example

```sql
CREATE VIEW DepartmentAverage AS
SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;
```

Trying to update this view will fail.

---

# 3. Materialized View

A Materialized View stores the query result physically.

Unlike a normal view, it does not automatically reflect changes in the underlying table.

It must be refreshed manually (or on a schedule).

---

## PostgreSQL Example

```sql
CREATE MATERIALIZED VIEW DepartmentAverage AS

SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;
```

View the data.

```sql
SELECT *
FROM DepartmentAverage;
```

Update the Employee table.

```sql
UPDATE Employee
SET salary = 120000
WHERE id = 2;
```

The materialized view still contains the old values.

Refresh it.

```sql
REFRESH MATERIALIZED VIEW DepartmentAverage;
```

Now the materialized view shows the updated averages.

---

# MySQL Note

MySQL does **not** support materialized views.

A common workaround is:

1. Create a table.

```sql
CREATE TABLE DepartmentAverage AS

SELECT
department,
AVG(salary) AS average_salary
FROM Employee
GROUP BY department;
```

2. Refresh manually.

```sql
TRUNCATE TABLE DepartmentAverage;

INSERT INTO DepartmentAverage

SELECT
department,
AVG(salary)
FROM Employee
GROUP BY department;
```

---

# View vs Materialized View

| Feature | View | Materialized View |
|---------|------|-------------------|
| Stores data | ❌ No | ✅ Yes |
| Stores SQL | ✅ Yes | ✅ Yes |
| Reflects latest table data | ✅ Yes | ❌ No |
| Needs refresh | ❌ No | ✅ Yes |
| Faster for complex queries | ❌ | ✅ |

---

# Advantages of Views

- Easier queries
- Better security
- Reusable SQL
- Cleaner applications
- Hide unnecessary columns

---

# Limitations

- Complex views may not be updatable.
- Performance depends on the underlying query.
- Materialized Views require manual or scheduled refreshes.

---

# Summary

| Topic | Description |
|--------|-------------|
| View | Virtual table |
| Create View | Save a query as a reusable object |
| Update View | Updates the underlying table (if allowed) |
| Materialized View | Physically stores query results |

---

# Memory Trick

- **View** → Live camera 📹 (always shows current data)
- **Materialized View** → Photograph 📸 (shows stored data until refreshed)

---

