CREATE TABLE [dbo].[Student]
(
	[StdId] INT NOT NULL PRIMARY KEY IDENTITY(1100,1), 
    [StdName] VARCHAR(50) NOT NULL, 
    [Age] INT NOT NULL, 
    [Address] VARCHAR(10) NOT NULL, 
    [ContactNumber] VARCHAR(10) NOT NULL, 
    [Email] VARCHAR(30) NOT NULL
)
