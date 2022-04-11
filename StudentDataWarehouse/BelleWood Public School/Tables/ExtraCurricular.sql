CREATE TABLE [dbo].[ExtraCurricular]
(
	[ExtraCurricularId] INT NOT NULL PRIMARY KEY IDENTITY(3000,1),
	[ExtraCurricularName] VARCHAR(20) NOT NULL

)

GO

CREATE INDEX [IX_ExtraCurricular_Column] ON [dbo].[ExtraCurricular] ([ExtraCurricularId])
