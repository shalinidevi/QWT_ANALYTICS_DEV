{{config(materialized = 'table')}}

select 
OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
SPLIT_PART(ShipmentDate,' ',1)::DATE AS ShipmentDate,
Status from 
{{source('qwt_raw','raw_shipments')}}