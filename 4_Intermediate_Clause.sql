/*
Having Clause
*/

--SELECT JobTitle,COUNT(JobTitle)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--		WHERE COUNT(JobTitle) > 1  /* We get error*/
--Group By JobTitle

--SELECT JobTitle,COUNT(JobTitle)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Group By JobTitle
--HAVING COUNT(JobTitle) > 1 

SELECT JobTitle,AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

