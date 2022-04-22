CREATE TABLE [dbo].[DimAddress]
(
	[AddressID] INT NOT NULL PRIMARY KEY,
	[StudentID] INT NOT NULL,
	[Street] VARCHAR(20) NOT NULL,
	[RegionID] INT NOT NULL,
	[ValidFrom] DATETIME NOT NULL,
	[ValidTo] DATETIME,

	CONSTRAINT [FK_DimAddress_Student_StudentID] FOREIGN KEY([StudentID]) REFERENCES DimStudent([StudentID]),
	CONSTRAINT [FK_DimAddress_Region_RegionID] FOREIGN KEY([RegionID]) REFERENCES DimRegion([RegionID])
)
