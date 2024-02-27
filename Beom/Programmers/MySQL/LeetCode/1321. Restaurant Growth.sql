
WITH step1 AS(
     SELECT visited_on
          , SUM(amount) AS amount
     FROM Customer
     GROUP BY visited_on
     ORDER BY visited_on
), step2 AS(
     SELECT visited_on   
          , ROUND(SUM(amount) OVER(ORDER BY visited_on range BETWEEN INTERVAL 6 DAY preceding AND current row),2) AS amount
     FROM step1
)
SELECT *
     , ROUND(amount / 7,2) AS average_amount
FROM step2
WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on),INTERVAL 6 DAY)
                     FROM Customer)


