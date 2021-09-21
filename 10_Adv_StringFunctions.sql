/*
String Functions : TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

-- Using TRIM, LTRIM, RTRIM

SELECT EmployeeID, TRIM(EmployeeID) As IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) As IDLTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) As IDRTRIM
FROM EmployeeErrors

-- Using Replace

SELECT *
FROM EmployeeErrors

SELECT LastName , REPLACE(LastName, '- Fired','') As LastTimeFixed
FROM EmployeeErrors

-- Using SubString

SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT SUBSTRING(FirstName,3,3)
FROM EmployeeErrors

/*Fuzy matching*/

SELECT err.FirstName, dem.FirstName
FROM EmployeeErrors err
JOIN SQLTutorial..EmployeeDemographics dem
		ON err.FirstName = dem.FirstName

/*O/p :TOby 	Toby*/

SELECT err.FirstName, SUBSTRING(err.FirstName,1,3) ,dem.FirstName  , SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial..EmployeeDemographics dem
		ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

/*
Jimbo	Jim	Jim	Jim
Jimbo	Jim	Jim	Jim
Pamela	Pam	Pam	Pam
TOby	TOb	Toby	Tob

Applied on Below generally
Gender
LastName
Age
DOB
*/

SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors

SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors