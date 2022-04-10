CREATE TABLE [dbo].[Student]
(
	[StudentID] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(20) NULL, 
    [LastName] VARCHAR(20) NULL, 
    [Age] INT NULL, 
    [DOB] DATE NULL, 
    [Address] VARCHAR(50) NULL, 
    [Email] VARCHAR(50) NULL, 
    [MobileNumber] VARCHAR(15) NULL,
    [Gender] VARCHAR(2) NULL
)
