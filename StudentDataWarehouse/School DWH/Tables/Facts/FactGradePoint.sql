CREATE TABLE [dbo].[FactGradePoint]
(
	[GPId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[StudentId] INT NOT NULL,
	[City] NVARCHAR (20) NOT NULL,
	[SchoolName] NVARCHAR (30) NOT NULL,
	[OverallCGPA] DECIMAL(18,2) NOT NULL,
	[ValidUntil] DATETIME DEFAULT NULL,
	CONSTRAINT [FK_FactGradePoint_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
)
