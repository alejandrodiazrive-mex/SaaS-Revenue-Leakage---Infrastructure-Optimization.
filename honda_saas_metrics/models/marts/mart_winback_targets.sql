SELECT 
    advisor_name, 
    car_model, 
    customer_phone, 
    MAX(appointment_date) AS last_visit_date
FROM {{ ref('stg_service_logs') }}
WHERE is_ghost_user = false
  AND (car_model ILIKE '%CR-V%' OR car_model ILIKE '%HR-V%')
GROUP BY 1, 2, 3
HAVING MAX(appointment_date) < CURRENT_DATE - INTERVAL '180 days'
ORDER BY last_visit_date DESC