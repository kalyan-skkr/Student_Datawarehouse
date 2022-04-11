CREATE TABLE [dbo].[Staff]
(
	[StaffId] INT NOT NULL PRIMARY KEY, 
    [StaffName] VARCHAR(40) NOT NULL, 
    [Mobile] VARCHAR(10) NOT NULL, 
    [Email] VARCHAR(30) NOT NULL, 
    [Rating] DECIMAL NULL
)

GO

CREATE INDEX [IX_Staff_Column] ON [dbo].[Staff] ([StaffId])
