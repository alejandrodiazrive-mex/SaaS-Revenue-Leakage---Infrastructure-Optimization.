WITH advisor_metrics AS (
    SELECT 
        advisor_name,
        service_ticket_id,
        billable_hours,
        -- Global metrics for advanced statistics
        AVG(billable_hours) OVER(PARTITION BY advisor_name) as avg_hours_advisor,
        STDDEV(billable_hours) OVER(PARTITION BY advisor_name) as stddev_hours_advisor
    FROM {{ ref('stg_service_logs') }}
),

final_stats AS (
    SELECT 
        advisor_name,
        COUNT(DISTINCT service_ticket_id) AS total_tickets,
        SUM(billable_hours) AS total_billable_hours,

        -- Labor Efficiency / Upsell Proxy
        ROUND(SUM(billable_hours) / COUNT(DISTINCT service_ticket_id), 2) AS avg_hours_per_ticket,

        -- Anomaly detection (very long/short tickets)
        AVG(CASE WHEN ABS((billable_hours - avg_hours_advisor) / NULLIF(stddev_hours_advisor, 0)) > 3 THEN 1 ELSE 0 END) * 100 AS pct_outlier_tickets

    FROM advisor_metrics
    GROUP BY 1
)

SELECT * FROM final_stats