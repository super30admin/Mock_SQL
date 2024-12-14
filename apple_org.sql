-- Write your PostgreSQL query statement below
with cte as (
    select 
        sale_date,
        sum(case when fruit = 'apples' then sold_num else 0 end) as a,
        sum(case when fruit = 'oranges' then sold_num else 0 end) as o
    from Sales
    group by sale_date
)
select 
    sale_date,
    (min(a) - min(o)) as diff
from 
    cte
group by sale_date
order by sale_date
