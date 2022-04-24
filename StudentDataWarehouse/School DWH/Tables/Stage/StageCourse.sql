CREATE TABLE [dbo].[StageCourse]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[CourseId] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[CourseName] VARCHAR(50) NOT NULL
)

