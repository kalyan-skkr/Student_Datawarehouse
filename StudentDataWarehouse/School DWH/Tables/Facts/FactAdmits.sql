CREATE TABLE [dbo].[FactAdmits]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[SchoolId] INT NOT NULL,
	[YearlyAdmit] INT NOT NULL,
	[ValidUntil] DATETIME DEFAULT NULL,
	CONSTRAINT [FK_FactAdmits_School_SchoolId] FOREIGN KEY([SchoolId]) REFERENCES DimSchool([SchoolId]),
)
