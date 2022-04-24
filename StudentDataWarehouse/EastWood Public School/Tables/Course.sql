CREATE TABLE [dbo].[Course]
(
	[CourseId] INT NOT NULL PRIMARY KEY IDENTITY(3000,1), 
    [CourseName] NVARCHAR(50) NULL
)

GO

CREATE INDEX [IX_Course_Column] ON [dbo].[Course] ([CourseId])
