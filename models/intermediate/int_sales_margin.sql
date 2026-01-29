
-- int_sales_margin.sql
select s.date_date,s.orders_id,s.products_id,s.revenue,s.quantity,p.purchase_price,
ROUND(quantity*purchase_price,2) AS purchase_cost,
ROUND(revenue-quantity*purchase_price,2) as margin
from  {{ref("stg_raw__sales")}} s 
LEFT JOIN {{ref("stg_raw__product")}} p 
USING(products_id)