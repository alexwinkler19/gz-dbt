-- ads_margin = operational_margin - ads_cost

select
    date_date as date,
    round(operational_margin - ads_cost,2) as ads_margin,
    average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_click,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
from {{ref("int_campaigns_day")}}
left join {{ref("finance_days")}}
using(date_date)
order by date_date desc