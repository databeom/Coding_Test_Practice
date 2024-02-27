SELECT user_id as buyer_id
     , join_date
     , IFNULL(COUNT(order_date),0) as orders_in_2019
FROM Users u 
LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND YEAR(order_date) = '2019'
GROUP BY 1
