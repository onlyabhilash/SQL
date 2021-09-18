/*
Case statement
*/

--SELECT FirstName, LastName, Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is not NULL
--ORDER BY Age

--SELECT FirstName, LastName, Age,
--CASE
--		WHEN Age > 30  THEN  'Old'
--		WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--		Else 'Baby'
--END
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is not NULL
--ORDER BY Age

--SELECT FirstName, LastName, Age,
--CASE
--		WHEN Age = 38  THEN  'Stanley'
--		WHEN Age > 30  THEN  'Old'
--		Else 'Baby'
--END
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is not NULL
--ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
		WHEN JobTitle = 'Salesman' THEN Salary  +  (Salary * 0.10)
		WHEN JobTitle = 'Accountant' THEN Salary  +  (Salary * 0.05)
		WHEN JobTitle = 'HR' THEN Salary  +  (Salary * 0.000001)
		ELSE Salary  +  (Salary * 0.03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY SalaryAfterRaise