﻿CREATE PROCEDURE UPDATE_FACT_TABLES
AS
BEGIN
	SET NOCOUNT ON;
	
	--FactGradePoint Start--
	DECLARE @STUDENTS AS TABLE(ID INT IDENTITY(1,1), STDID INT)

	INSERT INTO @STUDENTS
	SELECT DISTINCT(STUDENTID) FROM DIMGP

	DECLARE @COUNT AS INT = (SELECT MAX(ID) FROM @STUDENTS)
	DECLARE @CNT AS INT = 1
	DECLARE @STDID AS INT

	DECLARE @EXISTING_GPA AS DECIMAL(5,2)
	DECLARE @NEW_GPA AS DECIMAL(5,2)

	WHILE(@CNT <= @COUNT)
	BEGIN

	SET @STDID = (SELECT STDID FROM @STUDENTS WHERE ID = @CNT)

	SET @EXISTING_GPA = (SELECT OVERALLCGPA FROM FACTGRADEPOINT WHERE STUDENTID = @STDID AND VALIDUNTIL IS NULL)

	SET @NEW_GPA = (SELECT AVG(GP) FROM DIMGP WHERE STUDENTID = @STDID)

	IF(@EXISTING_GPA IS NULL OR @EXISTING_GPA != @NEW_GPA)
	BEGIN
		UPDATE FACTGRADEPOINT
		SET VALIDUNTIL = GETUTCDATE()
		WHERE STUDENTID = @STDID

		DECLARE @ADDRESSID AS NVARCHAR(20) = (SELECT A.ADDRESSID FROM DIMREGION R INNER JOIN DIMADDRESS A ON A.REGIONID = R.REGIONID AND A.STUDENTID = @STDID)

		DECLARE @SCHOOLID AS NVARCHAR(30) = (SELECT SCHOOLID FROM DIMSCHOOL S INNER JOIN DIMSTUDENT STD ON STD.SCHOOLNAME = S.SCHOOLNAME
												WHERE STUDENTID = @STDID)

		INSERT INTO FACTGRADEPOINT(STUDENTID, SCHOOLID, ADDRESSID, OVERALLCGPA, VALIDUNTIL) VALUES
		(@STDID, @SCHOOLID, @ADDRESSID, @NEW_GPA, NULL)
	END
	
	
	SET @CNT = @CNT + 1
	END
	--FactGradePoint End--


	--FactRegionalStats Start--
	DECLARE @REGIONS AS TABLE (ID INT IDENTITY(1,1), REGIONID INT)
	INSERT INTO @REGIONS
	SELECT DISTINCT(REGIONID) FROM DIMREGION

	SET @COUNT = (SELECT MAX(ID) FROM @REGIONS)
	SET @CNT = 1

	DECLARE @CUR_REG AS INT
	DECLARE @SCHOOL1_CNT AS INT
	DECLARE @SCHOOL2_CNT AS INT
	DECLARE @EXISTING_STATS AS INT

	WHILE(@CNT <= @COUNT)
	BEGIN

	SET @CUR_REG = (SELECT REGIONID FROM @REGIONS WHERE ID = @CNT)

	SET @SCHOOL1_CNT = (SELECT COUNT(1) FROM DIMADDRESS A
						INNER JOIN DIMSTUDENT S ON S.STUDENTID = A.STUDENTID
						AND A.REGIONID = @CUR_REG AND S.SCHOOLNAME = 'BelleWood Public School')
	SET @SCHOOL2_CNT = (SELECT COUNT(1) FROM DIMADDRESS A
						INNER JOIN DIMSTUDENT S ON S.STUDENTID = A.STUDENTID
						AND A.REGIONID = @CUR_REG AND S.SCHOOLNAME = 'EastWood Public School')

	SET @EXISTING_STATS = (SELECT STUDENTCOUNT FROM FACTREGIONALSTATS WHERE REGIONID = @CUR_REG AND SCHOOLID = 1 AND ValidUntil IS NULL)
	IF(@EXISTING_STATS IS NULL OR @EXISTING_STATS != @SCHOOL1_CNT)
	BEGIN
		UPDATE FACTREGIONALSTATS
		SET VALIDUNTIL = GETUTCDATE()
		WHERE REGIONID = @CUR_REG AND SCHOOLID = 1

		INSERT INTO FACTREGIONALSTATS(REGIONID, SCHOOLID, STUDENTCOUNT, VALIDUNTIL) VALUES
		(@CUR_REG, 1, @SCHOOL1_CNT, NULL)		
	END

	SET @EXISTING_STATS = (SELECT STUDENTCOUNT FROM FACTREGIONALSTATS WHERE REGIONID = @CUR_REG AND SCHOOLID = 2 AND ValidUntil IS NULL)
	IF(@EXISTING_STATS IS NULL OR @EXISTING_STATS != @SCHOOL2_CNT)
	BEGIN
		UPDATE FACTREGIONALSTATS
		SET VALIDUNTIL = GETUTCDATE()
		WHERE REGIONID = @CUR_REG AND SCHOOLID = 2

		INSERT INTO FACTREGIONALSTATS(REGIONID, SCHOOLID, STUDENTCOUNT, VALIDUNTIL) VALUES
		(@CUR_REG, 2, @SCHOOL2_CNT, NULL)		
	END


	SET @CNT = @CNT + 1
	END

	--FactRegionalStats End--
END