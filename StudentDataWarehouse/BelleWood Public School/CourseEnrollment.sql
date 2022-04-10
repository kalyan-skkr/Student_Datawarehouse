CREATE TABLE [dbo].[CourseEnrollment]
(
	[CourseEnrollmentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CourseId] INT NOT NULL, 
    [StudentId] INT NOT NULL, 
    [Grade] DECIMAL NULL, 
    [CourseCompletion] BIT NOT NULL DEFAULT 0,
)
