# SQL Set Operations

Set operations combine the results of two or more `SELECT` statements.

Each query must return:

- The same number of columns
- Compatible data types
- Columns in the same order

---

# Topics Covered

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

---

# Rules for Set Operations

Before using any set operation:

✅ Same number of columns

✅ Compatible data types

✅ Same column order

Example

```sql
SELECT name, major FROM StudentsOnCampus

UNION

SELECT name, major FROM StudentsOnline;
```

---

# 1. UNION

`UNION` combines the results of two queries and removes duplicate rows.

## Syntax

```sql
SELECT columns
FROM table1

UNION

SELECT columns
FROM table2;
```

## Example

```sql
SELECT name
FROM StudentsOnCampus

UNION

SELECT name
FROM StudentsOnline;
```

Duplicate student names appear only once.

---

# 2. UNION ALL

`UNION ALL` combines the results of two queries **without removing duplicates**.

It is faster than `UNION` because no duplicate checking is performed.

## Syntax

```sql
SELECT columns
FROM table1

UNION ALL

SELECT columns
FROM table2;
```

## Example

```sql
SELECT name, major
FROM StudentsOnCampus

UNION ALL

SELECT name, major
FROM StudentsOnline;
```

All rows are returned, including duplicates.

---

# 3. INTERSECT

`INTERSECT` returns only rows that exist in **both** queries.

## Syntax

```sql
SELECT columns
FROM table1

INTERSECT

SELECT columns
FROM table2;
```

## Example

```sql
SELECT name, major
FROM StudentsOnCampus

INTERSECT

SELECT name, major
FROM StudentsOnline;
```

Returns only students enrolled in both tables.

> **MySQL Note:** `INTERSECT` is **not supported** in MySQL. You can achieve the same result using an `INNER JOIN` or `EXISTS`.

---

# 4. EXCEPT

`EXCEPT` returns rows from the first query that do **not** exist in the second query.

## Syntax

```sql
SELECT columns
FROM table1

EXCEPT

SELECT columns
FROM table2;
```

## Example

```sql
SELECT name, major
FROM StudentsOnline

EXCEPT

SELECT name, major
FROM StudentsOnCampus;
```

Returns students who are only enrolled online.

> **MySQL Note:** `EXCEPT` is **not supported** in MySQL. Use `NOT EXISTS` or `LEFT JOIN` instead.

---

# UNION vs UNION ALL

| Feature | UNION | UNION ALL |
|---------|--------|-----------|
| Combines results | ✅ | ✅ |
| Removes duplicates | ✅ | ❌ |
| Keeps duplicates | ❌ | ✅ |
| Faster | ❌ | ✅ |

---

# INTERSECT vs EXCEPT

| Operation | Result |
|-----------|--------|
| INTERSECT | Common rows |
| EXCEPT | Rows only in the first query |



---

# Summary

| Operation | Purpose |
|-----------|---------|
| UNION | Combine results and remove duplicates |
| UNION ALL | Combine results and keep duplicates |
| INTERSECT | Return common rows |
| EXCEPT | Return rows only in the first query |

---

