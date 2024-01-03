-- stg_pizzatypes.sql

{{ config(materialized='view') }}



-- SELECT name, category, ingredients, pizza_type_id, _airbyte_ab_id, _airbyte_emitted_at, _airbyte_normalized_at, _airbyte_src_sqlserver_pizza_types_hashid
-- 	FROM pizza.src_sqlserver_pizza_types;

-- SELECT 
-- UPPER(name) AS name, 
-- UPPER(category) AS category, 
-- UPPER(ingredients) AS ingredients, 
-- UPPER(pizza_type_id) AS pizza_type_id, 


SELECT name, category, ingredients, pizza_type_id
FROM {{ source('src_pizza', 'pizza_types') }}
{% if target.name == 'dev' %}
fetch first 10 rows only
{% endif %}