CREATE TABLE [dbo].[Student]
(
	[StudentId] INT NOT NULL PRIMARY KEY,
	[FirstName] VARCHAR(20) NOT NULL,
	[MiddleName] VARCHAR(20) NOT NULL,
	[LastName] VARCHAR(20) NOT NULL,
	[FullName] VARCHAR(100) NOT NULL,
	[Gender] VARCHAR(1) NOT NULL,
	[SchoolName] INT NOT NULL,
	[City] INT NOT NULL,
	[DateOfBirth] INT NOT NULL,
	[DateOfAdmission] INT NOT NULL,
	[DataValid] BIT NOT NULL DEFAULT 1
)
