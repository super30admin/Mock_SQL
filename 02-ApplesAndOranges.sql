-- cte
with apples as(
    select sale_date, fruit as apple, sold_num as a_num 
    from sales where fruit = 'apples'
),
oranges as (
    select sale_date, fruit as oranges, sold_num as o_num 
    from sales where fruit = 'oranges'
)
select apples.sale_date, (a_num - o_num) as diff
from apples
join oranges on apples.sale_date=oranges.sale_date
order by sale_date 

-- solution 2
select a.sale_date, a.sold_num - b.sold_num as diff
from sales a  
join sales b on a.sale_date = b.sale_date
where a.fruit = 'apples' and b.fruit = 'oranges'

-- better version
select sale_date, 
sum (case when fruit='apples' then sold_num else 0 end) -
sum (case when fruit='oranges' then sold_num else 0 end) as diff
from sales
group by sale_date
order by sale_date
