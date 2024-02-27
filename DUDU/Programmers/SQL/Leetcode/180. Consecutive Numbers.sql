WITH T AS (
    SELECT num
         , lead(num,1) over() AS num1
         , lead(num,2) over() AS num2
    FROM logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM T 
WHERE num=num1=num2
