select
sal.products_id, sal.date_date, sal.orders_id, sal.revenue, sal.quantity, prod.purchase_price, 
ROUND(sal.quantity*prod.purchase_price,2) AS purchase_cost,
ROUND(sal.revenue-sal.quantity*prod.purchase_price,2) AS margin
from {{ ref("stg_raw__sales") }} AS sal 
LEFT JOIN {{ ref("stg_raw__product") }} AS prod 
USING (products_id)
