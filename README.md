# SaaS Unit Economics Simulation: Revenue Recovery & Infrastructure Optimization 📊

![SQL](https://img.shields.io/badge/Language-PostgreSQL-blue) ![Focus](https://img.shields.io/badge/Focus-Financial_Modeling-green) ![Status](https://img.shields.io/badge/Status-Completed-success)

## 🚀 Executive Summary
**The Problem:** Identifying "Revenue Leakage" in a B2B service platform (Honda Dealership) where 35% of the user base lacked valid contact data, preventing re-engagement.
**The Solution:** I built a SQL-based simulation to treat operational logs as SaaS activity data, modeling Churn Risk and Infrastructure Efficiency.
**The Impact:** Modeled a **$79,830 USD** annual revenue recovery opportunity (Realistic Scenario) by implementing a "Win-Back" strategy for high-LTV accounts.
 
## 🚀 Strategic Impact & Skills

**Target Roles:** Data Analyst | Junior Analytics Engineer | RevOps Analyst | SaaS Operations

**Core Competencies Demonstrated:**
* **Business-First SQL:** Window Functions (`RANK()`), CTEs, and conditional logic used for **Production-oriented analysis**.
* **SaaS Metrics Modeling:** Translation of operational logs into **MRR simulations**, **Churn Proxies**, and **ARPU**.
* **Financial Strategy:** Scenario modeling and **Pareto Analysis** to drive leadership decision-making.

---

## 🔄 The "Translator" Layer (The Business Logic)
I translated physical service events into digital subscription concepts to demonstrate business acumen.

| Operational Concept | SaaS Equivalent | Business Application |
| :--- | :--- | :--- |
| **Missing Phone Number** | **Incomplete User Profile** | Prevents re-engagement & increases Churn Risk. |
| **Service Appointment** | **Active User Session** | Measuring DAU/MAU (Engagement). |
| **Advisor Name** | **Customer Success Manager (CSM)** | Evaluating Account Manager performance. |
| **Morning vs. Afternoon Shift** | **Server Load / Cloud Capacity** | Optimizing AWS/Azure fixed costs during idle times. |
| **Car Models (CR-V, HR-V)** | **Subscription Tiers** | Identifying High-LTV segments for upsell. |



## 🧭 Project Workflow
```mermaid
graph TD
    A[Raw Operational Logs] -->|Cleaning & ETL| B[Refined Business Events]
    B -->|User Mapping| C[Activity Sessions]
    C -->|Gap Analysis| D[Churn Risk Identification]
    D -->|Financial Modeling| E[Revenue Recovery Scenarios]
    E -->|Strategic Insight| F[Leadership Decision Making]
```


## 📂 Repository Structure & Analysis Pipeline

This project follows a strict ETL (Extract, Transform, Load) logic, separating data cleaning from financial analysis.

| File | Type | Business Logic |
| :--- | :--- | :--- |
| `00_schema_prep.sql` & `01_data_quality_audit.sql` | **ETL & Validation** | Normalizes data and filters "impossible" entries (negative hours) to ensure a single source of truth. |
| `02_revenue_leakage.sql` | **Revenue** | Quantifies the "Cost of Bad Data". Calculates total money left on the table due to "Ghost Users". |
| `03_operational_capacity.sql`| **Ops / Cost** | Identifies 40% idle capacity in afternoon shifts—equivalent to "Dead Rent" in cloud infrastructure. |
| `04_product_mix.sql` | **Pareto Strategy** | Uses RANK() to identify the top 2 "Star Tiers" driving 80% of volume. |
| `05_retention_strategy.sql` | **Actionable Churn Logic** |Segments users inactive for >180 days. (180 days chosen to avoid seasonal false positives). |
| `06_scenario_modeling.sql` | **Financial Projections** | Uses conservative ARPU ($120) to compare recovery outcomes. |
| `07_saas_metrics.sql` | **Simulation** | **North Star Metrics**: Calculates Inactivity Rates (Churn Proxy) and Revenue Exposure per Tier. |

---

## ⚖️ Strategic Assumptions & Trade-offs
This analysis favors explainable, conservative assumptions over aggressive forecasting:

**Churn Proxy (180 days)**: Selected to minimize false positives caused by seasonal service patterns. Shorter windows improve recall but reduce actionability.

**ARPU ($120 USD)**: Used as a stable reference point to compare orders of magnitude between scenarios, not as a rigid forecast.

**Scope**: Focuses on revenue recovery and utilization efficiency; acquisition costs (CAC) are intentionally out of scope for this simulation.

---

## 💰 Key Findings & Financial Scenarios

Instead of assuming a "total loss", this analysis models recovery scenarios using a $120 USD ARPU (Conservative Estimate). Note: The goal isn't exact precision, but to compare orders of magnitude between scenarios.

### 📉 Scenario Analysis (Recovery Potential)
| Scenario | Recovery Rate | Estimated Revenue Impact | Strategy Required |
| :--- | :--- | :--- | :--- |
| **Pessimistic** | 5% | **$26,310** | Passive Email Automation |
| **Realistic** | **15%** | **$78,930** | SMS + Dedicated CSM Outreach |
| **Optimistic** | 30% | **$157,860** | Full Account Management Intervention |

## 🧭 Stakeholder Impact (How to use this)
RevOps / Finance: Prioritize win-back campaigns based on expected ROI.

Customer Success: Focus outreach on high-LTV accounts with the highest recovery upside.

Leadership: Decide if recovery efforts justify hiring dedicated headcount (CSMs).

“The objective is to enable decision-making, not to maximize metric complexity.”

---

## 🚧 Limitations & Next Steps
Limitations: Churn is inferred from inactivity, not explicit cancellations. Revenue impact assumes uniform ARPU across tiers.

Next Steps: Validate churn thresholds with historical retention curves and incorporate "Cost of Intervention" to model net ROI.

---

> *Author: Alejandro Diaz | Data Analyst*
> *"Turning raw operational logs into actionable business intelligence."*

## ℹ️ Dataset Note
The original dataset used for this analysis contains sensitive business information (PII) and has been excluded from this public repository to comply with data privacy standards. The SQL logic provided is designed to be executed on standardized service log schemas.