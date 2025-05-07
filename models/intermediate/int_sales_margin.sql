-- margin = revenue - purchase_cost
-- purchase_cost = quantity * purchase_price

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
