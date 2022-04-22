CREATE TABLE [dbo].[DimAddress]
(
	[AddressId] INT NOT NULL PRIMARY KEY,
	[StudentId] INT NOT NULL,
	[Street] VARCHAR(20) NOT NULL,
	[RegionId] INT NOT NULL,
	[ValidFrom] DATETIME NOT NULL,
	[ValidTo] DATETIME,

	CONSTRAINT [FK_DimAddress_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
	CONSTRAINT [FK_DimAddress_Region_RegionId] FOREIGN KEY([RegionId]) REFERENCES DimRegion([RegionId])
)
