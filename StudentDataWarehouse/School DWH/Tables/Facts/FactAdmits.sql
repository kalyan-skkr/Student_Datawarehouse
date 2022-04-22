CREATE TABLE [dbo].[FactAdmits]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[SchoolID] INT NOT NULL,
	[YearlyAdmit] INT NOT NULL,
	[StatsExpired] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [FK_FactAdmits_School_SchoolID] FOREIGN KEY([SchoolID]) REFERENCES DimSchool([SchoolID]),
)
