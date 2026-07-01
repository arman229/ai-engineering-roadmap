# SQL Transactions

A **Transaction** is a group of SQL statements executed as a **single unit of work**.

A transaction ensures that **either all operations succeed or none of them do**.

If an error occurs during the transaction, all previous changes can be undone to keep the database consistent.

---

# Topics Covered

- Transactions
- ACID Properties
- BEGIN / START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT
- Transaction Isolation Levels

---

# Why Do We Need Transactions?

Imagine Ali transfers **$100** to Sara.

Initial Balances

| Account | Balance |
|--------|--------:|
| Ali | 1000 |
| Sara | 500 |

The transfer requires two operations:

1. Deduct $100 from Ali.
2. Add $100 to Sara.

If the database crashes after the first operation but before the second, money disappears.

Transactions solve this problem.

---

# Transaction Flow

```

BEGIN

↓

SQL Statement 1

↓

SQL Statement 2

↓

COMMIT

```

If any statement fails

```

BEGIN

↓

SQL Statement 1

↓

Error

↓

ROLLBACK

```

---

# ACID Properties

Every reliable database transaction follows the ACID properties.

---

## A — Atomicity

> Either **all operations succeed** or **none of them do**.

Example

```

Deduct $100 from Ali

↓

Add $100 to Sara

```

If adding money to Sara fails, the deduction from Ali is automatically undone.

---

## C — Consistency

The database must remain valid before and after the transaction.

Before Transfer

| Account | Balance |
|--------|--------:|
| Ali | 1000 |
| Sara | 500 |
| Total | 1500 |

After Transfer

| Account | Balance |
|--------|--------:|
| Ali | 900 |
| Sara | 600 |
| Total | 1500 |

The total money remains unchanged.

---

## I — Isolation

Transactions running at the same time should not interfere with each other.

Example:

Two users withdrawing money simultaneously should never produce an incorrect balance.

---

## D — Durability

Once a transaction is committed, its changes are permanently saved.

Even if the database server crashes, committed data remains safe.

---

# BEGIN

Starts a transaction.

```sql
BEGIN;
```

or

```sql
START TRANSACTION;
```

After BEGIN, changes are **temporary** until COMMIT.

---

# COMMIT

Makes all changes permanent.

```sql
COMMIT;
```

After COMMIT, changes cannot be rolled back.

---

# ROLLBACK

Cancels the transaction and restores the previous state.

```sql
ROLLBACK;
```

Useful when an error occurs before the transaction is completed.

---

# SAVEPOINT

A **Savepoint** creates a checkpoint inside a transaction.

Instead of rolling back the entire transaction, you can roll back only part of it.

Syntax

```sql
SAVEPOINT savepoint_name;
```

Rollback

```sql
ROLLBACK TO savepoint_name;
```

---

# Multiple Savepoints (Real Banking Example)

Suppose a banking system performs five operations:

1. Deduct money from Ali
2. Add money to Sara
3. Insert transaction history
4. Send SMS
5. Send Email

If the Email server is down, should the bank cancel the transfer?

No.

The transfer should succeed because the important work has already completed.

```
BEGIN

↓

Deduct Money

↓

SAVEPOINT money_deducted

↓

Credit Sara

↓

SAVEPOINT transfer_complete

↓

Insert Transaction Log

↓

SAVEPOINT log_saved

↓

Send SMS

↓

SAVEPOINT sms_sent

↓

Send Email

↓

Email Failed

↓

ROLLBACK TO sms_sent

↓

COMMIT
```

Result:

- Money transfer succeeds.
- Transaction log is saved.
- SMS is sent.
- Email is skipped and can be retried later.

---

# Transaction Isolation Levels

Isolation levels determine how one transaction can see changes made by another transaction.

---

## 1. READ UNCOMMITTED

The lowest isolation level.

Other transactions can see **uncommitted** changes.

### Problem

Ali updates salary.

↓

Sara immediately sees it.

↓

Ali performs ROLLBACK.

↓

Sara saw incorrect data.

This is called a **Dirty Read**.

---

## 2. READ COMMITTED

Only committed data is visible.

Dirty reads are prevented.

Most enterprise databases use this level.

---

## 3. REPEATABLE READ (MySQL Default)

If a row is read once, the same value is returned throughout the transaction.

Example

Ali reads:

```
Salary = 50000
```

Another user updates salary to:

```
70000
```

Ali reads again inside the same transaction.

Still sees:

```
50000
```

---

## 4. SERIALIZABLE

The strictest isolation level.

Transactions execute one after another.

Safest but slowest.

Commonly used in banking and financial systems.

---

# Isolation Level Comparison

| Isolation Level | Dirty Read | Repeatable Read | Performance |
|-----------------|:----------:|:---------------:|:-----------:|
| READ UNCOMMITTED | ❌ Allowed | ❌ No | ⭐⭐⭐⭐⭐ |
| READ COMMITTED | ✅ Prevented | ❌ No | ⭐⭐⭐⭐ |
| REPEATABLE READ | ✅ Prevented | ✅ Yes | ⭐⭐⭐ |
| SERIALIZABLE | ✅ Prevented | ✅ Yes | ⭐ |

---

# Real-Life Analogy

Imagine editing a Google Sheet.

READ UNCOMMITTED

Everyone immediately sees your typing.

READ COMMITTED

Others only see your changes after you click Save.

REPEATABLE READ

You continue seeing the same version while editing.

SERIALIZABLE

Only one person edits at a time.

---

# Summary

| Concept | Purpose |
|---------|---------|
| Transaction | Execute multiple operations as one unit |
| Atomicity | All or nothing |
| Consistency | Keep database valid |
| Isolation | Prevent concurrent conflicts |
| Durability | Changes survive crashes |
| BEGIN | Start transaction |
| COMMIT | Permanently save changes |
| ROLLBACK | Undo all changes |
| SAVEPOINT | Roll back partially |
| Isolation Levels | Control concurrent transaction behavior |

---

# Memory Trick

- **BEGIN** → Start 🚀
- **COMMIT** → Save 💾
- **ROLLBACK** → Undo ↩️
- **SAVEPOINT** → Checkpoint 📍
- **Isolation** → Protection 🛡️

---

