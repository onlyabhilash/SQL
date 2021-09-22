/*
Stored Procedures
*/

CREATE PROCEDURE TEST
AS
Select *
FROM EmployeeDemographics

EXEC TEST

/*Execute All 3 at a time - Create table, Insert and Select */
CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_Employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, COUNT(JobTitle),  AVG(Age),  AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
		ON emp.EmployeeID = sal.EmployeeID
Group By JobTitle

SELECT *
FROM #temp_Employee

EXEC Temp_Employee  @JobTitle = 'Salesman' /*Alter parameter in stored procedure and use here* /