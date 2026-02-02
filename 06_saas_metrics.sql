-- ADD THESE METRICS FOR MAXIMUM IMPACT:
-- Analyzing Churn (Customer Loss) and its impact on MRR

WITH churn_analysis AS (
    SELECT 
        car_model AS tier,
        COUNT(*) as total_users,
        -- Users who have been inactive for more than 90 days (Churned)
        COUNT(*) FILTER (WHERE appointment_date < CURRENT_DATE - INTERVAL '90 days') as churned_users,
        ROUND(COUNT(*) FILTER (WHERE appointment_date < CURRENT_DATE - INTERVAL '90 days')::numeric / COUNT(*) * 100, 2) as churn_rate_pct
    FROM citas_honda
    GROUP BY 1
)
SELECT 
    tier,
    total_users,
    churned_users,
    churn_rate_pct || '%' as churn_rate,
    -- FINANCIAL IMPACT: MRR Lost Due to Churn
    (churned_users * CASE 
            WHEN tier ILIKE '%CR-V%' THEN 499 
            WHEN tier ILIKE '%HR-V%' THEN 149 
            ELSE 49 
        END
    ) as lost_mrr_per_month_usd
FROM churn_analysis
ORDER BY lost_mrr_per_month_usd DESC
limit 20;