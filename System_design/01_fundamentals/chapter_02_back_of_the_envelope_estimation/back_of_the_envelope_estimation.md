#  Back-of-the-Envelope Estimation 

Imagine you are building a huge app like Twitter, [YouTube](https://www.youtube.com), or [Facebook](https://www.facebook.com).

Before building it, engineers ask questions like:

* How many users will use it?
* How many servers do we need?
* How much storage is required?
* Can the system handle millions of requests?

But calculating exact numbers is difficult and takes too much time.

So engineers use something called:

# Back-of-the-Envelope Estimation

It means:

> “Quickly estimating large system numbers using simple math and assumptions.” 

---

# 1. Power of Two (Data Size Basics)

Computers store data in binary (0 and 1).

Everything in computers is based on powers of 2.

---

# Simple Data Units

| Unit       | Meaning |
| ---------- | ------- |
| 8 bits     | 1 Byte  |
| 1024 Bytes | 1 KB    |
| 1024 KB    | 1 MB    |
| 1024 MB    | 1 GB    |
| 1024 GB    | 1 TB    |
| 1024 TB    | 1 PB    |

---
 

---

# 2. Latency Numbers (Speed of Operations)

Latency means:

> “How much time something takes.”

Example:

* Opening an app
* Reading data from memory
* Downloading a file

All take time.

---

# Important Time Units

| Unit | Meaning     |
| ---- | ----------- |
| ns   | nanosecond  |
| µs   | microsecond |
| ms   | millisecond |

---

# 3. Availability (System Uptime)

Availability means:

> “How often the system is working.”

---

# Example

If a website crashes often:

* users get angry
* business loses money

So companies want:

* high uptime
* very little downtime

---

# SLA (Service Level Agreement)

This is a promise from the company.

Example:

> “Our service will be available 99.9% of the time.”

---

# Understanding “Nines”

| Availability | Downtime         |
| ------------ | ---------------- |
| 99%          | ~3.65 days/year  |
| 99.9%        | ~8.7 hours/year  |
| 99.99%       | ~52 minutes/year |
| 99.999%      | ~5 minutes/year  |

More 9s = more reliable system.

---

# Twitter Estimation Example (Simplified)

Now let’s understand the Twitter example step-by-step.

---

# Given Assumptions

Suppose:

* 300 million monthly users
* 50% active daily
* each user posts 2 tweets daily
* 10% tweets contain images/videos

---

# Step 1 — Daily Active Users

 
$$
300 \text{ million} \times 50\% = 150 \text{ million users} 
$$

So:

* 150 million users use Twitter daily.

---

# Step 2 — Total Tweets Per Day

Each user posts:

* 2 tweets/day

So:

$$
150\text{ million} \times 2 = 300\text{ million tweets/day}
$$
---

# Step 3 — Tweets Per Second (QPS)

QPS means:

# Queries Per Second

or:

> How many requests happen every second.

There are:

* 24 hours/day
* 3600 seconds/hour

So:
$$
\frac{300\text{ million}}{24 \times 3600} \approx 3500
$$
Meaning:

* Twitter receives about **3500 tweets every second**.

---

# Peak QPS

Traffic is not constant.

At some times:

* many users become active together

So engineers estimate peak load.

Usually:

* Peak QPS ≈ 2 × average QPS
$$
3500 \times 2 \approx 7000
$$
Meaning:

* system should handle 7000 requests/sec safely.

---

# Media Storage Estimation

Suppose:

* 10% tweets contain media
* each media file = 1 MB

Daily media uploads:
$$
150\text{ million} \times 2 \times 10\% \times 1\text{ MB} = 30\text{ TB/day}
$$
So:

* Twitter stores about 30 TB daily.

---

# 5-Year Storage
$$
30\text{ TB} \times 365 \times 5 \approx 55\text{ PB}
$$
That is MASSIVE storage.

---

# Important Tips

# 1. Use Approximation

Instead of:

99987 ÷ 9.1

use:

100000 ÷ 10

Much easier.

---

# 2. Write Assumptions

Always write:

* users
* file size
* traffic
* storage period

because assumptions guide calculations.

---

# 3. Write Units

Always write:

* MB
* GB
* TB
* ms
* seconds

Otherwise confusion happens.

--- 
