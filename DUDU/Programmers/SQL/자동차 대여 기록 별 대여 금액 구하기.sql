WITH tab AS (
    SELECT car.daily_fee
         , car.car_type
         , his.history_id
         , DATEDIFF(END_DATE, START_DATE) + 1 AS period
         , CASE     WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 90 THEN '90일 이상'
                    WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 30 THEN '30일 이상'
                    WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 7 THEN '7일 이상'
                    ELSE 'NONE' 
           END AS duration_type
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS his
INNER JOIN CAR_RENTAL_COMPANY_CAR AS car ON car.car_id = his.car_id
WHERE car.car_type = '트럭')   

SELECT tab.history_id
     , ROUND(tab.daily_fee * tab.period * (100 - IFNULL(plan.discount_rate,0)) / 100) AS FEE
FROM tab
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS plan ON plan.duration_type = tab.duration_type 
                                                   AND plan.car_type = tab.car_type
ORDER BY FEE DESC, tab.history_id DESC
