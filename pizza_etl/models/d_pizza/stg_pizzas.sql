-- stg_pizzatypes.sql

{{ config(materialized='view') }}



-- SELECT size, price, pizza_id, pizza_type_id, _airbyte_ab_id, _airbyte_emitted_at, _airbyte_normalized_at, _airbyte_src_sqlserver_pizzas_hashid
-- 	FROM pizza.src_sqlserver_pizzas;


SELECT size, price, pizza_id, pizza_type_id
FROM {{ source('src_pizza', 'src_sqlserver_pizzas') }}

