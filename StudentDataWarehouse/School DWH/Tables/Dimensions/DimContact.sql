﻿CREATE TABLE [dbo].[DimContact]
(
	[ContactId] INT NOT NULL PRIMARY KEY,
	[StudentId] INT NOT NULL,
	[MobileNumber] VARCHAR(15) NOT NULL,
	[ValidFrom] DATETIME NOT NULL,
	[ValidTo] DATETIME,
	CONSTRAINT [FK_DimContact_Student_StudentId] FOREIGN KEY([StudentId]) REFERENCES DimStudent([StudentId]),
)