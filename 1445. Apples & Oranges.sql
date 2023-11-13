# # Write your MySQL query statement below
# with cte1 as (select *, row_number() over(partition by sale_date order by fruit) as number
# from Sales)

# select c2.sale_date, (c2.sold_num - c1.sold_num) as diff
# from cte1 as c2
# inner join cte1 as c1
# on c1.sale_date = c2.sale_date and c1.number = c2.number+1
# order by c2.sale_date

with cte1 as (select *
from Sales
where fruit = 'apples'
order by sale_date),
cte2 as (select *
from Sales
where fruit = 'oranges'
order by sale_date)

select cte1.sale_date, (cte1.sold_num - cte2.sold_num) as diff
from cte1
inner join cte2
on cte1.sale_date = cte2.sale_date