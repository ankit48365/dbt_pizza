-- stg_pizzatypes.sql
--transformed_pizza_types.sql

{{ config(materialized='table') }}


SELECT 
UPPER(name) AS name, 
UPPER(category) AS category, 
UPPER(ingredients) AS ingredients, 
UPPER(pizza_type_id) AS pizza_type_id, 
now()::date AS dbt_DateCreated, 
now()::time AS dbt_TimeCreated
FROM {{ ref('stg_pizzatypes') }}
{% if target.name == 'dev' %}
-- fetch first 10 rows only
{% endif %}