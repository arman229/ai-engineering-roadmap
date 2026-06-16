 

# Framework for System Design Interviews 

A **System Design Interview** is an interview where the interviewer asks you to design a large software system like:

* YouTube
* WhatsApp
* Instagram Feed
* Uber
* Google Search
* Netflix

The interviewer does **NOT** expect you to build the real system completely.

They want to see:

* How you think
* How you solve problems
* How you communicate
* How you handle unclear requirements
* How you make decisions

---

# Why System Design Interviews Feel Difficult

The questions are usually very broad.

Example:

> “Design YouTube.”

Now you may think:

> “How can I build YouTube in 1 hour when thousands of engineers built it over many years?”

The answer is:

You are **NOT** expected to build the entire real-world system.

The interviewer only wants to see your **thinking process**.

---

# Real Meaning of a System Design Interview

It simulates a real engineering discussion between coworkers.


Imagine:

* You are a software engineer
* Your manager says:

> “We need to build a chat system.”

Now engineers discuss:

* Features
* Scale
* Database
* APIs
* Performance
* Tradeoffs
* Cost

This is exactly what happens in a system design interview.

---

# What Interviewers Actually Check

Many people think system design interviews only test technical knowledge.

Wrong.

Interviewers also test:

---

## 1. Communication Skills

Can you explain ideas clearly?

Example:

Instead of saying:

> “Use distributed architecture with asynchronous replication.”

Explain simply:

> “We can split traffic across multiple servers so one server does not become overloaded.”

---

## 2. Collaboration

Can you work like a teammate?

Good candidates discuss ideas with the interviewer.

Bad candidates stay silent and act stubborn.

---

## 3. Handling Ambiguity

Real-world problems are unclear.

Example:

“Design Instagram.”

Questions immediately arise:

* Mobile or web?
* Video support?
* Live streaming?
* Stories?
* Messaging?

A good engineer asks questions first.

---

## 4. Problem Solving Under Pressure

Can you think calmly in limited time?

---

## 5. Tradeoff Understanding

Every design has pros and cons.

Example:

### Fast database

* Very fast
* Expensive

### Cheap database

* Slower
* Saves money

Good engineers balance tradeoffs.

---


# Red Flags Interviewers Look For

## 1. Over-Engineering

This means making the system unnecessarily complicated.

Example:

A startup with 100 users does NOT need:

* Kubernetes
* 500 microservices
* AI optimization
* Multi-region replication

Simple solutions are often better.

---

## 2. Jumping to Solutions Too Fast

Jimmy answers immediately without thinking.

In system design interviews, this is BAD.

---

# Why “Jimmy” Is a Bad Example

Jimmy always answers instantly.

But in system design:

Fast answers ≠ good answers.

Example:

Interviewer:

> “Design WhatsApp.”

Bad candidate:

> “Use MongoDB and Redis.”

This is wrong because:

* Requirements are unclear
* Users are unknown
* Features are unknown

Good candidates first ask questions.

---
# The 4-Step Framework

The chapter introduces a **4-step process**.

These 4 steps are the MOST IMPORTANT part.

---

# STEP 1 — Understand the Problem & Establish Scope

This is the MOST important step.

Before designing anything:

You must fully understand:

* What to build
* Features
* Users
* Scale
* Requirements

---

# Why This Step Matters

If requirements are wrong:

The entire design becomes wrong.

Example:

Imagine building a food delivery app.

But later you discover:

> “Oh, we also needed live driver tracking.”

Now the architecture changes completely.

---

# Questions You Should Ask


## 1. What Features Are Needed?

Example:

For Instagram:

* Post images?
* Videos?
* Stories?
* Live streaming?
* Messaging?

---

## 2. Number of Users?

Example:

* 1,000 users?
* 1 million?
* 1 billion?

Scale changes design.

---

## 3. Future Growth?

Example:

Current:

* 1M users

Future:

* 100M users

You must design for growth.

---

## 4. Existing Technology Stack?

Meaning:

What technologies already exist?

Example:

* Existing authentication service
* Existing cloud infrastructure
* Existing databases

This saves time.

---


# Example — News Feed System

Interviewer:

> “Design Facebook News Feed.”

Good candidate asks:

---

### Mobile or web?

Because system behavior changes.

---

### What are important features?

Maybe:

* Posting
* Likes
* Comments
* Feed ranking

---

### Feed order?

Two possibilities:

---

## Reverse Chronological Order

Newest posts first.

Simple.

Example:

| Time  | Post        |
| ----- | ----------- |
| 10:05 | Ali posted  |
| 10:03 | Sara posted |

---

## Ranked Feed

AI decides order.

Example:

Close friend posts appear first.

Much harder.

---

### Media support?

Only text?

Or:

* Images
* Videos

Media dramatically increases storage and bandwidth.

---

# Important Term — DAU

DAU = Daily Active Users

Meaning:

How many users use the app daily.

Example:

10 million DAU means:

10 million people use the app every day.

---

# STEP 2 — Propose High-Level Design

Now you start designing the overall system.

Think of this as:

> “Big picture architecture.”

---

# High-Level Design Means

Showing major components only.

Like:

* Client
* Server
* Database
* Cache
* CDN

NOT tiny details.

---

# Important Terms


