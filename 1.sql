# Write your MySQL query statement below
select a.sale_date, a.sold_num - b.sold_num as diff
from Sales a
join Sales b
on a.sale_date = b.sale_date
and a.fruit in ('apples')
and b.fruit in ('oranges')
group by 1
order by 1