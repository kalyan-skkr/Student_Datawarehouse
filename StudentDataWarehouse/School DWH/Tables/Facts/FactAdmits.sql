CREATE TABLE [dbo].[Admits]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[SchoolId] INT NOT NULL,
	[YearlyAdmit] INT NOT NULL,
	[StatsExpired] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [FK_FactAdmits_School_SchoolId] FOREIGN KEY([SchoolId]) REFERENCES DimSchool([SchoolId]),
)
