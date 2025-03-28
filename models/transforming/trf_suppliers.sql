{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
get(xmlget(Supplierinfo,'SupplierID'),'$') as SupplierID
,get(xmlget(Supplierinfo,'CompanyName'),'$')::varchar as CompanyName
,get(xmlget(Supplierinfo,'ContactName'),'$')::varchar as ContactName
,get(xmlget(Supplierinfo,'Address'),'$')::varchar as Address
,get(xmlget(Supplierinfo,'City'),'$')::varchar as  City
,get(xmlget(Supplierinfo,'PostalCode'),'$')::varchar as PostalCode
,get(xmlget(Supplierinfo,'Country'),'$')::varchar as Country
,get(xmlget(Supplierinfo,'Phone'),'$')::varchar as Phone
,get(xmlget(Supplierinfo,'Fax'),'$')::varchar as Fax
from {{ref('stg_suppliers')}}