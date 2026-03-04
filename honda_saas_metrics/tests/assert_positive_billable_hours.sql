-- If this query returns 1 or more rows, the test fails and the pipeline stops.
SELECT
    service_ticket_id,
    billable_hours
FROM {{ ref('stg_service_logs') }}
WHERE billable_hours <= 0