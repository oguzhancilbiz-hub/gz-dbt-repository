-- int_orders_operational.sql
select m.date_date,
m.orders_id,
ROUND(M.margin+s.shipping_fee-(s.log_cost+s.ship_cost),2) as operational_margin,
m.quantity,
m.revenue,
m.purchase_cost,
m.margin,
s.shipping_fee,
s.log_cost,
s.ship_cost
from {{ref("int_orders_margin")}} m 
LEFT JOIN {{ref("stg_raw__ship")}} s 
USING(orders_id)
order by orders_id desc