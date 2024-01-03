-- stg_pizzatypes.sql
-- Dimesion_Pizza.sql

{{ config(materialized='view') }}

with CTE_pizza_types as ( SELECT name, category, ingredients, pizza_type_id
    FROM {{ ref('transformed_pizza_types') }}
    ),

CTE_pizza as ( SELECT size, price, pizza_id, fk_pizza_type_id
    FROM     {{ ref('transformed_pizzas') }}
    )    

SELECT b.name, b.category, a.fk_pizza_type_id,a.pizza_id, a.size, a.price ,  CASE 
        WHEN a.price > 20 THEN 'expensive'
        ELSE 'cheap'
    END as price_category, b.ingredients
	FROM CTE_pizza a left join CTE_pizza_types b on a.fk_pizza_type_id = b.pizza_type_id
