WITH A AS(
    SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE start_date BETWEEN '2022-11-01' AND '2022-11-30'
    OR end_date BETWEEN '2022-11-01' AND '2022-11-30'
    OR '2022-11-01' BETWEEN start_date AND end_date
), B AS (SELECT CAR_ID
     , CAR_TYPE
     , CASE 
        WHEN CAR_TYPE='SUV' THEN ROUND(daily_fee*30 * (100-(SELECT DISCOUNT_RATE
                                                            FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
                                                            WHERE CAR_TYPE='SUV'
                                                            AND DURATION_TYPE = '30일 이상'))/100)
        WHEN CAR_TYPE='세단' THEN ROUND(daily_fee*30*(100-(SELECT DISCOUNT_RATE
                                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
                                                           WHERE CAR_TYPE='세단'
                                                           AND DURATION_TYPE = '30일 이상'))/100)
       END AS FEE
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE CAR_ID NOT IN (SELECT * FROM A)
        AND CAR_TYPE IN ('SUV','세단')
    ORDER BY FEE DESC, CAR_TYPE,CAR_ID DESC
)
SELECT DISTINCT *
FROM B
WHERE FEE >= 500000
    AND FEE < 2000000
