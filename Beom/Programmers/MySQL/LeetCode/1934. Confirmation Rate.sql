# Write your MySQL query statement below
WITH step1 AS(
    SELECT a.user_id
        , CASE WHEN action='timeout' OR action IS NULL THEN 0
            WHEN action='confirmed' THEN 1  
        END AS score
    FROM Signups AS a
        LEFT JOIN Confirmations AS b on a.user_id =b.user_id
)

SELECT user_id
     , ROUND(SUM(score) / COUNT(*),2) AS confirmation_rate 
FROM step1
GROUP BY user_id
