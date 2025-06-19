# ⚙️ Operation Analytics & Investigating Metric Spikes – SQL Project

## Project Overview

This project focuses on analyzing operational data to identify trends, detect anomalies, and investigate sudden changes in performance metrics. The objective was to simulate the role of a data analyst supporting business teams by delivering insights related to system throughput, user engagement, and platform health.

---

## Objective

- Analyze **job processing data** to track daily and hourly performance trends.
- Investigate **metric spikes** across user engagement, device usage, and email activity.
- Assist cross-functional teams (operations, support, marketing) in identifying bottlenecks, performance anomalies, and optimization opportunities.

---

## Tech Stack

| Tool               | Purpose                                 |
|--------------------|-----------------------------------------|
| **MySQL Workbench**| SQL querying, metric investigation      |
| **SQL**            | Time-based aggregation, rolling metrics |
| **Excel**          | Tabular reporting and visualization     |

---

## Case Studies & Key Metrics

Case Study 1: Job Data Analysis

| Task                   | Insight                                    |
| ---------------------- | ------------------------------------------ |
| Jobs Reviewed Per Hour | Peak on **Nov 28, 2020** with 218 jobs     |
| Throughput (7-day avg) | Highest on Nov 28: **0.06**, Avg: **0.03** |
| Language Share         | **Persian** accounted for 37.5% usage      |
| Duplication Check      | No duplicate rows found in job data        |

--------

Case Study 2: Investigating Metric Spikes

| Task                    | Insight                                                     |
| ----------------------- | ----------------------------------------------------------- |
| Weekly User Engagement  | Peaked in **Week 31**, declined afterward                   |
| User Growth             | Showed instability post Week 31                             |
| Device-Based Engagement | Dominated by **MacBook** and **iPhone** users               |
| Email Analysis          | Open Rate: **34%**, Click Rate: **15%** — Strong engagement |



------


Key Insights

1. Rolling averages are more reliable for tracking volatile daily metrics.
2. Spike detection helped identify peak load events and unusual patterns.
3. Device preferences inform UX optimization (e.g., enhancing iOS experience).
4. Email engagement rates reflect CRM effectiveness, indicating campaign health and customer interest.

--------

Learning Outcomes

1. Mastered writing SQL for time-based metrics, rolling windows, and anomaly detection.
2. Practiced translating SQL queries into actionable business insights.
3. Strengthened understanding of operational KPIs and their relevance across teams.
4. Learned to investigate and narrate metric spikes with data-backed reasoning.

------

Business Impact

1. Enables real-time KPI tracking across operations and product health
2. Helps in early detection of system failures or user behavior anomalies
3. Informs cross-functional teams (ops, support, marketing) with data insights
4. Improves process efficiency, reliability, and decision-making speed
