﻿CREATE TABLE [dbo].[DimCourse]
(
	[CID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[CourseID] INT NOT NULL,
	[SchoolID] INT NOT NULL,
	[CourseName] VARCHAR(50) NOT NULL,
	CONSTRAINT [FK_DimCourse_School_SchoolID] FOREIGN KEY([SchoolID]) REFERENCES DimSchool([SchoolID])
)
