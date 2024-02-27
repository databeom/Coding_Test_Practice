WITH A AS(
    SELECT buyer_id
        , MIN(join_date) AS join_date
        , COUNT(*) AS orders_in_2019
    FROM Orders AS o
        LEFT JOIN Users AS u ON o.buyer_id = u.user_id
        LEFT JOIN Items AS i ON o.item_id = i.item_id
    WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY buyer_id
)
SELECT *
FROM A

UNION

SELECT user_id AS buyer_id
     , join_date 
     , 0 AS orders_id_2019
FROM Users
WHERE user_id NOT IN (SELECT buyer_id FROM A)
