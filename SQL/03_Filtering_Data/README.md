# SQL Filtering Data

Filtering data allows us to retrieve only the records that match specific conditions.

---

# Topics Covered

- WHERE
- UPDATE
- Comparison Operators
- LIKE
- IN
- BETWEEN
- Logical Operators (AND, OR, NOT)
- REGEXP
- IS NULL
- IS NOT NULL

---

# 1. WHERE Clause

The `WHERE` clause filters records based on a condition.

## Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

## Example

```sql
SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore';
```

---

# 2. UPDATE

Updates existing records in a table.

## Syntax

```sql
UPDATE table_name
SET column = value
WHERE condition;
```

## Example

```sql
UPDATE PrimeMinsters
SET city = 'Mian Wali'
WHERE city <> 'Lahore';
```

> **Always use a `WHERE` clause** unless you want to update every row.

---

# 3. Comparison Operators

| Operator | Meaning |
|----------|---------|
| = | Equal |
| <> or != | Not Equal |
| > | Greater Than |
| < | Less Than |
| >= | Greater Than or Equal |
| <= | Less Than or Equal |

## Example

```sql
SELECT *
FROM PrimeMinsters
WHERE city != 'Lahore';
```

---

# 4. LIKE

Used to search for a pattern in text.

## Wildcards

| Wildcard | Meaning |
|----------|---------|
| `%` | Zero, one, or many characters |
| `_` | Exactly one character |

## Examples

Ends with "Shrief"

```sql
SELECT *
FROM PrimeMinsters
WHERE name LIKE '%Shrief';
```

Starts with "N"

```sql
SELECT *
FROM PrimeMinsters
WHERE name LIKE 'N%';
```

Contains "han"

```sql
SELECT *
FROM PrimeMinsters
WHERE name LIKE '%han%';
```

Second character is "m"

```sql
SELECT *
FROM PrimeMinsters
WHERE name LIKE '_m%';
```

---

# 5. IN

Checks whether a value exists in a list.

## Syntax

```sql
SELECT *
FROM table_name
WHERE column IN(value1, value2);
```

## Example

```sql
SELECT *
FROM PrimeMinsters
WHERE city IN ('Lahore', 'Mian Wali', 'Sialkot');
```

---

# 6. BETWEEN

Returns values within a range.

## Syntax

```sql
SELECT *
FROM table_name
WHERE column BETWEEN value1 AND value2;
```

## Example

```sql
SELECT *
FROM PrimeMinsters
WHERE joining_date
BETWEEN '2013-01-09' AND '2018-07-26';
```

---

# 7. Logical Operators

## AND

Both conditions must be true.

```sql
SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore'
AND education = 'Bachelor Degree';
```

---

## OR

At least one condition must be true.

```sql
SELECT *
FROM PrimeMinsters
WHERE city = 'Lahore'
OR city = 'Karachi';
```

---

## NOT

Returns records that do **not** satisfy the condition.

```sql
SELECT *
FROM PrimeMinsters
WHERE NOT city = 'Lahore';
```

---

# 8. REGEXP

Matches text using Regular Expressions.

## Syntax

```sql
SELECT *
FROM table_name
WHERE column REGEXP 'pattern';
```

## Example

Names starting with N, P or S

```sql
SELECT *
FROM PrimeMinsters
WHERE name REGEXP '^[NPS]';
```

### Common Patterns

| Pattern | Meaning |
|----------|---------|
| ^A | Starts with A |
| n$ | Ends with n |
| ^[ABC] | Starts with A, B or C |
| [0-9] | Any digit |
| [a-z] | Lowercase letter |

---

# 9. NULL

`NULL` means **no value** or **unknown value**.

It is **not**:

- 0
- Empty string (`''`)

---

## IS NULL

Returns rows where the value is NULL.

```sql
SELECT *
FROM PrimeMinsters
WHERE age IS NULL;
```

---

## IS NOT NULL

Returns rows where the value exists.

```sql
SELECT *
FROM PrimeMinsters
WHERE age IS NOT NULL;
```

---

# Query Execution Flow

```text
FROM
   ↓
WHERE
   ↓
SELECT
```

---

# Summary

| Clause | Purpose |
|---------|---------|
| WHERE | Filter records |
| UPDATE | Modify existing records |
| LIKE | Pattern matching |
| IN | Match multiple values |
| BETWEEN | Match a range |
| AND | All conditions must be true |
| OR | Any condition can be true |
| NOT | Reverse a condition |
| REGEXP | Advanced pattern matching |
| IS NULL | Find NULL values |
| IS NOT NULL | Find non-NULL values |

---

