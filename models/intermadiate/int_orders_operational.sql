SELECT
o.orders_id, o.date_date, 
o.revenue, 
o.quantity, 
o.purchase_cost, 
o.margin,
s.shipping_fee,
s.log_cost,
s.ship_cost,
ROUND(o.margin+s.shipping_fee-(s.log_cost+s.ship_cost),2) AS operational_margin
FROM {{ref("int_orders_marjin")}} AS o 
LEFT JOIN {{ref("stg_raw__ship")}} AS s 
USING (orders_id)
