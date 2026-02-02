select
date_date,
nb_transactions,
round(cast(coalesce(operational_margin, 0) - coalesce(ads_cost, 0) as float64), 2) as ads_margin,
ROUND(average_basket,2) as average_basket,
operational_margin,
ads_cost,
ads_impression,
ads_clicks,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost,
ship_cost
from {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING(date_date)
ORDER BY date_date DESC
