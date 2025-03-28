{{config(materialized = 'incremental',unique_key = ['orderid','lineno'])}}

select 
od.orderid,
od.lineno,
od.productid,
od.quantity,
od.unitprice,
od.discount,
o.orderdate
from 

{{source('qwt_raw','raw_orders')}} as o
inner join {{source('qwt_raw','raw_orderdetails')}} as od 
on o.orderid = od.orderid

{% if is_incremental() %}

where o.orderdate > (select max(orderdate) from {{this}}  )

{% endif %}
