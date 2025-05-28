-- Question: https://leetcode.com/problems/top-travellers/description/

-- # Write your MySQL query statement below
-- with cte as(
-- select u.name as name ,sum(distance) as travelled_distance_one
-- from users u
-- left join rides r on u.id=r.user_id
-- group by user_id
-- order by sum(distance) desc,name asc)

-- select name, ifnull(travelled_distance_one,0) as travelled_distance
-- from cte;

select name, ifnull(sum(distance),0) as travelled_distance
from users u
left join rides r on u.id=r.user_id
group by user_id
order by  travelled_distance desc,name asc;

with cte as (
select sale_date, fruit,sold_num,lead(sold_num) over(partition by sale_date order by fruit) as lea
from sales)

select sale_date,sold_num -lea as diff
from cte
where fruit='apples'
order by sale_date;