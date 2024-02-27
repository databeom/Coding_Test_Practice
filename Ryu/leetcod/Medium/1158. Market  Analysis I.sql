# # Write your MySQL query statement below
SELECT U.user_id AS buyer_id,
       U.join_date AS join_date,
       IFNULL(COUNT(CASE WHEN YEAR(order_date) = '2019' THEN 1 END),0) AS orders_in_2019
FROM Users AS U LEFT JOIN Orders AS O On U.user_id = O.buyer_id
GROUP BY U.user_id
