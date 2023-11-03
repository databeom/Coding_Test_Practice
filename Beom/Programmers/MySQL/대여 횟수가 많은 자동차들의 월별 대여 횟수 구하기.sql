WITH OVER_5_ID AS(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(*)>=5
), B AS(
    SELECT *
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE CAR_ID IN (SELECT * FROM OVER_5_ID)
)

SELECT MONTH(start_date) AS MONTH
     , CAR_ID 
     , COUNT(*) AS RECORDS
FROM B
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH, CAR_ID
HAVING COUNT(*) > 0
ORDER BY MONTH, CAR_ID DESC
