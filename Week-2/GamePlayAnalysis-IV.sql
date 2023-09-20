WITH ACTE as (
    select distinct player_id, first_value(event_date) over(partition by player_id order by event_date) as first_login from Activity
),
BCTE as(
    select player_id, date_add(first_login, interval + 1 day) as next_login from ACTE
    group by player_id
)
select round(count(player_id)/(select count(distinct player_id) from activity), 2) as fraction from Activity
where (player_id,event_date) in (select player_id, next_login from BCTE);