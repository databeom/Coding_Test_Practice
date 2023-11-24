SELECT id  
     , CASE WHEN id % 2 = 1 AND LEAD(student ,1) OVER() IS NULL THEN student
            WHEN id % 2 = 0 THEN LAG(student,1) OVER()
            ELSE LEAD(student ,1) OVER()
      END AS student
FROM Seat

# WITH change_seat AS(
#      SELECT id
#           , student
#           , LEAD(student ,1) OVER() AS LEAD_NAME
#           , LAG(student,1) OVER() AS LAG_NAME
#      FROM Seat
# )

# SELECT id
#      , CASE WHEN id % 2 = 1 AND LEAD_NAME IS NULL THEN student
#             WHEN id % 2 = 0 THEN LAG_NAME
#             ELSE LEAD_NAME
#      END AS 'student'
# FROM change_seat
