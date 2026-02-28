WITH revenue_exposure AS (
    SELECT
        advisor_name,
        COUNT(*) AS total_appointments,
        COUNT(*) FILTER (WHERE is_ghost_user = true) AS missing_contact_info,
        (COUNT(*) FILTER (WHERE is_ghost_user = true) * 120) AS total_exposure_usd
    FROM {{ ref('stg_service_logs') }}
    GROUP BY 1
)

SELECT
    advisor_name,
    total_appointments,
    missing_contact_info,
    total_exposure_usd AS max_potential_loss,
    -- Scenario Modeling
    (total_exposure_usd * 0.05) AS recovery_pessimistic_usd,
    (total_exposure_usd * 0.15) AS recovery_realistic_usd,
    (total_exposure_usd * 0.30) AS recovery_optimistic_usd
FROM revenue_exposure
ORDER BY max_potential_loss DESC