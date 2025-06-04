WITH CTE AS(
    SELECT sale_date, sold_num FROM Sales WHERE fruit = "apples" ORDER BY sale_date
),
ACTE AS(
    SELECT sale_date, sold_num FROM Sales WHERE fruit = "oranges" ORDER BY sale_date
)

SELECT t.sale_date, t.sold_num - (SELECT t1.sold_num FROM ACTE t1 WHERE t.sale_date = t1.sale_date) AS 'diff' FROM CTE t