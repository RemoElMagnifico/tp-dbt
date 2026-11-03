{{ config(materialized='view') }}


select *, quantity * unitprice as TotalPrice
from bronze.orderitems