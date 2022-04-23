﻿CREATE TABLE [dbo].[DimStudent]
(
	[StudentId] INT PRIMARY KEY,
	[FirstName] VARCHAR(20) NOT NULL,
	[MiddleName] VARCHAR(20) NOT NULL,
	[LastName] VARCHAR(20) NOT NULL,
	[FullName] VARCHAR(100) NOT NULL,
	[Gender] VARCHAR(1) NOT NULL,
	[SchoolName] VARCHAR(30) NOT NULL,
	[DateOfBirth] DATETIME NOT NULL,
	[DateOfAdmission] DATETIME NOT NULL,
	[DataValid] BIT NOT NULL DEFAULT 1
)
