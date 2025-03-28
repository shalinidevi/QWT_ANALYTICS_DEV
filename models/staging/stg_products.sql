{{config(materialized = 'table')}}

select * from 
{{source('qwt_raw','raw_products')}}--QWT_ANALYTICS_DEV.RAW_DEV.RAW_CUSTOMERS