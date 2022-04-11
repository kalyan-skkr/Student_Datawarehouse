CREATE TABLE [dbo].[ExtraCurricularEnrollment]
(
	[ExtraCurricularEnrollmentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[ExtId] INT NOT NULL,
	[StudentId] INT NOT NULL,
	[Qualified] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_ExtraCurricularEnrollment_ExtraCurricular_ExtId] FOREIGN KEY ([ExtId]) REFERENCES [ExtraCurricular]([ExtraCurricularId]), 
    CONSTRAINT [FK_ExtraCurricularEnrollment_Student_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Student]([StudentId]), 
)
