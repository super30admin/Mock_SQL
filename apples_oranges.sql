--Solution 1
select s.sale_date, (s.sold_num - s1.sold_num) as 'diff' from sales s 
join sales s1 on s.sale_date = s1.sale_date 
and s.fruit = 'apples' and s1.fruit = 'oranges' 
group by s.sale_date order by s.sale_date

--Solution 2
with cte as (
    select sale_date, sold_num from sales where fruit = 'apples'),
acte as (
    select sale_date, sold_num from sales where fruit = 'oranges')
select c.sale_date, (c.sold_num - a.sold_num) as 'diff' from cte c 
join acte a on c.sale_date = a.sale_date order by c.sale_date

