SELECT 
    car_model AS tier,
    COUNT(*) AS total_visits,
    
    -- Using the Macro we created
    {{ get_tier_revenue('car_model') }} AS arpu_estimation_usd,
    
    -- Inactivity Logic (Proxy de Churn)
    COUNT(*) FILTER (WHERE appointment_date < CURRENT_DATE - INTERVAL '90 days') as inactive_users_90d,
    
    RANK() OVER (ORDER BY COUNT(*) DESC) AS market_rank
FROM {{ ref('stg_service_logs') }}
GROUP BY 1