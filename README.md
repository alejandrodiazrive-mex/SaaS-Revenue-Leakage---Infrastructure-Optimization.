# SaaS Unit Economics Simulation: Revenue Recovery & Infrastructure Optimization 📊

![SQL](https://img.shields.io/badge/Language-PostgreSQL-blue) ![Focus](https://img.shields.io/badge/Focus-Financial_Modeling-green) ![Status](https://img.shields.io/badge/Status-Completed-success)

## 🚀 Executive Summary
**The Problem:** Identifying "Revenue Leakage" in a B2B service platform (Honda Dealership) where 35% of the user base lacked valid contact data, preventing re-engagement.
**The Solution:** I built a SQL-based simulation to treat operational logs as SaaS activity data, modeling Churn Risk and Infrastructure Efficiency.
**The Impact:** Modeled a **$79,830 USD** annual revenue recovery opportunity (Realistic Scenario) by implementing a "Win-Back" strategy for high-LTV accounts.

---

## 🔄 The "Translator" Layer (Why this matters for SaaS)
This project analyzes real-world operational data through the lens of **B2B SaaS Metrics**. I translated physical service events into digital subscription concepts to demonstrate business acumen.

| Operational Concept (Raw Data) | SaaS Equivalent (The Insight) | Business Application |
| :--- | :--- | :--- |
| **Missing Phone Number** | **Incomplete User Profile** | Prevents re-engagement & increases Churn Risk. |
| **Service Appointment** | **Active User Session** | Measuring DAU/MAU (Daily/Monthly Active Users). |
| **Advisor Name** | **Customer Success Manager (CSM)** | Evaluating Account Manager performance. |
| **Morning vs. Afternoon Shift** | **Server Load / Cloud Capacity** | Optimizing AWS/Azure fixed costs during idle times. |
| **Car Models (CR-V, HR-V)** | **Subscription Tiers (Pro, Enterprise)** | Identifying High-LTV segments for upsell. |

---

## 📂 Repository Structure & Analysis Pipeline

This project follows a strict ETL (Extract, Transform, Load) logic, separating data cleaning from financial analysis.

| File | Type | Business Logic |
| :--- | :--- | :--- |
| `00_schema_prep.sql` | **ETL / Prep** | Normalizes Spanish raw columns to English business standards (`asesor` → `advisor_name`). |
| `01_data_quality_audit.sql` | **Quality** | Validates integrity (filtering impossible dates & negative billable hours) to ensure accurate reporting. |
| `02_revenue_leakage.sql` | **Revenue** | Quantifies the "Cost of Bad Data". Calculates total money left on the table due to "Ghost Users". |
| `03_operational_capacity.sql`| **Ops / Cost** | Analyzes "Dead Cloud Spend" (Dead Rent). Identifies 40% idle capacity in afternoon shifts. |
| `04_product_mix.sql` | **Strategy** | Uses **Pareto Analysis** (`RANK()`) to identify the top 2 "Star Tiers" driving 80% of volume. |
| `05_retention_strategy.sql` | **Action** | Generates a specific SQL list of High-Value customers at risk of churning (>180 days inactive). |
| `06_scenario_modeling.sql` | **Financial** | Projects recovery outcomes: **Pessimistic (5%)**, **Realistic (15%)**, and **Optimistic (30%)**. |
| `07_saas_metrics.sql` | **Simulation** | **North Star Metrics**: Calculates Inactivity Rates (Churn Proxy) and Revenue Exposure per Tier. |

---

## 💰 Key Findings & Financial Scenarios

Instead of assuming a "total loss," I modeled three recovery scenarios based on a standard ARPU (Average Revenue Per User) of **$120 USD**.

### 📉 Scenario Analysis (Recovery Potential)
| Scenario | Recovery Rate | Estimated Revenue Impact | Strategy Required |
| :--- | :--- | :--- | :--- |
| **Pessimistic** | 5% | **$26,310** | Passive Email Automation |
| **Realistic** | **15%** | **$78,930** | SMS + Dedicated CSM Outreach |
| **Optimistic** | 30% | **$157,860** | Full Account Management Intervention |

---

## 🛠️ Technical Stack & Skills Demonstrated
* **Advanced SQL**: Window Functions (`RANK()`, `OVER`), CTEs (`WITH`), Conditional Aggregation (`FILTER`), and `CASE WHEN` logic.
* **Data Cleaning**: Handling NULLs, string normalization, and regex-like filtering.
* **Business Intelligence**: translating raw logs into actionable KPIs (Churn Rate, Utilization %, ARPU).
* **Financial Modeling**: Creating hypothetical revenue scenarios based on data evidence.

---

> *Author: Alejandro Diaz | Data Analyst*
> *"Turning raw operational logs into actionable business intelligence."*

## ℹ️ Dataset Note
The original dataset used for this analysis contains sensitive business information (PII) and has been excluded from this public repository to comply with data privacy standards. The SQL logic provided is designed to be executed on standardized service log schemas.