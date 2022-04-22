CREATE TABLE [dbo].[CourseEnrollment]
(
	[CourseEnrollmentID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CourseID] INT NOT NULL, 
    [StudentID] INT NOT NULL, 
    [Grade] DECIMAL NULL, 
    [CourseCompletion] BIT NULL DEFAULT 0, 
    CONSTRAINT [FK_CourseEnrollment_Course_CourseID] FOREIGN KEY ([CourseID]) REFERENCES [Course]([CourseID]), 
    CONSTRAINT [FK_CourseEnrollment_Student_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Student]([StudentID]),
)

GO
