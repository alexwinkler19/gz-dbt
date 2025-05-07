WITH subq AS (
    SELECT
        sales.orders_id,
        sales.date_date,
        product.products_id,
        sales.revenue,
        sales.quantity,
        ROUND(product.purchase_price * sales.quantity, 2) AS purchase_cost
    FROM {{ ref("stg_raw__sales") }} AS sales
    LEFT JOIN {{ ref("stg_raw__products") }} AS product
    ON sales.pdt_id = product.products_id
)

SELECT
    subq.orders_id,
    subq.date_date,
    ROUND(SUM(subq.revenue),2) as revenue,
    SUM(subq.quantity) as quantity,
    ROUND(SUM(subq.purchase_cost),2) as purchase_cost,
    ROUND(SUM(subq.revenue) - SUM(subq.purchase_cost), 2) AS margin
FROM subq
LEFT JOIN {{ ref("stg_raw__ship") }} AS ship
ON subq.orders_id = ship.orders_id
GROUP BY subq.orders_id, subq.date_date
ORDER BY orders_id DESC