# SQL Temporary Tables

A **Temporary Table** is a table that exists only for the current database session (connection).

It is used to store intermediate or temporary data while executing SQL operations.

When the session ends, the temporary table is automatically deleted.

---

# Topics Covered

- What is a Temporary Table?
- Creating Temporary Tables
- Using Temporary Tables
- Dropping Temporary Tables
- Advantages
- Limitations

---

# Why Use Temporary Tables?

Temporary tables are useful when you need to:

- Store intermediate query results
- Simplify complex SQL queries
- Improve readability
- Avoid repeating the same query
- Perform calculations on temporary data

---

# Characteristics

- Exists only during the current session.
- Automatically deleted when the session ends.
- Can be dropped manually.
- Visible only to the current connection.
- Has the same syntax as a normal table.

---

# Syntax

```sql
CREATE TEMPORARY TABLE table_name AS

SELECT ...
FROM table_name;
```

---

# Example

Suppose we have an `Orders` table.

| OrderID | CustomerID | Amount |
|--------:|-----------:|-------:|
| 101 | 1 | 500 |
| 102 | 2 | 300 |
| 103 | 1 | 700 |
| 104 | 3 | 200 |

Create a temporary table containing only high-value orders.

```sql
CREATE TEMPORARY TABLE HighValueOrders AS

SELECT *
FROM Orders
WHERE Amount > 400;
```

Now query it like a normal table.

```sql
SELECT *
FROM HighValueOrders;
```

Result

| OrderID | CustomerID | Amount |
|--------:|-----------:|-------:|
| 101 | 1 | 500 |
| 103 | 1 | 700 |

---

# Creating an Empty Temporary Table

You can also create an empty temporary table.

```sql
CREATE TEMPORARY TABLE TempEmployees(

id INT,
name VARCHAR(50),
salary DECIMAL(10,2)

);
```

Insert data.

```sql
INSERT INTO TempEmployees

VALUES
(1,'Ali',50000),
(2,'Sara',60000);
```

---

# Dropping a Temporary Table

Although temporary tables are automatically removed when the session ends, you can delete them manually.

```sql
DROP TEMPORARY TABLE HighValueOrders;
```

---

# Session Behavior

Connection Starts

↓

Create Temporary Table

↓

Use Temporary Table

↓

Connection Ends

↓

Temporary Table Automatically Deleted

---

# Temporary Table vs Regular Table

| Feature | Temporary Table | Regular Table |
|---------|-----------------|---------------|
| Lifetime | Current Session | Permanent |
| Automatically Deleted | ✅ Yes | ❌ No |
| Visible to Other Users | ❌ No | ✅ Yes |
| Can Store Data | ✅ Yes | ✅ Yes |
| Requires Manual Drop | Optional | Usually Yes |

---

# Advantages

- Faster processing of intermediate data
- Cleaner SQL queries
- Avoid repeating complex queries
- Automatically removed after use
- Session-specific and isolated

---

# Limitations

- Cannot be accessed after the session ends.
- Other users cannot access your temporary tables.
- Data is not permanently stored.

---

# Real-Life Example

Imagine solving a math problem on rough paper.

- The rough paper is used only while solving the problem.
- Once finished, you throw it away.

A Temporary Table works the same way.

---

# Summary

| Object | Purpose |
|---------|---------|
| Temporary Table | Store temporary data during a session |

---

# Memory Trick

- **Temporary Table** → Sticky Note 📝
- **Regular Table** → Notebook 📒

A sticky note is used temporarily and then discarded.

---

 