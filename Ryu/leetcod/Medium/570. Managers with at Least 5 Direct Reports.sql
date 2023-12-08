# Write your MySQL query statement below
SELECT name
FROM Employee
where id IN (SELECT managerId
            FROM Employee
            GROUP BY (managerId)
            HAVING COUNT(managerId) >= 5)
