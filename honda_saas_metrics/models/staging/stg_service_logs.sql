WITH source AS (
    SELECT * FROM {{ source('honda_raw', 'citas_honda') }}
),

renamed_and_cleaned AS (
    SELECT
        -- 1. Standardization of Names
        CAST(referenc AS STRING) AS customer_account_id,
        CAST(ref_or AS STRING) AS service_ticket_id,
        CAST(fec_cita AS DATE) AS appointment_date,
        CAST(hora AS TIME) AS appointment_time,
        asesor AS advisor_name,
        modelo AS car_model,
        averia AS service_description,
        CAST(tiempo_horas AS FLOAT64) AS billable_hours,
        
        -- 2. Business Logic: Ghost User Detection
        telefono AS customer_phone,
        CASE 
            WHEN telefono IS NULL OR LENGTH(CAST(telefono AS STRING)) < 10 THEN true 
            ELSE false 
        END AS is_ghost_user

    FROM source
)

-- Quality filters
SELECT * FROM renamed_and_cleaned
WHERE appointment_date BETWEEN '2020-01-01' AND CURRENT_DATE
  AND billable_hours > 0
  AND service_ticket_id IS NOT NULL