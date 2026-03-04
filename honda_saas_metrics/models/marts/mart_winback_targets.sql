SELECT 
    advisor_name, 
    car_model, 
    customer_phone, 
    MAX(appointment_date) AS last_visit_date
FROM {{ ref('stg_service_logs') }}
WHERE is_ghost_user = false
  AND (LOWER(car_model) LIKE '%cr-v%' OR LOWER(car_model) LIKE '%hr-v%')
GROUP BY 1, 2, 3
HAVING MAX(appointment_date) < DATE_SUB(CURRENT_DATE(), INTERVAL 180 DAY)
ORDER BY last_visit_date DESC