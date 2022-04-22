CREATE TABLE [dbo].[Admissions]
(
	[AdmissionID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [StudentID] INT NOT NULL, 
    [AdmittedGrade] INT NOT NULL, 
    [CurrentGrade] INT NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
)
