CREATE TABLE [dbo].[FactRegionalStats]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[RegionID] INT NOT NULL,
	[SchoolID] INT NOT NULL,
	[StudentCount] INT NOT NULL,
	[StatsExpired] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [FK_FactRegionalStats_Region_RegionID] FOREIGN KEY([RegionID]) REFERENCES DimRegion([RegionID]),
	CONSTRAINT [FK_FactRegionalStats_School_SchoolID] FOREIGN KEY([SchoolID]) REFERENCES DimSchool([SchoolID]),
)
