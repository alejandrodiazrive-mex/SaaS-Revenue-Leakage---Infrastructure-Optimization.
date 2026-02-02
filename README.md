# Business Analysis Simulation: Churn Risk & Capacity Optimization 📊
### *Previously: Honda Service Center Operational Audit*

[![Business Context: SaaS/Service Platform Simulation](https://img.shields.io/badge/Business_Context-SaaS_/_Service_Platform_Simulation-blue)](https://github.com/alejandro-diaz/portfolio)
[![SQL](https://img.shields.io/badge/Tech-PostgreSQL-orange)]()
[![Focus](https://img.shields.io/badge/Focus-Revenue_Recovery_%26_Retention-green)]()

## 🎯 Simulation Context: Translating Operational Data into SaaS Business Insights

**This project analyzes a real-world service business dataset (Honda Dealership), but the analytical framework is directly applicable to B2B SaaS platforms facing:**
- **User Churn:** Identifying accounts at risk due to incomplete onboarding data (missing contact info).
- **Infrastructure Efficiency:** Analyzing "Dead Cloud Spend" by mapping underutilized capacity (afternoon shifts) vs. fixed costs.
- **Revenue Leakage:** Quantifying lost ARR (Annual Recurring Revenue) opportunities.

### 🔄 The "Translator" Guide: How to Read This Repo
To view this project through a SaaS lens, use the following mapping:

| Service Business Concept (Raw Data) | SaaS Business Equivalent (The Insight) | Why It Matters |
| :--- | :--- | :--- |
| **Missing Phone Numbers** | **Incomplete User Profile / Unverified Email** | Prevents re-engagement campaigns, increasing Churn Risk. |
| **Service Appointment** | **User Login / Active Session** | Measures Daily/Monthly Active Users (DAU/MAU). |
| **Advisor Name** | **Account Manager / CSM** | Evaluates performance of the Customer Success team. |
| **Morning vs. Afternoon Shift** | **Server Load Peaks vs. Idle Time** | Optimizing infrastructure costs (AWS/Azure) during low-traffic periods. |
| **Car Models (CR-V, HR-V)** | **Subscription Tiers (Enterprise, Pro)** | Identifies High-LTV (Lifetime Value) segments to prioritize. |

---

## 🚀 Executive Summary (The Results)

This project analyzes **4 years of historical data (12,286 records)** to identify operational inefficiencies and revenue leakage.

* **The Problem:** The analysis reveals that **35% of the customer base** lacks valid contact information, creating a significant barrier to retention (The "Ghost User" Phenomenon).
* **The Financial Impact:** Through financial modeling, I estimated a total revenue exposure of **~$526k USD**.
* **The Solution:** Using a scenario-based approach, this repository provides a SQL-driven strategy to potentially **recover $79k USD (Realistic Scenario)** by optimizing data capture and repurposing underutilized capacity.

## 🛠️ Repository Structure & Business Logic

This project moves from data profiling to actionable financial logic using PostgreSQL.

| File | Business Logic (SaaS & Ops) |
| :--- | :--- |
| **00_data_quality_checks.sql** | **Data Integrity Audit:** Validates data quality before analysis (handling NULLs, duplicates, and impossible dates). |
| **01_capture_audit.sql** | **Revenue Leakage Diagnosis:** Calculates financial loss per Account Manager due to missing user data. |
| **02_operational_capacity.sql** | **Infrastructure/Cost Analysis:** Segments usage times to identify "Dead Rent" (or Dead Cloud Spend). |
| **03_product_mix_analysis.sql** | **Pareto Analysis:** Identifies "Star Tiers" (High LTV users) using `RANK()` functions. |
| **04_strategic_retention.sql** | **Win-Back Strategy:** Generates actionable lists of high-value users inactive for >180 days. |
| **05_scenario_analysis.sql** | **Financial Modeling:** Projects revenue recovery scenarios (Optimistic, Realistic, Pessimistic). |

## 💰 Financial Impact & Recovery Scenarios
Instead of assuming a total loss, I modeled three recovery scenarios based on a standard ticket (or ARPU) of $120 USD applied to the 4,385 contactable-at-risk clients.

| Scenario | Recovery Rate | Estimated Revenue Recovery (USD) |
| :--- | :--- | :--- |
| **Pessimistic** | 5% | $26,310.00 |
| **Realistic** | 15% | $78,930.00 |
| **Optimistic** | 30% | $157,860.00 |

## 💻 Technical Stack
* **SQL (PostgreSQL):** Advanced aggregation, Window Functions (`RANK`), CTEs, `CASE WHEN` logic.
* **Data Cleaning:** Handling NULL values, regex for phone validation, and string normalization (`ILIKE`).
* **Business Intelligence:** KPI Definition (Churn Risk, Revenue Leakage, Utilization Rate).

---
*Author: Alejandro Diaz | Data Analyst & Business Intelligence Focus*
*"Turning raw service logs into actionable business intelligence."*