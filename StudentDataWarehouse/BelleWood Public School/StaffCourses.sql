CREATE TABLE [dbo].[StaffCourses]
(
	[StaffCourseId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [StaffId] INT NOT NULL, 
    [CourseId] INT NOT NULL,
    [CourseRating] DECIMAL DEFAULT NULL
)
