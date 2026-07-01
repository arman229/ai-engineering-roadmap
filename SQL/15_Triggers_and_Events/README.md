# SQL Triggers and Events

Triggers and Events are database features used to automate tasks.

The difference is simple:

- **Trigger** → Runs automatically when data changes.
- **Event** → Runs automatically at a scheduled time.

---

# Topics Covered

- Triggers
- Types of Triggers
- OLD and NEW Keywords
- Events
- Trigger vs Event

---

# 1. What is a Trigger?

A **Trigger** is a block of SQL code that automatically executes when an `INSERT`, `UPDATE`, or `DELETE` operation occurs on a table.

You never call a trigger manually.

## Syntax

```sql
CREATE TRIGGER trigger_name
BEFORE | AFTER
INSERT | UPDATE | DELETE
ON table_name
FOR EACH ROW
BEGIN

    SQL Statements;

END;
```

---

# Why Use Triggers?

Triggers are commonly used for:

- Audit logs
- Data validation
- Backup before deletion
- Tracking changes
- Maintaining related tables

---

# Types of Triggers

## BEFORE INSERT

Runs before a row is inserted.

**Example Use Case**

- Prevent negative salary
- Set default values

---

## AFTER INSERT

Runs after inserting a row.

**Example Use Case**

- Create audit logs
- Send notifications

---

## BEFORE UPDATE

Runs before updating a row.

**Example Use Case**

- Validate changes
- Prevent invalid updates

---

## AFTER UPDATE

Runs after updating a row.

**Example Use Case**

- Record salary history
- Track modifications

---

## BEFORE DELETE

Runs before deleting a row.

**Example Use Case**

- Backup important data

---

## AFTER DELETE

Runs after deleting a row.

**Example Use Case**

- Record deletion history

---

# OLD and NEW

Triggers provide two special keywords.

## NEW

Represents the new values.

Example

```sql
NEW.salary
```

---

## OLD

Represents the previous values.

Example

```sql
OLD.salary
```

---

## Which Triggers Can Use OLD and NEW?

| Trigger | OLD | NEW |
|---------|:---:|:---:|
| BEFORE INSERT | ❌ | ✅ |
| AFTER INSERT | ❌ | ✅ |
| BEFORE UPDATE | ✅ | ✅ |
| AFTER UPDATE | ✅ | ✅ |
| BEFORE DELETE | ✅ | ❌ |
| AFTER DELETE | ✅ | ❌ |

---

# 2. What is an Event?

An **Event** is a scheduled SQL task that runs automatically at a specific time or interval.

Think of it as a built-in scheduler (similar to a cron job).

---

# Why Use Events?

Events are useful for:

- Delete expired records
- Archive old data
- Generate reports
- Monthly salary updates
- Daily cleanup
- Weekly backups

---

# Event Syntax

```sql
CREATE EVENT event_name

ON SCHEDULE schedule

DO

SQL Statement;
```

---

## One-Time Event

```sql
CREATE EVENT DeleteTempData

ON SCHEDULE
AT '2026-12-31 23:59:59'

DO

DELETE FROM TempData;
```

---

## Repeating Event

```sql
CREATE EVENT MonthlySalaryIncrease

ON SCHEDULE EVERY 1 MONTH

DO

UPDATE Employee
SET salary = salary + 5000;
```

---

# Enable Event Scheduler (MySQL)

Events work only when the Event Scheduler is enabled.

```sql
SET GLOBAL event_scheduler = ON;
```

Check status

```sql
SHOW VARIABLES LIKE 'event_scheduler';
```

---

# Trigger vs Event

| Feature | Trigger | Event |
|---------|---------|-------|
| Activated By | INSERT, UPDATE, DELETE | Time Schedule |
| Runs Automatically | ✅ | ✅ |
| Uses OLD/NEW | ✅ | ❌ |
| Needs Scheduler | ❌ | ✅ |
| Common Uses | Validation, Logs | Cleanup, Reports |

---

# Advantages of Triggers

- Automatic execution
- Data integrity
- Audit logging
- Enforce business rules
- Synchronize related tables

---

# Advantages of Events

- Automatic scheduling
- No manual execution
- Database maintenance
- Periodic reports
- Cleanup jobs

---

# Summary

| Object | Purpose |
|---------|---------|
| Trigger | Action-based automation |
| Event | Time-based automation |

---

# Memory Trick

- **Trigger** → Motion Sensor 🚶
- **Event** → Alarm Clock ⏰

If someone walks → Trigger runs.

If time arrives → Event runs.

---

