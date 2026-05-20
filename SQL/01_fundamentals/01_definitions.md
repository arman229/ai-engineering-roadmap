## 📦 What is a Database?

A **database** is a place where data is **stored, organized, and managed** so you can easily access and use it.

## 📊 What is a Table?

A **table** is a part of a database where data is stored in a **structured format (rows and columns)**.


## 🧠 What is SQL?

**SQL (Structured Query Language)** is a language used to **communicate with databases**

## 🧠 What is DBMS?

**DBMS (Database Management System)** is software used to manage data, typically storing it as files

### 📌 Why we use DBMS?

We use DBMS when:

* Data is small or simple
* Relationships are not important
* We need fast storage without strict rules

---

### ✅ Benefits of DBMS

* Easy to use and lightweight
* Faster for simple operations
* Less setup complexity
* Flexible data storage

---

### ❌ Weaknesses of DBMS

* No strong data relationships
* High chance of duplicate data
* Weak data integrity (data can become inconsistent)
* Difficult to scale for complex systems
* No strict rules for structure

---

### 📌 DBMS Real Example

* File systems (Windows folders)
* Simple text-based storage
* MongoDB (NoSQL system, often categorized separately)



## 🧠 What is RDBMS?

**RDBMS (Relational Database Management System)** is an advanced type of DBMS that stores data in **tables (rows and columns)** and connects them using relationships.

### ✅ Benefits of RDBMS

* Strong data integrity (no incorrect data)
* Relationships between tables (foreign keys)
* No or very low data duplication
* Powerful querying using SQL
* Safe transactions (ACID properties)
* Scales well for enterprise systems

---

### ❌ Weaknesses of RDBMS

* More complex to design
* Slower than NoSQL for some big data cases
* Requires schema planning before use
* Scaling horizontally is harder (compared to NoSQL)

---

### 📌 RDBMS Real Example

* PostgreSQL 
* MySQL
* Oracle


What are relational and non-relational DBMS?
 
## 1. Relational DBMS (RDBMS)

A **relational database** stores data in **tables (rows and columns)**, like Excel sheets.

It follows strict structure (schema).

Examples:

* MySQL
* PostgreSQL
* Oracle Database
 

---

## 2. Non-Relational DBMS (NoSQL)

A **non-relational database** stores data in flexible formats instead of tables.

Examples:

* MongoDB
* Cassandra
* Redis 
 
