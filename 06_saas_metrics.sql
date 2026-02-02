/* SCRIPT: 06_saas_metrics_calculation.sql
   OBJECTIVE: Transform activity logs into SaaS North Star Metrics. */

WITH user_revenue AS (
    SELECT 
        car_model AS tier,
        CASE 
            WHEN car_model ILIKE '%CR-V%' THEN 499 -- Enterprise Tier
            WHEN car_model ILIKE '%HR-V%' THEN 149 -- Pro Tier
            ELSE 49 -- Basic Tier
        END AS mrr_value
    FROM citas_honda
)
SELECT 
    tier,
    SUM(mrr_value) AS total_mrr,
    COUNT(*) AS total_users,
    ROUND(AVG(mrr_value), 2) AS ARPU -- Average Revenue Per User
FROM user_revenue
GROUP BY 1
order by total_users desc
limit 20;