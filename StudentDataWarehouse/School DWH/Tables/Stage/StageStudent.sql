﻿CREATE TABLE [dbo].[StageStudent]
(
	[StudentId] INT PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[MiddleName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[FullName] NVARCHAR(110) NOT NULL,
	[Gender] NVARCHAR(1) NOT NULL,
	[SchoolName] NVARCHAR(30) NOT NULL,
	[DateOfBirth] DATETIME NOT NULL,
	[DateOfAdmission] DATETIME NOT NULL,
	[City] NVARCHAR(20) NOT NULL,
	[Country] NVARCHAR(20) NOT NULL,
	[MobileNumber] NVARCHAR(15) NOT NULL,
	[CurrentGrade] INT NULL
)