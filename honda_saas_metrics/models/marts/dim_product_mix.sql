SELECT 
    car_model AS tier,
    COUNT(*) AS total_visits,
    {{ get_tier_revenue('car_model') }} AS arpu_estimation_usd,
    COUNTIF(appointment_date < DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)) as inactive_users_90d,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS market_rank
FROM {{ ref('stg_service_logs') }}
GROUP BY 1