
WITH n AS (
     SELECT num 
          , LEAD(num,1) OVER() AS num_1
          , LEAD(num,2) OVER() AS num_2
     FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM n
WHERE num = num_1
     AND num = num_2
