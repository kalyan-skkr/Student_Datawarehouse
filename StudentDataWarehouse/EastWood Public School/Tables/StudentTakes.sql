CREATE TABLE [dbo].[StudentTakes]
(
	[TakeId] INT NOT NULL PRIMARY KEY, 
    [Cid] INT NOT NULL, 
    [StudentId] INT NOT NULL, 
    [GradePoint] DECIMAL NULL
)

GO
