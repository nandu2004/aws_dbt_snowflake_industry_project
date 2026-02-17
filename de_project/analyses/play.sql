{% set flag=3 %}
SELECT * FROM {{ ref('bronze_bookings') }}
{% if flag > 3 %}
WHERE NIGHTS_BOOKED > {{flag}} 
{% else %}
WHERE NIGHTS_BOOKED = {{flag}}
{% endif %} 