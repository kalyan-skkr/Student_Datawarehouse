﻿CREATE PROCEDURE [dbo].[UpdateGpa]
AS
	SET NOCOUNT ON

	DECLARE @STUDENTIDS AS TABLE (ID INT IDENTITY(1,1), STUDENTID INT NOT NULL)
	
	INSERT INTO @STUDENTIDS
	SELECT DISTINCT(STUDENTID) FROM StudentTakes

	DECLARE @CNT INT = 1;
	DECLARE @TOTALCOUNT INT = (SELECT MAX(ID) FROM @STUDENTIDS)
	DECLARE @STUDENTID INT = 0
	DECLARE @GPA DECIMAL = 0

	WHILE @CNT <= @TOTALCOUNT
	BEGIN
		SET @STUDENTID = (SELECT STUDENTID FROM @STUDENTIDS WHERE ID = @CNT)
		SET @GPA = (SELECT AVG(GradePoint) FROM StudentTakes WHERE StudentId = @STUDENTID)
		UPDATE STUDENT
			SET GradePointAverage = @GPA
			WHERE STDID = @STUDENTID
	END

RETURN 0
