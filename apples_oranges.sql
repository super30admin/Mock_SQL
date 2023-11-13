select
sale_date,
(apple_num - orange_num) as 'diff'
from
(
(select sale_date, sold_num as apple_num from Sales where fruit = 'apples') apples
inner join
(select sale_date, sold_num as orange_num from Sales where fruit = 'oranges') oranges
where 
apples.sale_date = oranges.sale_date
) T1
order by sale_date