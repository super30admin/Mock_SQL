
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