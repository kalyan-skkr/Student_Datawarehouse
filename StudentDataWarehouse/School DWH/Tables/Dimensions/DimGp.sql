CREATE TABLE [dbo].[DimGp]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [StudentId] INT NOT NULL, 
    [CourseId] INT NOT NULL, 
    [Gp] DECIMAL NOT NULL,
    CONSTRAINT [FK_DimGp_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
    CONSTRAINT [FK_DimGp_Course_CourseId] FOREIGN KEY([CourseId]) REFERENCES DimCourse([CId])
)
