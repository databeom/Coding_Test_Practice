# Write your MySQL query statement below
WITH C_N AS 
(SELECT user_id, COUNT(CASE WHEN action = 'confirmed' THEN 1 END) / COUNT(user_id) AS confirmation_rate
FROM Confirmations 
GROUP BY user_id)

SELECT S.user_id, IFNULL(ROUND(confirmation_rate, 2), 0) AS confirmation_rate
FROM Signups AS S LEFT JOIN C_N AS C ON S.user_id = C.user_id
