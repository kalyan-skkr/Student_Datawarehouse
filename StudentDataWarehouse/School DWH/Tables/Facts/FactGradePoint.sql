CREATE TABLE [dbo].[FactGradePoint]
(
	[GPID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[StudentID] INT NOT NULL,
	[GPA] DECIMAL(18,2) NOT NULL,
	[GpaUpdated] BIT DEFAULT 0
	CONSTRAINT [FK_FactGradePoint_Student_StudentID] FOREIGN KEY([StudentID]) REFERENCES DimStudent([StudentID]),
)
