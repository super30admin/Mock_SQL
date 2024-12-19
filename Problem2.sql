#Approach 1:
Select sale_date, 
Sum(case when fruit= ‘apples’ then sold_num else 0 end)-
Sum(case when fruit= ‘oranges’ then sold_num else 0 end) as diff
From sales
Group by sale_date
Order by sale_date;

#Approach 2:
with cte as(
select sale_date,sold_num from sales where fruit=”apples” order by sale_date;)
cte1 as(
select sale_date,sold_num from sales where fruit=”oranges” order by sale_date;)
select t.sale_date, t. sold_num –( select t1.sale_num from cte1 as t1 where t.sale_date= t1.sale_date) as diff from cte as t;