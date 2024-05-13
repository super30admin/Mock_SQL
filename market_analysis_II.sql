# Write your MySQL query statement below
SELECT user_id AS 'seller_id',
(
    CASE
        WHEN u.favorite_brand = b.item_brand THEN 'yes'
        ELSE 'no'
        END
)AS'2nd_item_fav_brand'
FROM Users u
LEFT JOIN
(SELECT a.seller_id, i.item_brand
FROM Items i
JOIN
(SELECT item_id, seller_id, RANK() OVER(PARTITION BY seller_id
ORDER BY order_date) AS'rank'
FROM Orders) AS a
ON i.item_id = a.item_id
WHERE a.rank = 2) AS b
ON u.user_id = b.seller_id