# Client

The app users use.

Examples:

* Mobile app
* Web app

---

# API

API = communication method between frontend and backend.

Example:

Mobile app requests:

```http
GET /posts
```

Server sends posts back.

---

# Web Server

Handles requests from users.

Example:

User opens Instagram.

Request goes to server.

Server processes it.

---

# Database

Stores permanent data.

Example:

* Users
* Posts
* Comments

---

# Cache

Temporary fast storage.

Purpose:

* Faster performance

Example:

Instead of reading database every time:

Popular posts stored in Redis cache.

Much faster.

---

# CDN (Content Delivery Network)

Used for fast image/video delivery.

Example:

If user in Pakistan watches a video:

CDN gives nearby server copy instead of USA server.

This reduces latency.

---

# Message Queue

Used for asynchronous tasks.

Examples:

* Email sending
* Notifications
* Video processing

Popular systems:

* Kafka
* RabbitMQ

---



# Back-of-the-Envelope Calculation

This means rough estimation.

Example:

10 million users.

Each uploads:

* 2 MB image daily

Storage needed daily:

 10^7 × 2 MB  = 20 TB

About 20 TB per day.

These quick calculations help estimate scale.

---

# News Feed High-Level Flow

The chapter divides into 2 flows:

---

# 1. Feed Publishing

User creates post.

Flow:

```text
User → Server → Database/Cache → Friends Feed
```

Example:

Ali posts photo.

System:

* Saves photo
* Updates friends' feeds

---


# 2. News Feed Building

When user opens app:

System gathers friend posts.

Then sorts:

* newest first

Then shows feed.

---

# STEP 3 — Design Deep Dive

Now go deeper into important parts.

This is where engineering knowledge matters.

---

# What Happens Here

You discuss:

* Scaling
* Performance
* Bottlenecks
* Database design
* Optimization

---

# Bottleneck Meaning

A bottleneck is a slow point in the system.

Example:

One database server handling:

* 100 million requests

It becomes overloaded.

---


# Example — URL Shortener

Problem:

Convert:

```text
https://veryverylongurl.com/abc
```

Into:

```text
tiny.ly/x7k2
```

Deep dive topic:

How to generate unique short URLs.

---

# Example — Chat System

Important deep dive topics:

* Real-time messaging
* Online/offline status
* Low latency

---

# Latency Meaning

Latency = delay.

Example:

You send WhatsApp message.

If message arrives after 5 seconds:

* high latency

If instantly:

* low latency

---

 

# Important Advice

Do NOT spend too much time on tiny details.

Bad:

Talking 20 minutes about:

* button color
* UI font

Good:

Talking about:

* scalability
* architecture
* databases

---

# STEP 4 — Wrap Up

Final step.

Here interviewer may ask:

---

# 1. Bottlenecks

“What problems may happen later?”

Example:

Single database becomes overloaded.

Solution:

* Database sharding
* Replication

---

# 2. Failure Handling

What if:

* Server crashes?
* Network fails?

---

# 3. Monitoring

How to monitor:

* Errors
* Traffic
* CPU
* Logs

Tools:

* Grafana
* Prometheus

---

# 4. Scaling

Current:

* 1 million users

Future:

* 10 million users

How will system evolve?

---

# 5. Improvements

What would you improve with more time?

This shows engineering maturity.

---

# Important Terms Explained

# Scalability

Ability to handle growth.

Example:

Instagram growing from:

* 1M users
  to
* 500M users

---

# Availability

System stays online.

Example:

WhatsApp should work 24/7.

---

# Reliability

System works correctly consistently.

---

# Fault Tolerance

System survives failures.

Example:

One server crashes but app still works.

---

# Sharding

Splitting database into smaller pieces.

Example:

| Shard    | Users |
| -------- | ----- |
| Server 1 | A–F   |
| Server 2 | G–M   |
| Server 3 | N–Z   |

---

# Replication

Copying database to multiple servers.

Purpose:

* backup
* high availability

---


# Load Balancer

Distributes traffic across servers.

Instead of:

```text
1 server ← all users
```

Use:

```text
Load Balancer
   ↓
Server 1
Server 2
Server 3
```

---

# Chronological Order

Posts ordered by time.

Oldest first.

---

# Reverse Chronological Order

Latest posts appear at top.

Like Instagram or Twitter.

---


# Dos in Interviews

## Ask Questions

Very important.

---

## Communicate Constantly

Think aloud.

---

## Suggest Multiple Solutions

Example:

* SQL database
* NoSQL database

Discuss tradeoffs.

---

## Focus on Important Components

---

# Don’ts in Interviews


## Don’t Jump Into Solution

---

## Don’t Stay Silent

Interviewer cannot understand your thinking.

---

## Don’t Panic If Stuck

Ask hints.

---

# Time Allocation (45-Min Interview)

| Step   | Time      |
| ------ | --------- |
| Step 1 | 3–10 min  |
| Step 2 | 10–15 min |
| Step 3 | 10–25 min |
| Step 4 | 3–5 min   |

---

# Final Main Idea of the Chapter

The MOST important lesson:

> System design interviews are NOT about perfect answers.

They are about:

* Thinking process
* Communication
* Problem solving
* Tradeoffs
* Collaboration
* Scalability understanding
