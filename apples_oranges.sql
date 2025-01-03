with cte as (select sale_date, sold_num from sales where fruit = 'apples' order by sale_date),
cte1 as (select sale_date, sold_num from sales where fruit = 'oranges' order by sale_date)
select t.sale_date, t.sold_num - (select t1.sold_num from cte1 as t1 where t.sale_date
= t1.sale_date) AS diff from cte as t;