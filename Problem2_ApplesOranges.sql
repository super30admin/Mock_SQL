# Write your MySQL query statement below
with cte as (
select sale_date,
case when fruit = 'apples' then sold_num else 0 end as 'apples_sold',
case when fruit = 'oranges' then sold_num else 0 end as 'oranges_sold'
from sales
)

select sale_date,sum(apples_sold)-sum(oranges_sold) as diff
from cte
group by sale_date;