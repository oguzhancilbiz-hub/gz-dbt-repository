
select p.parcel_id,
pp.model_name,
p.parcel_tracking,
p.transporter,
p.priority,
p.date_purchase,
p.date_shipping,
p.date_delivery,
p.date_cancelled,
EXTRACT(MONTH FROM p.date_purchase) AS month_purchase,
case
when p.date_cancelled IS not null then 'iptal edildi'
when p.date_shipping IS null then 'devam ediyor'
when p.date_delivery IS null then 'yolda'
when p.date_delivery IS not null then 'teslim edildi'
else null
end as STATUS,
DATE_DIFF(p.date_shipping,p.date_purchase,day) as expedition_time,
DATE_DIFF(p.date_delivery,P.date_shipping,day) as transport_time,
DATE_DIFF(p.date_delivery,p.date_purchase,day) as delivery_time,
IF(p.date_delivery IS NULL,NULL,IF(DATE_DIFF(p.date_delivery,p.date_purchase,DAY)>5,1,0)) AS delay,
pp.quantity,
pp.nb_models
from {{ref("stg_cc_parcel")}} as p
LEFT JOIN {{ref("stg_cc_parcel_product")}} as pp on p.parcel_id=pp.parcel_id