﻿CREATE TABLE [dbo].[Student]
(
	[StudentId] INT NOT NULL PRIMARY KEY IDENTITY(10000,1), 
    [FirstName] VARCHAR(20) NOT NULL, 
    [MiddleName] VARCHAR(20) NULL,
    [LastName] VARCHAR(20) NOT NULL, 
    [Gender] VARCHAR(2) NOT NULL, 
    [DateOfBirth] DATE NOT NULL,
    [MobileNumber] VARCHAR(15) NOT NULL
)



GO

CREATE INDEX [IX_Student_Column] ON [dbo].[Student] ([StudentId])
