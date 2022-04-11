CREATE TABLE [dbo].[StudentTakes]
(
	[TakeId] INT NOT NULL PRIMARY KEY, 
    [Cid] INT NOT NULL, 
    [StudentId] INT NOT NULL, 
    [GradePoint] DECIMAL NULL
)

GO

CREATE TRIGGER [dbo].[Trigger_StudentTakes]
    ON [dbo].[StudentTakes]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON
        IF UPDATE(GRADEPOINT)
        BEGIN
            EXEC UpdateGpa
        END
    END