
select
    c.customerid,
    c.fullname,
    sum(f.nb_commandes)  as nb_commandes,
    sum(f.montant_total) as revenu
from {{ ref('fact_orders') }} f
join {{ ref('customers_v') }} c on c.customerid = f.customerid
group by c.customerid, c.fullname