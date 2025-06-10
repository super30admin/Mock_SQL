# Mock_SQL
1 Problem 1 : Top Travellers (https://leetcode.com/problems/top-travellers/)

Solution:
Select U.name, ifnull(sum(R.distance),0)  as travelled_distance 
from Users U
left join Rides R
on U.id = R.user_id  
group by U.id
order by travelled_distance desc, name     

1 Problem 1 : Apples & Oranges (https://leetcode.com/problems/apples-oranges/)

Solution:
Select a.sale_date, sum(a.sold_num - b.sold_num) as diff
from Sales a
join Sales b
on a.sale_date = b.sale_date
where a.fruit in ('apples') and b.fruit in ('oranges') 
group by a.sale_date
order by a.sale_date