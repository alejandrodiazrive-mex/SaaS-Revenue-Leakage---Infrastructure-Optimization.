WITH base AS (

SELECT
    customer_account_id,

    MIN(appointment_date) AS first_service_date,
    MAX(appointment_date) AS last_service_date,

    COUNT(service_ticket_id) AS total_services,

    SUM(billable_hours) AS total_lifetime_hours

FROM {{ ref('stg_service_logs') }}

GROUP BY 1

),

final AS (

SELECT
    *,
    
    CASE 
        WHEN last_service_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
        THEN TRUE
        ELSE FALSE
    END AS is_active

FROM base

)

SELECT * FROM final