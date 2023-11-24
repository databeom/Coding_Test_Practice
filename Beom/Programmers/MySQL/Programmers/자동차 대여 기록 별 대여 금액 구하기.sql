WITH A AS(
    SELECT HISTORY_ID
         , CAR_ID
         , DATEDIFF(END_DATE,START_DATE)+1 AS date_diff
         , CASE 
            WHEN DATEDIFF(END_DATE,START_DATE)+1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(END_DATE,START_DATE)+1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(END_DATE,START_DATE)+1 >= 7 THEN '7일 이상'
           END AS date_diff_type
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
)

SELECT HISTORY_ID
     , CASE 
        WHEN date_diff_type IS NULL THEN ROUND(daily_fee*date_diff)
        ELSE ROUND(daily_fee * date_diff * (100-discount_rate) / 100)
       END AS FEE
FROM A
    LEFT JOIN CAR_RENTAL_COMPANY_CAR AS car ON A.CAR_ID = car.CAR_ID
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS dis ON A.date_diff_type = dis.DURATION_TYPE AND car.CAR_TYPE = dis.CAR_TYPE
WHERE car.CAR_TYPE = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC
