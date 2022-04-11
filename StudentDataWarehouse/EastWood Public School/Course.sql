CREATE TABLE [dbo].[Course]
(
	[CId] INT NOT NULL PRIMARY KEY, 
    [CName] VARCHAR(20) NULL
)

GO

CREATE INDEX [IX_Course_Column] ON [dbo].[Course] ([CId])
