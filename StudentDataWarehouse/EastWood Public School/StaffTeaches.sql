﻿CREATE TABLE [dbo].[StaffTeaches]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [StaffId] INT NOT NULL, 
    [CourseId] INT NOT NULL, 
    [Rating] FLOAT NULL DEFAULT NULL
)