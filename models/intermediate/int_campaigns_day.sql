-- int_campaigns_day.sql
SELECT
date_date,
paid_source,
SUM(ads_cost) as ads_cost,
SUM(impression) as ads_impression,
SUM(click) as ads_clicks,
FROM {{ ref("int_campaigns") }}
GROUP BY date_date,paid_source
ORDER BY date_date DESC