# SQL Built-in Functions

SQL provides many built-in functions to perform calculations, manipulate text, work with dates, and handle NULL values.

---

# Topics Covered

- Data Types
  - CHAR
  - VARCHAR
  - TEXT
- Aggregate Functions
  - COUNT
  - SUM
  - AVG
  - MAX
  - MIN
- String Functions
- Date and Time Functions
- Numeric Functions
- CASE Expressions
- NULL Handling
  - COALESCE
  - IFNULL
  - NULLIF

---

# String Data Types

| Data Type | Description |
|-----------|-------------|
| CHAR | Fixed-length string |
| VARCHAR | Variable-length string (Most commonly used) |
| TEXT | Stores long text or paragraphs |

### Example

```sql
name CHAR(10);
email VARCHAR(100);
description TEXT;
```

---

# 1. Aggregate Functions

Aggregate functions return a single value from multiple rows.

---

## COUNT()

Counts the number of records.

### Syntax

```sql
SELECT COUNT(column_name)
FROM table_name;
```

### Example

```sql
SELECT COUNT(items) AS Total_Items
FROM Orders;
```

---

## SUM()

Returns the total of numeric values.

```sql
SELECT SUM(price) AS Total_Price
FROM Orders;
```

---

## AVG()

Returns the average value.

```sql
SELECT AVG(price) AS Average_Price
FROM Orders;
```

---

## MAX()

Returns the largest value.

```sql
SELECT MAX(price) AS Max_Price
FROM Orders;
```

---

## MIN()

Returns the smallest value.

```sql
SELECT MIN(price) AS Min_Price
FROM Orders;
```

---

# 2. String Functions

String functions manipulate text.

## LENGTH()

Returns the number of characters.

```sql
SELECT LENGTH(name)
FROM Orders;
```

---

## UPPER()

Converts text to uppercase.

```sql
SELECT UPPER(name)
FROM Orders;
```

---

## LOWER()

Converts text to lowercase.

```sql
SELECT LOWER(name)
FROM Orders;
```

---

## CONCAT()

Joins multiple strings together.

```sql
SELECT CONCAT(name, ' Product')
FROM Orders;
```

---

# 3. Date and Time Functions

Used to work with dates and time.

---

## NOW()

Returns the current date and time.

```sql
SELECT NOW();
```

---

## CURDATE()

Returns today's date.

```sql
SELECT CURDATE();
```

---

## CURTIME()

Returns current time.

```sql
SELECT CURTIME();
```

---

## DAYNAME()

Returns the weekday name.

```sql
SELECT DAYNAME(order_date)
FROM Orders;
```

---

## YEAR()

Returns the year.

```sql
SELECT YEAR(order_date)
FROM Orders;
```

---

## MONTH()

Returns the month number.

```sql
SELECT MONTH(order_date)
FROM Orders;
```

---

# 4. Numeric Functions

Numeric functions perform mathematical operations.

---

## ROUND()

Rounds a decimal number.

```sql
SELECT ROUND(weight, 1)
FROM Orders;
```

---

## CEIL()

Rounds up.

```sql
SELECT CEIL(weight)
FROM Orders;
```

---

## FLOOR()

Rounds down.

```sql
SELECT FLOOR(weight)
FROM Orders;
```

---

## ABS()

Returns the absolute value.

```sql
SELECT ABS(-50);
```

---

# 5. CASE Expression

Works like an IF-ELSE statement.

## Syntax

```sql
CASE
    WHEN condition THEN value
    WHEN condition THEN value
    ELSE value
END
```

### Example

```sql
SELECT *,
CASE
    WHEN price < 50 THEN 'No Send Gift'
    WHEN price < 100 THEN 'Send Watch Gift'
    ELSE 'Send iPhone Gift'
END AS Category
FROM Orders;
```

---

# 6. NULL Handling

NULL means **no value** or **unknown value**.

---

## COALESCE()

Returns the first value that is **not NULL**.

```sql
SELECT COALESCE(NULL, NULL, 'Laptop');
```

Returns

```
Laptop
```

---

## IFNULL()

Returns a replacement value if the expression is NULL.

```sql
SELECT IFNULL(NULL, 'Unknown');
```

Returns

```
Unknown
```

---

## NULLIF()

Returns NULL if both values are equal.

```sql
SELECT NULLIF(10,10);
```

Returns

```
NULL
```

Example

```sql
SELECT NULLIF(10,20);
```

Returns

```
10
```

---

# Query Execution Example

```sql
SELECT
    name,
    ROUND(weight,1) AS Weight,
    UPPER(name) AS Upper_Name
FROM Orders;
```

---

# Summary

| Function | Purpose |
|----------|---------|
| COUNT() | Count rows |
| SUM() | Add values |
| AVG() | Average value |
| MAX() | Largest value |
| MIN() | Smallest value |
| LENGTH() | Count characters |
| UPPER() | Convert to uppercase |
| LOWER() | Convert to lowercase |
| CONCAT() | Join strings |
| NOW() | Current date & time |
| DAYNAME() | Weekday name |
| ROUND() | Round decimals |
| CEIL() | Round upward |
| FLOOR() | Round downward |
| ABS() | Absolute value |
| CASE | Conditional logic |
| COALESCE() | First non-NULL value |
| IFNULL() | Replace NULL |
| NULLIF() | Return NULL if equal |

---

