CREATE TABLE [dbo].[RegionalStats]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[RegionId] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[StudentCount] INT NOT NULL,
	[StatsExpired] BIT NOT NULL DEFAULT 0
)
