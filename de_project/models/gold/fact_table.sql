{% set tables = [
    {
        "table":"AIRBNB.DBT_SCHEMA_GOLD.OBT",
        "columns":"gold_fact.BOOKING_ID,gold_fact.LISTING_ID,gold_fact.HOST_ID,gold_fact.TOTAL_AMOUNT,gold_fact.ACCOMMODATES,gold_fact.BEDROOMS,gold_fact.BATHROOMS,gold_fact.PRICE_PER_NIGHT,gold_fact.RESPONSE_RATE",
        "alias":"gold_fact"
    },
    {
        "table":"AIRBNB.DBT_SCHEMA_GOLD.DIM_LISTINGS",
        "columns":"",
        "alias":"dim_listings",
        "join_condition":"gold_fact.listing_id = dim_listings.listing_id"
    },
    {
        "table":"AIRBNB.DBT_SCHEMA_GOLD.DIM_HOSTS",
        "columns":"",
        "alias":"dim_hosts",
        "join_condition":"gold_fact.host_id = dim_hosts.host_id"
    }
] %}

SELECT
    {{ tables[0]['columns'] }}

FROM {{ tables[0]['table'] }} AS {{ tables[0]['alias'] }}

{% for tbl in tables[1:] %}
LEFT JOIN {{ tbl['table'] }} AS {{ tbl['alias'] }}
    ON {{ tbl['join_condition'] }}
{% endfor %}
