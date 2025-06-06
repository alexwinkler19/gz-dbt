SELECT
    DATE_TRUNC(date, MONTH) AS month,
    round(SUM(ads_margin),2) AS ads_margin,
    round(AVG(average_basket),2) AS average_basket,
    round(SUM(operational_margin),2) AS operational_margin,
    round(SUM(ads_cost),2) AS ads_cost,
    round(SUM(ads_impression),2) AS ads_impression,
    round(SUM(ads_click),2) AS ads_click,
    round(SUM(quantity),2) AS quantity,
    round(SUM(revenue),2) AS revenue,
    round(SUM(margin),2) AS margin,
    round(SUM(shipping_fee),2) AS shipping_fee,
    round(SUM(log_cost),2) AS log_cost,
    round(SUM(ship_cost),2) AS ship_cost
FROM {{ ref("finance_campaigns_day") }}
GROUP BY month
ORDER BY month DESC



