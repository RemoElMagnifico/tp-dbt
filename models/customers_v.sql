{{ config(materialized='view') }}


select *, concat(upper(firstname), ' ', lastname) as fullname
from bronze.customers