WITH source AS (
    SELECT * FROM {{ source('honda_raw', 'citas_honda') }}
),

cleaned AS (
    SELECT
        CAST(referenc AS STRING) AS service_ticket_id,
        UPPER(TRIM(nombre)) AS raw_name,
        CAST(telefono AS STRING) AS raw_phone,
        CAST(fec_cita AS DATE) AS appointment_date,
        modelo AS car_model,
        asesor AS advisor_name,
        CAST(tiempo_horas AS FLOAT64) AS billable_hours
    FROM source
),

identity_logic AS (

SELECT
*,

(raw_name IS NULL OR raw_name = 'NAN') AS missing_name,
(raw_phone IS NULL OR raw_phone = 'NAN') AS missing_phone

FROM cleaned
)

SELECT
*,

CASE
WHEN missing_name AND missing_phone
THEN 'GHOST_' || service_ticket_id
ELSE CONCAT(
COALESCE(raw_name,'UNKNOWN'),
'_',
COALESCE(raw_phone,'NO_PHONE')
)
END AS customer_account_id

FROM identity_logic