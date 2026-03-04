{% macro get_tier_revenue(car_model_column) %}
    CASE 
        WHEN LOWER({{ car_model_column }}) LIKE '%cr-v%' THEN 499
        WHEN LOWER({{ car_model_column }}) LIKE '%hr-v%' THEN 149
        ELSE 49
    END
{% endmacro %}