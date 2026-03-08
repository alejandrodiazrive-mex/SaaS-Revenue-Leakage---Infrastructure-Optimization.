WITH customer_metrics AS (

SELECT
    customer_account_id,
   total_lifetime_hours,
    first_service_date,
    last_service_date

FROM {{ ref('dim_customers') }}

),

lifetime_calc AS (

SELECT
    customer_account_id,

    total_spent_lifetime,

    DATE_DIFF(last_service_date, first_service_date, DAY) AS lifetime_days

FROM customer_metrics

)

SELECT
    customer_account_id,
    total_spent_lifetime,

    lifetime_days,

    SAFE_DIVIDE(total_spent_lifetime, lifetime_days) * 30 AS estimated_monthly_ltv

FROM lifetime_calc