WITH shift_stats AS (
    SELECT 
        CASE WHEN EXTRACT(HOUR FROM appointment_time) < 12 THEN 'Morning' ELSE 'Afternoon' END AS shift,
        COUNT(*) AS total_appointments,
        -- AE logic: We use clean subqueries
        (COUNT(*)::NUMERIC / NULLIF((SELECT COUNT(*) FROM {{ ref('stg_service_logs') }}), 0) * 100) AS volume_pct
    FROM {{ ref('stg_service_logs') }}
    GROUP BY 1
)

SELECT 
    shift,
    total_appointments,
    ROUND(volume_pct, 2) AS volume_pct,
    16250 AS allocated_cost_usd,
    CASE 
        WHEN volume_pct < 10 THEN 'CRITICAL: Underutilized Capacity (Dead Rent)'
        ELSE 'OPTIMAL: High Utilization'
    END AS operational_status
FROM shift_stats