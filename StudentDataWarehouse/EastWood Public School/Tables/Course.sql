CREATE TABLE [dbo].[Course]
(
	[CourseID] INT NOT NULL PRIMARY KEY IDENTITY(2000,1), 
    [CourseName] VARCHAR(50) NULL
)

GO

CREATE INDEX [IX_Course_Column] ON [dbo].[Course] ([CourseID])
