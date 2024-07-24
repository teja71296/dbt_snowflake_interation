with final as (
select customers.customer_id,
customers.first_name,
customers.last_name,
customer_orders.first_order_date,
customer_orders.most_recent_order_date,
coalesce(customer_orders.number_of_orders,0) as number_of_orders
from {{ ref('stg_customer')}} as customers
left join {{ ref('int_customer_order')}} as customer_orders on customers.customer_id = customer_orders.customer_id
)
select * from final