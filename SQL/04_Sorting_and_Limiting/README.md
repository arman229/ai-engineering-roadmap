# SQL Sorting and Limiting

Sorting and limiting help organize query results and retrieve only the required records.

---

# Topics Covered

- ORDER BY
- DISTINCT
- LIMIT
- OFFSET

---

# 1. ORDER BY

The `ORDER BY` clause sorts query results.

## Syntax

```sql
SELECT column_name
FROM table_name
ORDER BY column ASC|DESC;
```

### ASC (Ascending)

Sorts from smallest to largest or A to Z.

```sql
SELECT *
FROM Class1
ORDER BY name ASC;
```

### DESC (Descending)

Sorts from largest to smallest or Z to A.

```sql
SELECT *
FROM Class1
ORDER BY age DESC;
```

### Sort by Multiple Columns

Columns are sorted from left to right.

```sql
SELECT *
FROM Class1
ORDER BY name ASC, city DESC;
```

---

# 2. DISTINCT

Returns only unique values.

## Syntax

```sql
SELECT DISTINCT column_name
FROM table_name;
```

## Example

```sql
SELECT DISTINCT name
FROM Class1;
```

---

# 3. LIMIT

Returns only a specific number of rows.

## Syntax

```sql
SELECT *
FROM table_name
LIMIT number;
```

## Example

```sql
SELECT *
FROM Class1
LIMIT 2;
```

Returns only the first **2 rows**.

---

# 4. OFFSET

Skips a specified number of rows before returning results.

## Syntax

```sql
SELECT *
FROM table_name
LIMIT count OFFSET skip;
```

## Example

```sql
SELECT *
FROM Class1
LIMIT 2 OFFSET 3;
```

Skips the first **3 rows** and returns the next **2 rows**.

### MySQL Shortcut

```sql
SELECT *
FROM Class1
LIMIT 3, 2;
```

`LIMIT 3, 2` is equivalent to:

```sql
LIMIT 2 OFFSET 3;
```

---

# Query Execution Flow

```text
FROM
   ↓
SELECT
   ↓
DISTINCT
   ↓
ORDER BY
   ↓
LIMIT
   ↓
OFFSET
```

---

# Summary

| Clause | Purpose |
|---------|---------|
| ORDER BY | Sort records |
| DISTINCT | Remove duplicate values |
| LIMIT | Return a fixed number of rows |
| OFFSET | Skip rows before returning data |

---

# Quick Example

```sql
SELECT DISTINCT name
FROM Class1
ORDER BY name ASC
LIMIT 2;
```

This query:

- Removes duplicate names
- Sorts them alphabetically
- Returns only the first 2 names

---

