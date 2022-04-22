CREATE TABLE [dbo].[DimContact]
(
	[ContactID] INT NOT NULL PRIMARY KEY,
	[StudentID] INT NOT NULL,
	[MobileNumber] VARCHAR(15) NOT NULL,
	[ValidFrom] DATETIME NOT NULL,
	[ValidTo] DATETIME,
	CONSTRAINT [FK_DimContact_Student_StudentID] FOREIGN KEY([StudentID]) REFERENCES DimStudent([StudentID]),
)
