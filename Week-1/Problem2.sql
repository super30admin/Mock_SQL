/*
1. Get only the number of oranges as negative so as to compute the difference when we grouped on the date
2. Compute sum of the rows grouping on sale date to actually get the difference in this case.
*/

with cte as (
select sale_date
, if(fruit='oranges',-1*sold_num,sold_num) as sold_num 
from Sales )
select cte.sale_date, SUM(cte.sold_num) 'diff'
from cte
group by cte.sale_date
order by cte.sale_date