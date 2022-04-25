CREATE TABLE [dbo].[DimContact]
(
	[ContactId] INT PRIMARY KEY IDENTITY(1,1),
	[StudentId] INT NOT NULL,
	[MobileNumber] NVARCHAR(15) NOT NULL
	CONSTRAINT [FK_DimContact_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
)
