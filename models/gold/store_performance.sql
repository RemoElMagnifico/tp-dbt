with revenus as (
    select
        storeid,
        sum(nb_commandes)  as nb_commandes,
        sum(montant_total) as revenu_actuel
    from {{ ref('fact_orders') }}
    group by storeid
)

select
    t.StoreID,
    r.nb_commandes,
    r.revenu_actuel,
    t.SalesTarget                       as objectif_ventes,
    r.revenu_actuel - t.SalesTarget     as ecart,
    round(r.revenu_actuel / t.SalesTarget * 100, 1) as pct_objectif
from {{ ref('salestarget') }} t
left join revenus r on r.storeid = t.StoreID