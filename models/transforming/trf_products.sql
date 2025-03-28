{{ config(materialized='table',schema= env_var('DBT_TRANSFORMSCHEMA','TRANSFORMING_DEV'))   }}

select 
p.productid
,p.productname
,s.companyname as suppliercompany
,s.contactname as suppliercontact
,s.City as suppliercity
,s.country as suppliercountry
,c.categoryname
,p.quantityperunit
,p.unitcost
,p.unitprice
,p.unitsinstock
,p.unitsonorder
,IFF(p.unitsonorder > p.unitsinstock,'Not Available','Available') as Stockavailability
from {{ ref("stg_products") }} as p
inner join {{ ref("trf_suppliers") }} as s on p.supplierid=s.supplierid
inner join {{ ref("lkp_categories") }} as c on c.categoryid=p.categoryid