select *,
  case
    when status = 1 then 'En cours'
    when status = 2 then 'Terminée'
    when status = 3 then 'Annulée'
  end as StatusDescription
from {{ source('bronze', 'orders') }}