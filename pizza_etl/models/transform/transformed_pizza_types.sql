-- stg_pizzatypes.sql
--transformed_pizza_types.sql

{{ config(materialized='view') }}


SELECT 
UPPER(name) AS name, 
UPPER(category) AS category, 
UPPER(ingredients) AS ingredients, 
UPPER(fk_pizza_type_idpizza_type_id) AS fk_pizza_type_id, 
now()::date AS dbt_DateCreated, 
now()::time AS dbt_TimeCreated
FROM {{ ref('stg_pizzatypes') }}
{% if target.name == 'dev' %}
fetch first 10 rows only
{% endif %}