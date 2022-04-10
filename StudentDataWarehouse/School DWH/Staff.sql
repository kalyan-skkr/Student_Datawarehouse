CREATE TABLE [dbo].[Staff]
(
	[StaffID] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(20) NULL, 
    [LastName] VARCHAR(20) NULL, 
    [Gender] VARCHAR(2) NULL, 
    [Address] VARCHAR(150) NULL, 
    [MobileNumber] VARCHAR(15) NULL, 
    [Email] VARCHAR(50) NULL, 
    [DepartmentID] INT NULL
)
