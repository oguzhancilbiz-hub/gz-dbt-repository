
select cp.parcel_id,
pp.model_name,
cp.transporter,
cp.priority,
cp.date_purchase,
cp.date_shipping,
cp.date_delivery,
cp.date_cancelled,
EXTRACT(MONTH FROM cp.date_purchase) AS month_purchase,
case
when cp.date_cancelled IS not null then 'iptal edildi'
when cp.date_shipping IS null then 'devam ediyor'
when cp.date_delivery IS null then 'yolda'
when cp.date_delivery IS not null then 'teslim edildi'
else null
end as STATUS,
DATE_DIFF(cp.date_shipping,cp.date_purchase,day) as expedition_time,
DATE_DIFF(cp.date_delivery,cp.date_shipping,day) as transport_time,
DATE_DIFF(cp.date_delivery,cp.date_purchase,day) as delivery_time,
IF(cp.date_delivery IS NULL,NULL,IF(DATE_DIFF(cp.date_delivery,cp.date_purchase,DAY)>5,1,0)) AS delay,
pp.quantity
from {{ref("stg_cc_parcel_product")}} as pp
LEFT JOIN {{ref("cc_parcel")}} as cp on pp.parcel_id=cp.parcel_id