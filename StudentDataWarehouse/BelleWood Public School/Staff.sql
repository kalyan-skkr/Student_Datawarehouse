CREATE TABLE [dbo].[Staff]
(
	[StaffId] INT NOT NULL PRIMARY KEY IDENTITY(40000,1), 
    [FirstName] VARCHAR(20) NOT NULL, 
    [LastName] VARCHAR(10) NOT NULL, 
    [Phone] VARCHAR(10) NOT NULL, 
    [Gender] VARCHAR(10) NOT NULL, 
    [Rating] DECIMAL NULL DEFAULT NULL, 
    [Department] VARCHAR(10) NOT NULL, 
    [Address] VARCHAR(10) NOT NULL,

)
