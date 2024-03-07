-- 코드를 작성해주세요
WITH step1 AS(
    SELECT g.EMP_NO AS EMP_NO
         , e.EMP_NAME AS EMP_NAME
         , CASE WHEN AVG(g.SCORE) >= 96 THEN 'S' 
                WHEN AVG(g.SCORE) >= 90 THEN 'A'
                WHEN AVG(g.SCORE) >= 80 THEN 'B'
                ELSE 'C'
            END AS GRADE
         , e.SAL
    FROM HR_GRADE AS g
        LEFT JOIN HR_EMPLOYEES AS e ON g.EMP_NO = e.EMP_NO
    GROUP BY EMP_NO
    ORDER BY g.EMP_NO
)

SELECT EMP_NO
     , EMP_NAME
     , GRADE	
     , CASE WHEN GRADE = 'S' THEN SAL * 0.2
            WHEN GRADE = 'A' THEN SAL * 0.15
            WHEN GRADE = 'B' THEN SAL * 0.1
            ELSE 0
        END AS BONUS
FROM step1
