
select
    o.customerid,
    o.employeeid,
    o.storeid,
    o.status,
    o.StatusDescription,
    count(distinct o.orderid) as nb_commandes,
    sum(oi.TotalPrice)        as montant_total
from {{ ref('orders') }} o
join {{ ref('order_items') }} oi on oi.orderid = o.orderid
group by o.customerid, o.employeeid, o.storeid, o.status, o.StatusDescription