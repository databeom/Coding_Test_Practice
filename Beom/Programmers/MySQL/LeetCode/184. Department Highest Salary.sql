WITH salary_rk AS(
    SELECT d.name AS Department
        , e.name AS Employee
        , e.salary AS salary
        , RANK() OVER(PARTITION BY d.id ORDER BY salary DESC) AS rk
    FROM Employee AS e
        INNER JOIN Department AS d ON e.departmentId = d.id
)

SELECT Department
     , Employee
     , salary
FROM salary_rk
WHERE rk = 1
