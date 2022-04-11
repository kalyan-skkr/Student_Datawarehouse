CREATE TABLE [dbo].[StaffCourses]
(
	[StaffCourseId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [StaffId] INT NOT NULL, 
    [CourseId] INT NOT NULL,
    [Rating] DECIMAL DEFAULT NULL, 
    CONSTRAINT [FK_StaffCourses_Staff_StaffId] FOREIGN KEY ([StaffId]) REFERENCES [Staff]([StaffId]), 
    CONSTRAINT [FK_StaffCourses_Course_CoursId] FOREIGN KEY ([CourseId]) REFERENCES [Course]([CourseId])
)

GO

CREATE TRIGGER [dbo].[Trigger_StaffCourses]
    ON [dbo].[StaffCourses]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON
        IF UPDATE(RATING)
        BEGIN
            EXEC [dbo].[UpdateStaffRating]
        END
    END