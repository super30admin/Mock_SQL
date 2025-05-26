WITH CTE_apples AS (
    SELECT sale_date, sold_num 
    FROM Sales 
    WHERE fruit = 'apples'
),
CTE_oranges AS (
    SELECT sale_date, sold_num 
    FROM Sales 
    WHERE fruit = 'oranges'
)

SELECT 
    a.sale_date,
    a.sold_num - o.sold_num AS diff
FROM 
    CTE_apples a
JOIN 
    CTE_oranges o ON a.sale_date = o.sale_date
ORDER BY a.sale_date;
