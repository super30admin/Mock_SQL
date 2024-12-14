-- Write your PostgreSQL query statement below
with cte as (
    select
        u.name,
        sum(distance) as travelled_distance
    from Users u 
    left join Rides r on u.id = r.user_id
    group by u.id, u.name
)
select 
    name,
    coalesce((travelled_distance),0) as travelled_distance
FROM cte
order by travelled_distance desc, name