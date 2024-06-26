
WITH A AS(
SELECT MAX(LENGTH) AS LENGTH
     , B.FISH_TYPE
FROM FISH_INFO AS A
    LEFT JOIN FISH_NAME_INFO AS B ON A.FISH_TYPE = B.FISH_TYPE
GROUP BY B.FISH_TYPE
)
SELECT I.ID
     , N.FISH_NAME
     , LENGTH
FROM FISH_INFO AS I
    LEFT JOIN FISH_NAME_INFO AS N ON I.FISH_TYPE = N.FISH_TYPE
WHERE (I.FISH_TYPE,LENGTH) IN ((SELECT FISH_TYPE
                                    , LENGTH
                               FROM A))

