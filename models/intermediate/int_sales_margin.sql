select 
    products_id
    ,date_date
    ,orders_id
    ,revenue
    ,quantity 
    ,CAST(purchse_price AS FLOAT64) AS purchse_price
    ,ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS purchase_cost
    ,s.revenue - ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS margin

from {{ref("stg_raw__sales")}} s 
left join {{ref("stg_raw__product")}} p 
using (products_id)