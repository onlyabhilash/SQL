/*
Aliasing
*/

--SELECT FirstName AS Fname
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT FirstName Fname
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT FirstName + ' ' + LastName AS FullName
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT Avg(Age) AS AvgAge
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT Demo.EmployeeID
--FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
JOIN [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
		ON Demo.EmployeeID = Sal.EmployeeID