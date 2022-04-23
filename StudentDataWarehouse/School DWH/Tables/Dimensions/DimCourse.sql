CREATE TABLE [dbo].[DimCourse]
(
	[CId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[CourseId] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[CourseName] VARCHAR(50) NOT NULL,
	CONSTRAINT [FK_DimCourse_School_SchoolId] FOREIGN KEY([SchoolId]) REFERENCES DimSchool([SchoolId])
)
