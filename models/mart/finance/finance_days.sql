WITH ORDERS_PER_DAY AS (select date_date,
count(DISTINCT orders_id) AS nb_transactions,
ROUND(sum(revenue),0) as revenue,
ROUND(SUM(margin),0) as margin,
ROUND(SUM(operational_margin),0) as operational_margin,
ROUND(SUM(purchase_cost),0) as purchase_cost,
ROUND(SUM(shipping_fee),0) AS shipping_fee,
ROUND(SUM(ship_cost),0) as ship_cost,
ROUND(SUM(log_cost),0) as log_cost,
SUM(quantity) as quantity
from  {{ref("int_orders_operational")}}  
GROUP BY date_date
)
SELECT
date_date
, nb_transactions
, revenue
, margin
, operational_margin
, purchase_cost
, shipping_fee
, log_cost
, ship_cost
, quantity
, ROUND(revenue/NULLIF(nb_transactions, 0), 2) AS average_basket
FROM orders_per_day
ORDER BY date_date DESC