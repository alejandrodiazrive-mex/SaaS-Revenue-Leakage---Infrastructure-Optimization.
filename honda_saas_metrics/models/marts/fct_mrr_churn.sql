{{ config(
    materialized='incremental',
    unique_key='month'
) }}

WITH monthly_accounts AS (
    SELECT
        DATE_TRUNC(appointment_date, MONTH) AS month,
        COUNT(DISTINCT customer_account_id) AS active_accounts
    FROM {{ ref('stg_service_logs') }}
    WHERE customer_account_id IS NOT NULL
    
    {% if is_incremental() %}
    AND appointment_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
    {% endif %}
    
    GROUP BY 1
),

mrr_calculation AS (
    SELECT
        month,
        active_accounts,
        (active_accounts * 120) AS mrr_usd,
        LAG(active_accounts) OVER (ORDER BY month) AS prev_active_accounts
    FROM monthly_accounts
)

SELECT 
    *,
    CASE 
        WHEN prev_active_accounts IS NULL THEN 0
        ELSE ROUND((CAST((prev_active_accounts - active_accounts) AS FLOAT64) / NULLIF(prev_active_accounts, 0)) * 100, 2)
    END AS logo_churn_rate_pct
FROM mrr_calculation