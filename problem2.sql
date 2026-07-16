"""
Apples and Oranges
1. We need to report the difference between the number of apples and oranges sold each day
2. We use an if check on the fruit column to check if oranges, in that case we negate the quantity
3. Finally we sum on fruits sold on a given sale date by grouping on it and order by the same. 
"""

with cte as (
select sale_date
, if(fruit='oranges',-1*sold_num,sold_num) as sold_num 
from Sales )
select cte.sale_date, SUM(cte.sold_num) 'diff'
from cte
group by cte.sale_date
order by cte.sale_date