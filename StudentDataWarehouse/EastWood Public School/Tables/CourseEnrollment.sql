CREATE TABLE [dbo].[CourseEnrollment]
(
	[CourseEnrollmentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CourseId] INT NOT NULL, 
    [StudentId] INT NOT NULL, 
    [Grade] DECIMAL NULL, 
    [CourseCompletion] BIT NULL DEFAULT 0, 
    CONSTRAINT [FK_CourseEnrollment_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course]([CourseId]), 
    CONSTRAINT [FK_CourseEnrollment_Student_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Student]([StudentId]),
)

GO
