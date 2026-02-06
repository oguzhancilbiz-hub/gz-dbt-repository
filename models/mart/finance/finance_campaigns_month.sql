select
extract(month from date_date) as datemonth,
sum(round(cast(coalesce(operational_margin, 0) - coalesce(ads_cost, 0) as float64), 2)) as ads_margin,
ROUND(SUM(revenue) / NULLIF(SUM(nb_transactions),0), 2) AS average_basket,
sum(operational_margin) as operational_margin,
sum(ads_cost) as ads_cost,
sum(ads_impression) as ads_impression,
sum(ads_clicks) as ads_clicks,
sum(quantity) as quantity,
sum(revenue) as revenue,
sum(purchase_cost) as purchase_cost,
sum(margin) as margin,
sum(shipping_fee) as shipping_fee,
sum(log_cost) as log_cost,
sum(ship_cost) as ship_cost
from {{ref("finance_campaigns_day")}}
GROUP by datemonth
ORDER BY datemonth DESC
