CREATE TABLE [dbo].[StaffTeaches]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [StaffId] INT NOT NULL, 
    [CourseId] INT NOT NULL, 
    [Rating] DECIMAL NULL DEFAULT NULL
)

GO

CREATE TRIGGER [dbo].[Trigger_StaffTeaches]
    ON [dbo].[StaffTeaches]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON

        IF UPDATE(RATING)
        BEGIN
            EXEC UpdateStaffRating
        END
    END