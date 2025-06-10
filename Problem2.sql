Select a.sale_date, a.sold_num - b.sold_num as diff
from sales a, sales b
where a.fruit IN ('apples') and b.fruit in ('oranges')
and a.sale_date = b.sale_date
group by a.sale_date
order by a.sale_date