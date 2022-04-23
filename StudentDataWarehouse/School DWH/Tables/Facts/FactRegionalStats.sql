CREATE TABLE [dbo].[FactRegionalStats]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[RegionId] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[StudentCount] INT NOT NULL,
	[ValidUntil] DATETIME NOT NULL,
	CONSTRAINT [FK_FactRegionalStats_Region_RegionId] FOREIGN KEY([RegionId]) REFERENCES DimRegion([RegionId]),
	CONSTRAINT [FK_FactRegionalStats_School_SchoolId] FOREIGN KEY([SchoolId]) REFERENCES DimSchool([SchoolId]),
)
