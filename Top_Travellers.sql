--Top Travellers sql1
select u.name, COALESCE(sum(r.distance),0) as travelled_distance from Users u
left join Rides r on u.id = r.user_id
group by u.id
order by travelled_distance desc,u.name asc

--Apples and Oranges
select sale_date, SUM(case when fruit = 'apples' then sold_num else 0 end)
- SUM(case when fruit = 'oranges' then sold_num else 0 end) as diff
from Sales
where fruit in ('apples','oranges')
group by sale_date