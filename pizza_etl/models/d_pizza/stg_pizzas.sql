-- stg_pizzatypes.sql

{{ config(materialized='table') }}



-- SELECT size, price, pizza_id, pizza_type_id, _airbyte_ab_id, _airbyte_emitted_at, _airbyte_normalized_at, _airbyte_src_sqlserver_pizzas_hashid
-- 	FROM pizza.src_sqlserver_pizzas;


SELECT size, price, pizza_id, pizza_type_id as fk_pizza_type_id
FROM {{ source('src_pizza', 'pizzas') }}
{% if target.name == 'dev' %}
fetch first 10 rows only
{% endif %}


-- https://docs.getdbt.com/reference/dbt-jinja-functions/target
-- {% if target.name == 'dev' %}
-- where created_at >= dateadd('day', -3, current_date)
-- {% endif %}
