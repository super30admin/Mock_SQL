 with cte1 as (select * from sales where fruit = 'apples') ,

   cte2 as (select * from sales where fruit= 'oranges') 

 
 select distinct cte1.sale_date  , ( cte1.sold_num -cte2.sold_num) as 'diff' from cte1 left join cte2 on cte1.sale_date =cte2.sale_date