CREATE TABLE [dbo].[ExtraCurricularEnrollment]
(
	[ExtraCurricularEnrollmentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[ExtId] INT NOT NULL,
	[StudentId] INT NOT NULL,
	[Qualification] BIT NOT NULL DEFAULT 0 
)
