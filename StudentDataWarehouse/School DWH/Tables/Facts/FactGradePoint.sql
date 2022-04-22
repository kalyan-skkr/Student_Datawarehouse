CREATE TABLE [dbo].[FactGradePoint]
(
	[GPId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[StudentId] INT NOT NULL,
	[GPA] DECIMAL(18,2) NOT NULL,
	[GpaUpdated] BIT DEFAULT 0
	CONSTRAINT [FK_FactGradePoint_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
)
