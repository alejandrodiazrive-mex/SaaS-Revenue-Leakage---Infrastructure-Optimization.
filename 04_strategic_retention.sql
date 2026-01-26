/* TARGET LIST: High-Value Customers to Rescue
Source: Based on Top 2 models identified in Script 03 (CR-V & HR-V).
Goal: Recover revenue and fill afternoon idle capacity.
*/

SELECT 
    advisor_name,
    car_model,
    customer_phone,
    MAX(appointment_date) AS last_visit
FROM citas_honda
WHERE (car_model ILIKE '%CR-V%' OR car_model ILIKE '%HR-V%')
AND customer_phone IS NOT NULL
GROUP BY 1, 2, 3
HAVING MAX(appointment_date) < CURRENT_DATE - INTERVAL '180 days'
ORDER BY last_visit DESC;