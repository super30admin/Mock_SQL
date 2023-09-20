with CTE as (
 select customer_id, count(distinct product_key) as cnt
from Customer
group by customer_id
)
select CTE.customer_id from CTE where CTE.cnt = (select count(product_key) from product);