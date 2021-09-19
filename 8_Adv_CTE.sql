/*
CTE - Common Table Expression - Used to manipulate complex sub queries data
*/

WITH CTE_Employee as
(SELECT FirstName, LastName, Gender,  Salary
,COUNT(Gender) Over (PARTITION BY Gender) as TotalGender
,AVG(Salary) Over(PARTITION BY Gender) as AvgSalary
FROM SQLTutorial..EmployeeDemographics as emp
JOIN SQLTutorial..EmployeeSalary as sal
		ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > 45000
)

--SELECT *
--FROM CTE_Employee

--SELECT FirstName, AvgSalary
--FROM CTE_Employee

/*Error : Invalid object name 'CTE_Employee'.*/
SELECT *
FROM CTE_Employee /* Will give error,Bcoz we can use CTE for only once thats below CTE select statements*/