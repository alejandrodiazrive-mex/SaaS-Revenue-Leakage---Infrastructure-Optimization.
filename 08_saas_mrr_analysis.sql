/*
PROJECT: SaaS Metrics Simulation
FOCUS: Monthly MRR evolution and account churn trend

ASSUMPTIONS:
- Each distinct `referenc` represents one customer account.
- MRR is estimated using a flat ARPU of $120.
- Churn is inferred from month-over-month account variation.
*/

WITH monthly_accounts AS (
    SELECT
        -- Using appointment_date as the activity timestamp
        DATE_TRUNC('month', appointment_date) AS month,
        COUNT(DISTINCT referenc) AS active_accounts
    FROM citas_honda
    WHERE referenc IS NOT NULL
    GROUP BY 1
),

mrr_calculation AS (
    SELECT
        month,
        active_accounts,
        active_accounts * 120 AS mrr,
        LAG(active_accounts) OVER (ORDER BY month) AS prev_active_accounts
    FROM monthly_accounts
),

churn_metrics AS (
    SELECT
        month,
        active_accounts,
        mrr,
        CASE 
            WHEN prev_active_accounts IS NULL THEN 0
            ELSE ROUND(
                ((prev_active_accounts - active_accounts)::NUMERIC 
                / NULLIF(prev_active_accounts, 0)) * 100, 
                2
            )
        END AS logo_churn_rate_pct,
        CASE 
            WHEN (prev_active_accounts - active_accounts) > 0 
            THEN 'Net Churn'
            ELSE 'Net Growth'
        END AS net_account_trend
    FROM mrr_calculation
)

SELECT *
FROM churn_metrics
ORDER BY month;

/*
NOTE:
Negative churn values reflect net account expansion.
Since acquisition is inferred from first observed activity,
growth periods may produce apparent negative churn.
*/