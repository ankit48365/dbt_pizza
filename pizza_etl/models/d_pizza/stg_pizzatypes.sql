
{{ config(materialized='table') }}

SELECT name, category, ingredients, pizza_type_id
FROM {{ source('src_pizza', 'pizza_types') }}
{% if target.name == 'dev' %}
where pizza_type_id in ('bbq_ckn','big_meat','brie_carre','calabrese','cali_ckn','ckn_alfredo','ckn_pesto','classic_dlx','five_cheese')
--fetch first 10 rows only
{% endif %}
