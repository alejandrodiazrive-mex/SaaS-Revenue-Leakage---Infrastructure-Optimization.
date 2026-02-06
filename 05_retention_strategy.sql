/* SCRIPT: 05_retention_strategy.sql
TARGET LIST: Win-Back Campaign for High-Value Accounts.
CRITERIA: 
1. High LTV Tiers (CR-V & HR-V models).
2. Contactable (Phone is not null).
3. Churn Risk (Inactive > 180 days).
*/

SELECT 
    advisor_name, 
    car_model, 
    customer_phone, 
    MAX(appointment_date) AS last_visit_date
FROM citas_honda
WHERE (car_model ILIKE '%CR-V%' OR car_model ILIKE '%HR-V%') -- High Value Segments
AND customer_phone IS NOT NULL
GROUP BY 1, 2, 3
HAVING MAX(appointment_date) < CURRENT_DATE - INTERVAL '180 days'
-- WHY 180? 
-- Conservative proxy. <90 days triggers false positives (seasonality). 
-- >180 days maximizes confidence in "At Risk" status without waiting too long.
ORDER BY last_visit_date DESC;