-- margin = revenue - purchase_cost
-- purchase_cost = quantity * purchase_price

WITH subquery AS ( 
    SELECT
        sales.orders_id,
        sales.date_date,
        sales.revenue,
        sales.quantity,
        ROUND(product.purchase_price * sales.quantity, 2) AS purchase_cost,
        ROUND((revenue - (product.purchase_price * sales.quantity)), 2) AS margin
    FROM {{ ref("stg_raw__sales") }} AS sales
    LEFT JOIN {{ ref("stg_raw__products") }} AS product
    ON sales.products_id = product.products_id
)

SELECT
    *,
    {{ margin_percent('margin', 'revenue') }} AS margin_percent
FROM subquery
