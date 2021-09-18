/****** Script for SelectTopNRows command from SSMS  ******/
To get rid of red color - ctrl + shift + R
/* 
Select Statement
*,  Top, Distinct,  Count,  As,  Max,   Min,   Avg
*/

/*
Where Statement
=,   <>,   <,   >,   AND,    OR,   LIKE,    NULL,   NOT NULL,    In
*/

/*
Group By,    Order By
*/

Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Table 3 Insert:
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


INSERT INTO EmployeeDemographics VALUES
()



SELECT TOP (1000) [EmployeeID]
      ,[JobTitle]
      ,[Salary]
  FROM [SQLTutorial].[dbo].[EmployeeSalary]