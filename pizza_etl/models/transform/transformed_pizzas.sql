-- stg_pizzas.sql
-- transformed_pizzas.sql

{{ config(materialized='table') }}


SELECT size, 
price, 
UPPER(pizza_id) AS pizza_id, 
UPPER(pizza_type_id) AS fk_pizza_type_id,
now()::date AS dbt_DateCreated, 
now()::time AS dbt_TimeCreated
FROM {{ ref('stg_pizzas') }}
{% if target.name == 'dev' %}
-- fetch first 10 rows only
{% endif %}