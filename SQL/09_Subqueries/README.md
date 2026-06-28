# SQL Subqueries

A **subquery** (also called an **inner query** or **nested query**) is a query inside another SQL query.

The inner query executes first, and its result is used by the outer query.

---

# Topics Covered

- Scalar Subqueries
- Correlated Subqueries
- EXISTS
- ANY
- ALL

---

# What is a Subquery?

A subquery can be used inside:

- SELECT
- FROM
- WHERE
- HAVING

Example

```sql
SELECT *
FROM Students
WHERE score = (
    SELECT MAX(score)
    FROM Students
);
```

The inner query finds the maximum score, and the outer query returns the student with that score.

---

# 1. Scalar Subquery

A scalar subquery returns **exactly one value** (one row and one column).

## Syntax

```sql
SELECT *
FROM table_name
WHERE column = (
    SELECT expression
    FROM table_name
);
```

## Example

Find the student with the highest score.

```sql
SELECT *
FROM Students
WHERE score = (
    SELECT MAX(score)
    FROM Students
);
```

---

# 2. Correlated Subquery

A correlated subquery depends on the outer query.

It executes **once for every row** of the outer query.

## Syntax

```sql
SELECT *
FROM table1 t1
WHERE EXISTS (
    SELECT *
    FROM table2 t2
    WHERE t2.column = t1.column
);
```

## Example

Find students who have a country assigned.

```sql
SELECT *
FROM Students s
WHERE EXISTS (
    SELECT *
    FROM Country c
    WHERE c.student_id = s.student_id
);
```

Unlike a normal subquery, this query checks each student individually.

---

# 3. EXISTS

`EXISTS` returns **TRUE** if the subquery returns at least one row.

If no rows are returned, it evaluates to **FALSE**.

## Syntax

```sql
SELECT *
FROM table1
WHERE EXISTS (
    SELECT *
    FROM table2
    WHERE condition
);
```

## Example

Find students whose country is Palestine.

```sql
SELECT *
FROM Students s
WHERE EXISTS (
    SELECT *
    FROM Country c
    WHERE c.name = 'Palestine'
      AND s.student_id = c.student_id
);
```

---

# 4. ANY

`ANY` compares a value with **at least one value** returned by the subquery.

Think of it as:

> **At least one value satisfies the condition.**

## Syntax

```sql
SELECT *
FROM table_name
WHERE column > ANY (
    SELECT column
    FROM table_name
);
```

## Example

Find students whose score is greater than **at least one** Software Engineering student.

```sql
SELECT *
FROM Students
WHERE score > ANY (
    SELECT score
    FROM Students
    WHERE major = 'Software Engineering'
);
```

---

# 5. ALL

`ALL` compares a value with **every value** returned by the subquery.

Think of it as:

> **The condition must be true for every value.**

## Syntax

```sql
SELECT *
FROM table_name
WHERE column >= ALL (
    SELECT column
    FROM table_name
);
```

## Example

Find students whose score is greater than or equal to **every IT student's score**.

```sql
SELECT *
FROM Students
WHERE score >= ALL (
    SELECT score
    FROM Students
    WHERE major = 'IT'
);
```

---

# ANY vs ALL

Suppose Software Engineering scores are:

```
20
40
60
```

| Query | Meaning |
|--------|---------|
| `> ANY` | Greater than at least one value |
| `> ALL` | Greater than every value |

Examples

```
35 > ANY
TRUE
```

Because 35 > 20

```
35 > ALL
FALSE
```

Because 35 is not greater than 40 and 60.

---

# Types of Subqueries

| Type | Returns |
|--------|---------|
| Scalar Subquery | One value |
| Correlated Subquery | Depends on outer query |
| EXISTS | TRUE/FALSE based on rows |
| ANY | Compare with at least one value |
| ALL | Compare with every value |

---

# Query Execution

```text
Outer Query
      │
      ▼
Subquery Executes
      │
      ▼
Returns Result
      │
      ▼
Outer Query Continues
```

---

# Summary

| Clause | Purpose |
|---------|---------|
| Scalar Subquery | Returns one value |
| Correlated Subquery | Executes for every outer row |
| EXISTS | Checks whether rows exist |
| ANY | Compare against at least one value |
| ALL | Compare against all values |

---

