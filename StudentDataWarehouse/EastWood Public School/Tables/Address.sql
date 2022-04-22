CREATE TABLE [dbo].[Address]
(
	[AddressID] INT NOT NULL PRIMARY KEY IDENTITY(1000,1), 
    [StudentID] INT NOT NULL, 
    [Street] VARCHAR(30) NULL, 
    [City] VARCHAR(30) NULL, 
    [Province] VARCHAR(20) NULL, 
    [Country] VARCHAR(20) NULL,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
)

