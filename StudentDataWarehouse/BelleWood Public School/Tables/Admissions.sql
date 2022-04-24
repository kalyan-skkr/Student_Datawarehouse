﻿CREATE TABLE [dbo].[Admissions]
(
	[AdmissionId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [StudentId] INT NOT NULL, 
    [AdmittedGrade] INT NOT NULL, 
    [CurrentGrade] INT NOT NULL,
    [DateOfAdmission] DATETIME NOT NULL, 
    FOREIGN KEY(STUDENTID) REFERENCES STUDENT(STUDENTID)
)
