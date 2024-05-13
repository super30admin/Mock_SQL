WITH CTE_Apples AS
 (
 SELECT sale_date , sold_num FROM Sales WHERE fruit = 'apples'
 ORDER BY sale_date),
 CTE_Oranges AS
 (
 SELECT sale_date, sold_num FROM Sales WHERE fruit = 'oranges'
 ORDER BY sale_date)
 
 SELECT CTE_Apples.sale_date , CTE_Apples.sold_num -(
 SELECT CTE_Oranges.sold_num FROM CTE_Oranges
 WHERE CTE_Apples.sale_date = CTE_Oranges.sale_date) AS 'diff' 
 FROM CTE_Apples;
