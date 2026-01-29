-- int_orders_margin.sql
select orders_id,date_date,
ROUND(SUM(revenue),2) AS revenue,
ROUND(SUM(quantity),2) AS quantity,
ROUND(SUM(purchase_cost),2) AS purchase_cost,
ROUND(SUM(margin),2) AS margin
from {{ref("int_sales_margin")}}
group by orders_id,date_date
order by orders_id desc
