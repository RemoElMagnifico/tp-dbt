select *, concat(upper(firstname), ' ', lastname) as fullname
from {{ source('bronze', 'customers') }}