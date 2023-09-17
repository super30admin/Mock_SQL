
-- Mock Interview questions

-- Top Travellers-Problem 109

select name,coalesce(sum(distance),0) as travelled_distance 
from Users left join Rides 
on Users.id=Rides.user_id group by user_id 
order by travelled_distance desc,name asc

-- Apple and oranges-Problem 110

Select s1.sale_date, s1.sold_num-s2.sold_num as diff from Sales s1
join Sales s2 on s1.sale_date=s2.sale_date 
where s1.fruit IN('apples') and s2.fruit IN('oranges')

-- Customers who brought all products
select customer_id from Customer group by customer_id having 
count(distinct product_key)=(Select count(product_key) as cnt from Product)


-- Product Sales Analysis 3
select product_id,Sales.year as first_year, quantity, price from Sales
where (product_id,Sales.year) in( select product_id,min(year) as first_year  
from Sales group by product_id)

--  Tournamnet winners

with cte as (SELECT match_id,first_player as player_id, first_score as score from matches  union All 
select  match_id, second_player as player_id, second_score as score from matches )

select distinct group_id ,first_value(player_id ) over( partition by group_id order by total desc , player_id) as player_id from(select c.player_id, sum(score) as total ,group_id from cte c join players p on c.player_id=p.player_id group by c.player_id) as sub
