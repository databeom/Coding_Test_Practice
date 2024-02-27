# Write your MySQL query statement below
SELECT D.name AS Department, E.name AS Employee, E.salary AS Salary
FROM Employee AS E LEFT JOIN Department AS D ON E.departmentID = D.id
WHERE (E.departmentID, E.salary) IN (SELECT departmentID, MAX(salary)
                                     FROM Employee
                                     GROUP BY departmentID)

