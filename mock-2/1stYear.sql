-- 1st method using sub-queries
select product_id,year as first_year, quantity, price from sales
where (product_id,year) in (
  select product_id,Min(year) as year from sales
  group by product_id
)

--2nd method Window Functions Using CTE
with cte as (
select product_id,year, quantity, price ,RANK() over (partition by product_id order by year) as row_id from sales
)
select product_id,year as first_year, quantity, price from cte 
where row_id=1