SELECT HISTORY_ID
     -- , START_DATE
     -- , END_DATE
     -- , DATEDIFF(END_DATE,START_DATE)+1 AS diff
     -- , DAILY_FEE
     , CASE
    WHEN DATEDIFF(END_DATE,START_DATE)+1 < 7 THEN ROUND(DAILY_FEE * (DATEDIFF(END_DATE,START_DATE)+1))
        WHEN  DATEDIFF(END_DATE,START_DATE)+1 < 30 THEN ROUND(DAILY_FEE * (DATEDIFF(END_DATE,START_DATE)+1) * 0.95)
        WHEN  DATEDIFF(END_DATE,START_DATE)+1 < 90 THEN ROUND(DAILY_FEE * (DATEDIFF(END_DATE,START_DATE)+1) * 0.93)
        ELSE ROUND(DAILY_FEE * (DATEDIFF(END_DATE,START_DATE)+1) * 0.9)
       END AS FEE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
    INNER JOIN CAR_RENTAL_COMPANY_CAR AS c ON h.CAR_ID = c.CAR_ID
WHERE CAR_TYPE = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC
