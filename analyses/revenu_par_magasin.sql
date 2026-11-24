select storeid,
       sum(montant_total) as revenu_total
from {{ref('fact_orders')}}
group by storeid
order by revenu_total desc