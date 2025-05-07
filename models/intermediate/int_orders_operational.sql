-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

with int_orders_margin_subq as(
select
    *
from {{ref("int_orders_margin")}}
left join {{ref("stg_raw__ship")}}
using (orders_id)
)

select
    orders_id,
    date_date,
    round(margin + shipping_fee - logcost - ship_cost,2) as operational_margin,
    quantity,
    revenue,
    margin,
    purchase_cost,
    shipping_fee,
    ship_cost,
    logcost
from int_orders_margin_subq
order by orders_id desc

