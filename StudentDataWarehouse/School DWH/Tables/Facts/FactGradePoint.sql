CREATE TABLE [dbo].[FactGradePoint]
(
	[GPId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[StudentId] INT NOT NULL,
	[AddressId] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[OverallCGPA] DECIMAL(5,2) NOT NULL,
	[ValidUntil] DATETIME DEFAULT NULL,
	CONSTRAINT [FK_FactGradePoint_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
	CONSTRAINT [FK_FactGradePoint_School_SchoolId] FOREIGN KEY([SchoolId]) REFERENCES DimSchool([SchoolId]),
	CONSTRAINT [FK_FactGradePoint_Address_AddressId] FOREIGN KEY([AddressId]) REFERENCES DimAddress([AddressId])
)
