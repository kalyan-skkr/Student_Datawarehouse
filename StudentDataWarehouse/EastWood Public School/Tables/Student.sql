CREATE TABLE [dbo].[Student]
(
	[StudentId] INT NOT NULL PRIMARY KEY IDENTITY(20000,1), 
    [FirstName] NVARCHAR (50) NOT NULL, 
    [MiddleName] NVARCHAR (50) NULL,
    [LastName] NVARCHAR (50) NOT NULL, 
    [Gender] NVARCHAR(1) NOT NULL, 
    [DateOfBirth] DATE NOT NULL,
    [MobileNumber] NVARCHAR(15) NOT NULL
)



GO

CREATE INDEX [IX_Student_Column] ON [dbo].[Student] ([StudentId])
