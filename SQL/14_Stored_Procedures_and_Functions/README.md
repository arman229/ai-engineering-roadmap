# SQL Stored Procedures and Functions

Stored Procedures and Functions are reusable database objects that allow SQL code to be stored inside the database.

Instead of writing the same SQL repeatedly, you write it once and reuse it whenever needed.

---

# Topics Covered

- Stored Procedures
- Stored Procedures with Parameters
- Functions
- Views vs Stored Procedures

---

# Why Use Stored Procedures?

Stored Procedures help you:

- Reuse SQL code
- Reduce duplicate queries
- Improve security
- Encapsulate business logic
- Improve maintainability

---

# 1. Stored Procedure

A **Stored Procedure** is a named block of SQL statements that performs one or more tasks.

It is similar to a method in programming languages.

## Syntax

```sql
DELIMITER //

CREATE PROCEDURE procedure_name()
BEGIN

    SQL Statements;

END //

DELIMITER ;
```

Call it using:

```sql
CALL procedure_name();
```

---

# Example

```sql
DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN

    SELECT *
    FROM Employee;

END //

DELIMITER ;
```

Execute

```sql
CALL GetEmployees();
```

---

# Stored Procedure with Parameters

Stored procedures can accept input values.

Example

```sql
DELIMITER //

CREATE PROCEDURE GetEmployeeBySalary(IN minSalary DECIMAL(10,2))
BEGIN

    SELECT *
    FROM Employee
    WHERE salary >= minSalary;

END //

DELIMITER ;
```

Call

```sql
CALL GetEmployeeBySalary(50000);
```

---

# Updating Data Using a Procedure

```sql
DELIMITER //

CREATE PROCEDURE IncreaseSalary(

    IN employeeId INT,
    IN amount DECIMAL(10,2)

)

BEGIN

    UPDATE Employee
    SET salary = salary + amount
    WHERE id = employeeId;

END //

DELIMITER ;
```

Call

```sql
CALL IncreaseSalary(1,10000);
```

---

# 2. SQL Functions

A **Function** returns exactly one value.

Functions can be used inside SQL statements.

---

## Syntax

```sql
DELIMITER //

CREATE FUNCTION function_name(...)
RETURNS datatype

BEGIN

    RETURN value;

END //

DELIMITER ;
```

---

# Example

```sql
DELIMITER //

CREATE FUNCTION AnnualSalary(monthlySalary DECIMAL(10,2))

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN monthlySalary * 12;

END //

DELIMITER ;
```

Use

```sql
SELECT
name,
salary,
AnnualSalary(salary) AS annual_salary

FROM Employee;
```

---

# Why Use Functions?

Functions are useful when you need calculations.

Examples

- Calculate annual salary
- Calculate tax
- Calculate bonus
- Convert currencies

---

# Views vs Stored Procedures

Many beginners ask:

> Why use a Stored Procedure when a View can also be reused?

The answer is that they solve different problems.

---

## View

A View is a saved SELECT query.

Example

```sql
CREATE VIEW HRDepartment AS

SELECT *
FROM Employee
WHERE department='HR';
```

Use

```sql
SELECT *
FROM HRDepartment;
```

Views are mainly used for reading data.

---

## Limitation of Views

Views cannot accept parameters.

This is **not valid**.

```sql
CREATE VIEW HighSalary AS

SELECT *
FROM Employee
WHERE salary > ?;
```

If you need different salary limits, you would have to create multiple views.

---

## Stored Procedure

Stored Procedures accept parameters.

```sql
CALL GetEmployeeBySalary(30000);

CALL GetEmployeeBySalary(60000);

CALL GetEmployeeBySalary(100000);
```

One procedure works for every value.

---

# When to Use a Stored Procedure

Stored Procedures are useful when multiple actions must happen together.

Example

```
Place Order

↓

Insert Order

↓

Reduce Stock

↓

Generate Invoice

↓

Record Payment

↓

Send Notification
```

A single procedure can perform the complete workflow.

---

# View vs Stored Procedure

| Feature | View | Stored Procedure |
|---------|------|------------------|
| Reusable | ✅ | ✅ |
| Accept Parameters | ❌ | ✅ |
| Used inside SELECT | ✅ | ❌ |
| Can Update Data | Limited | ✅ |
| Multiple SQL Statements | ❌ | ✅ |
| Conditional Logic | ❌ | ✅ |
| Loops | ❌ | ✅ |
| Best For | Reading data | Business logic |

---

# Advantages of Stored Procedures

- Reusable
- Faster execution
- Better security
- Less network traffic
- Centralized business logic

---

# Advantages of Functions

- Return a value
- Reusable calculations
- Can be used inside SELECT
- Cleaner SQL

---

# Summary

| Object | Purpose |
|---------|---------|
| View | Virtual table for reading data |
| Stored Procedure | Performs actions |
| Function | Returns a value |

---

# Memory Trick

- **View** → Read data
- **Stored Procedure** → Perform actions
- **Function** → Return a value

---

