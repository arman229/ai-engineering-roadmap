# SQL Window Functions

Window functions perform calculations across a set of rows related to the current row **without grouping the rows**.

Unlike `GROUP BY`, window functions return a value for **every row** while still allowing access to all rows in the result.

---

# Topics Covered

- OVER Clause
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD()
- LAG()
- FIRST_VALUE()
- LAST_VALUE()
- Running Totals
- Moving Average

---

# What is a Window Function?

A window function performs calculations over a "window" (set) of rows.

General syntax:

```sql
Function() OVER(
    PARTITION BY column
    ORDER BY column
)
```

---

# OVER Clause

The `OVER()` clause defines the window on which the function operates.

Without `OVER()`, aggregate functions return one row.

With `OVER()`, every row is preserved.

Example

```sql
SELECT *,
AVG(salary) OVER()
FROM Employee;
```

---

# PARTITION BY

`PARTITION BY` divides rows into groups before applying the window function.

Example

```sql
SELECT *,
AVG(salary) OVER(PARTITION BY department)
FROM Employee;
```

Each department gets its own average salary.

---

# ORDER BY

Defines the order of rows inside the window.

```sql
ROW_NUMBER() OVER(
ORDER BY salary DESC
)
```

---

# 1. ROW_NUMBER()

Assigns a unique sequential number.

Even duplicate values receive different numbers.

Example

```sql
SELECT *,
ROW_NUMBER() OVER(ORDER BY salary DESC)
FROM Employee;
```

---

# 2. RANK()

Assigns ranks.

Duplicate values receive the same rank.

The next rank is skipped.

Example

```text
Salary

100
100
90
80
```

Ranks

```text
1
1
3
4
```

Example

```sql
SELECT *,
RANK() OVER(ORDER BY salary DESC)
FROM Employee;
```

---

# 3. DENSE_RANK()

Same as `RANK()` but does **not skip** numbers.

Example

```text
Salary

100
100
90
80
```

Dense Rank

```text
1
1
2
3
```

---

# ROW_NUMBER vs RANK vs DENSE_RANK

| Salary | ROW_NUMBER | RANK | DENSE_RANK |
|--------:|-----------:|-----:|-----------:|
| 100 | 1 | 1 | 1 |
| 100 | 2 | 1 | 1 |
| 90 | 3 | 3 | 2 |
| 80 | 4 | 4 | 3 |

---

# 4. LEAD()

Returns the value from the next row.

Example

```sql
SELECT *,
LEAD(salary)
OVER(ORDER BY salary)
FROM Employee;
```

---

# 5. LAG()

Returns the value from the previous row.

Example

```sql
SELECT *,
LAG(salary)
OVER(ORDER BY salary)
FROM Employee;
```

---

# 6. FIRST_VALUE()

Returns the first value in the window.

Example

```sql
SELECT *,
FIRST_VALUE(salary)
OVER(ORDER BY salary DESC)
FROM Employee;
```

---

# 7. LAST_VALUE()

Returns the last value in the window.

Usually used with:

```sql
ROWS BETWEEN
UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

Example

```sql
SELECT *,
LAST_VALUE(salary)
OVER(
ORDER BY salary
ROWS BETWEEN
UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
)
FROM Employee;
```

---

# 8. Running Total

Also called **Cumulative Sum**.

Example

```sql
SELECT *,
SUM(salary)
OVER(
ORDER BY salary
)
FROM Employee;
```

---

# 9. Moving Average

Calculates the average over nearby rows.

Example

```sql
SELECT *,
AVG(salary)
OVER(
ORDER BY salary
ROWS BETWEEN
2 PRECEDING
AND CURRENT ROW
)
FROM Employee;
```

This calculates the average of:

- Current row
- Previous row
- Two rows before

---

# Window Frame

A frame specifies which rows are included.

Common frames

```sql
ROWS BETWEEN
UNBOUNDED PRECEDING
AND CURRENT ROW
```

Running total

```sql
ROWS BETWEEN
2 PRECEDING
AND CURRENT ROW
```

Moving average

```sql
ROWS BETWEEN
UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

Entire window

---

# GROUP BY vs Window Functions

| GROUP BY | Window Function |
|-----------|-----------------|
| Combines rows | Keeps all rows |
| One result per group | One result per row |
| Cannot access original rows | Original rows remain visible |

---

# Summary

| Function | Purpose |
|----------|---------|
| OVER | Defines the window |
| PARTITION BY | Divide rows into groups |
| ROW_NUMBER | Unique numbering |
| RANK | Ranking with gaps |
| DENSE_RANK | Ranking without gaps |
| LEAD | Next row value |
| LAG | Previous row value |
| FIRST_VALUE | First value |
| LAST_VALUE | Last value |
| SUM OVER | Running total |
| AVG OVER | Moving average |

---

# Memory Trick

- **ROW_NUMBER** → Every row gets a unique number.
- **RANK** → Same rank, skip numbers.
- **DENSE_RANK** → Same rank, no skipped numbers.
- **LEAD** → Look ahead.
- **LAG** → Look behind.
- **FIRST_VALUE** → First row in the window.
- **LAST_VALUE** → Last row in the window.

---

