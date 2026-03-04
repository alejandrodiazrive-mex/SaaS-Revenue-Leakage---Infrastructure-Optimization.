{% snapshot snp_customer_tiers %}

{{
    config(
      target_schema='honda_marts',
      unique_key='customer_account_id',
      strategy='check',
      check_cols=['car_model', 'is_ghost_user']
    )
}}

SELECT
    customer_account_id,
    car_model,
    is_ghost_user,
    appointment_date AS updated_at
FROM {{ ref('stg_service_logs') }}

{% endsnapshot %}