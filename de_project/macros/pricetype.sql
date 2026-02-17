{% macro property_price_category(price_col, property_col) %}

CASE
    WHEN {{ price_col }} < AVG({{ price_col }}) OVER (PARTITION BY {{ property_col }})
        THEN 'BELOW_AVERAGE'

    WHEN {{ price_col }} = AVG({{ price_col }}) OVER (PARTITION BY {{ property_col }})
        THEN 'AVERAGE'

    ELSE 'ABOVE_AVERAGE'
END

{% endmacro %}
