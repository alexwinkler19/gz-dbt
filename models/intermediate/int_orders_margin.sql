WITH int_sales_margin_subq AS (
    SELECT
        *
    FROM {{ref("int_sales_margin")}}
)
SELECT
    orders_id,
    date_date,
    ROUND(SUM(revenue),2) as revenue,
    SUM(quantity) as quantity,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    ROUND(SUM(revenue) - SUM(purchase_cost), 2) AS margin
FROM int_sales_margin_subq
GROUP BY orders_id, date_date
ORDER BY orders_id DESC