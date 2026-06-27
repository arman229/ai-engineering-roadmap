# SQL Grouping and Aggregation

Grouping and aggregation allow you to organize rows into groups and perform calculations such as counting, summing, and averaging on each group.

---

# Topics Covered

- GROUP BY
- HAVING
- ROLLUP

---

# 1. GROUP BY

The `GROUP BY` clause groups rows that have the same values into a single group.

It is commonly used with aggregate functions like:

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

## Syntax

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
```

## Example

```sql
SELECT name, COUNT(name)
FROM Orders
GROUP BY name;
```

### Result

| name | COUNT |
|------|-------|
| Bag | 2 |
| Shirt | 3 |
| Shoes | 1 |
| Laptop | 1 |

---

# 2. HAVING

The `HAVING` clause filters groups after `GROUP BY` has been applied.

### Difference Between WHERE and HAVING

| WHERE | HAVING |
|--------|---------|
| Filters rows | Filters groups |
| Used before GROUP BY | Used after GROUP BY |
| Cannot use aggregate functions | Can use aggregate functions |

## Syntax

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

## Example

```sql
SELECT name, COUNT(name)
FROM Orders
GROUP BY name
HAVING COUNT(name) > 1;
```

Only products appearing more than once are returned.

---

# 3. ROLLUP

`ROLLUP` is an extension of `GROUP BY`.

Besides grouping rows, it also adds:

- Group subtotals
- Grand total

## Syntax

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name WITH ROLLUP;
```

## Example

```sql
SELECT name, COUNT(name)
FROM Orders
GROUP BY name
WITH ROLLUP;
```

### Example Result

| name | COUNT |
|------|------|
| Bag | 2 |
| Charger | 1 |
| Laptop | 1 |
| Pant | 1 |
| Shirt | 3 |
| Shoes | 1 |
| NULL | 9 |

The last row (`NULL`) represents the **Grand Total**.

---

# Aggregate Functions with GROUP BY

## COUNT()

```sql
SELECT name, COUNT(*)
FROM Orders
GROUP BY name;
```

---

## SUM()

```sql
SELECT name, SUM(price)
FROM Orders
GROUP BY name;
```

---

## AVG()

```sql
SELECT name, AVG(price)
FROM Orders
GROUP BY name;
```

---

## MAX()

```sql
SELECT name, MAX(price)
FROM Orders
GROUP BY name;
```

---

## MIN()

```sql
SELECT name, MIN(price)
FROM Orders
GROUP BY name;
```

---

# Query Execution Order

```text
FROM
   ↓
WHERE
   ↓
GROUP BY
   ↓
HAVING
   ↓
SELECT
   ↓
ORDER BY
   ↓
LIMIT
```

---

# Summary

| Clause | Purpose |
|---------|---------|
| GROUP BY | Group rows with the same values |
| HAVING | Filter grouped results |
| ROLLUP | Add subtotals and grand total |

---

# Quick Example

```sql
SELECT
    name,
    COUNT(*) AS Total
FROM Orders
GROUP BY name
HAVING COUNT(*) > 1;
```

This query:

- Groups products by name
- Counts each product
- Returns only products appearing more than once

---

