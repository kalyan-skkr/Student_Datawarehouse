CREATE TABLE [dbo].[DimAddress]
(
	[AddressId] INT NOT NULL PRIMARY KEY,
	[StudentId] INT NOT NULL,
	[Street] VARCHAR(20) NOT NULL,
	[RegionId] INT NOT NULL

	CONSTRAINT [FK_DimAddress_Region_RegionId] FOREIGN KEY([RegionId]) REFERENCES DimRegion([RegionId])
)