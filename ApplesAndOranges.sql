Select a.sale_date, a.sold_num - b.sold_num as diff
from Sales a, Sales b
where a.fruit IN ('apples') and b.fruit IN ('oranges') and a.sale_date = b.sale_date

