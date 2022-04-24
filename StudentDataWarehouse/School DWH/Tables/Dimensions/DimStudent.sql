CREATE TABLE [dbo].[DimStudent]
(
	[StudentId] INT PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[MiddleName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[FullName] NVARCHAR(100) NOT NULL,
	[Gender] NVARCHAR(1) NOT NULL,
	[SchoolName] NVARCHAR(60) NOT NULL,
	[DateOfBirth] DATETIME NOT NULL,
	[DateOfAdmission] DATETIME NOT NULL,
	[CurrentGrade] INT NOT NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [LastUpdatedDate] DATETIME NOT NULL 
)
