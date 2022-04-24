﻿CREATE PROCEDURE [DBO].[UPDATE_DIMENSION_TABLES] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StudentCount AS INT = (SELECT max(id) FROM STAGESTUDENT)
	DECLARE @CNT AS INT = 1 
	DECLARE @CUR_STUD AS INT

	DECLARE @FNAME AS NVARCHAR(50)
	DECLARE @FNAME_NEW AS NVARCHAR(50)

	DECLARE @LNAME AS NVARCHAR(50)
	DECLARE @LNAME_NEW AS NVARCHAR(50)

	DECLARE @MNAME AS NVARCHAR(50)
	DECLARE @MNAME_NEW AS NVARCHAR(50)

	DECLARE @FullNAME AS NVARCHAR(110)
	DECLARE @FullNAME_NEW AS NVARCHAR(110)

	DECLARE @GENDER AS NVARCHAR(1)
	DECLARE @GENDER_NEW AS NVARCHAR(1)

	DECLARE @SCHOOLNAME AS NVARCHAR(60)
	DECLARE @SCHOOLNAME_NEW AS NVARCHAR(60)

	DECLARE @DOB AS DATETIME
	DECLARE @DOB_NEW AS DATETIME
	
	DECLARE @DOA AS DATETIME
	DECLARE @DOA_NEW AS DATETIME
	
	DECLARE @CURGRADE AS INT
	DECLARE @CURGRADE_NEW AS INT
	
	DECLARE @CITY AS NVARCHAR(20)
	DECLARE @CITY_NEW AS NVARCHAR(20)
	
	DECLARE @COUNTRY AS NVARCHAR(20)
	DECLARE @COUNTRY_NEW AS NVARCHAR(20)
	
	DECLARE @MOBILENUMBER AS NVARCHAR(15)
	DECLARE @MOBILENUMBER_NEW AS NVARCHAR(15)
	
	DECLARE @REGION AS NVARCHAR(15)
	DECLARE @REGION_NEW AS NVARCHAR(15)
	
	DECLARE @STREET AS NVARCHAR(20)
	DECLARE @STREET_NEW AS NVARCHAR(20)

	
	DECLARE @CourseCount INT = (SELECT MAX(ID) FROM STAGECOURSE)
	WHILE(@CNT <= @CourseCount)
	BEGIN
		DECLARE @CUR_COURSEID AS INT = (SELECT COURSEID FROM STAGECOURSE WHERE ID = @CNT)
		DECLARE @CUR_SCHOOLID AS INT = (SELECT SCHOOLID FROM STAGECOURSE WHERE ID = @CNT)
		DECLARE @CUR_COURSENAME AS NVARCHAR(50) = (SELECT COURSENAME FROM STAGECOURSE WHERE ID = @CNT)

		IF NOT EXISTS(SELECT 1 FROM DIMCOURSE WHERE COURSEID = @CUR_COURSEID AND SCHOOLID = @CUR_SCHOOLID)
		BEGIN
			INSERT INTO DIMCOURSE(COURSEID, SCHOOLID, COURSENAME) VALUES
			(@CUR_COURSEID, @CUR_SCHOOLID, @CUR_COURSENAME)
		END

		SET @CNT = @CNT + 1
	END


	SET @CNT = 1
	WHILE(@CNT <= @StudentCount)
	BEGIN
		SET @CUR_STUD = (SELECT STUDENTID FROM STAGESTUDENT WHERE ID = @CNT)
		SET @FNAME_NEW = (SELECT FIRSTNAME FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @LNAME_NEW = (SELECT LASTNAME FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @MNAME_NEW = (SELECT MIDDLENAME FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @FullNAME_NEW = (SELECT FULLNAME FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @Gender_NEW = (SELECT GENDER FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @SchoolName_NEW = (SELECT SCHOOLNAME FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @DOA_NEW = (SELECT DATEOFADMISSION FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @DOB_NEW = (SELECT DATEOFBIRTH FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @CURGRADE_NEW = (SELECT CURRENTGRADE FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		SET @MOBILENUMBER_NEW = (SELECT MOBILENUMBER FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)		
		SET @STREET_NEW = (SELECT STREET FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)
		
		SET @CITY_NEW = (SELECT CITY FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)	
		SET @COUNTRY_NEW = (SELECT COUNTRY FROM STAGESTUDENT WHERE STUDENTID = @CUR_STUD)

		IF NOT EXISTS(SELECT 1 FROM DIMREGION WHERE CITY = @CITY_NEW AND COUNTRY = @COUNTRY_NEW)
		BEGIN
			INSERT INTO DIMREGION(CITY, COUNTRY) VALUES
			(@CITY_NEW,@COUNTRY_NEW)			
		END
		SET @REGION_NEW = (SELECT REGIONID FROM DIMREGION WHERE CITY = @CITY_NEW AND COUNTRY = @COUNTRY_NEW)


		IF EXISTS (SELECT 1 FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
		BEGIN
			SET @FNAME = (SELECT FIRSTNAME FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @LNAME = (SELECT LASTNAME FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @MNAME = (SELECT MIDDLENAME FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @FullNAME = (SELECT FULLNAME FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @Gender = (SELECT GENDER FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @SchoolName = (SELECT SCHOOLNAME FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @DOA = (SELECT DATEOFADMISSION FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @DOB = (SELECT DATEOFBIRTH FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @CURGRADE = (SELECT CURRENTGRADE FROM DIMSTUDENT WHERE STUDENTID = @CUR_STUD)
			SET @MOBILENUMBER = (SELECT MOBILENUMBER FROM DIMCONTACT WHERE STUDENTID = @CUR_STUD)
			SET @REGION = (SELECT REGIONID FROM DIMADDRESS WHERE STUDENTID = @CUR_STUD)
			SET @STREET = (SELECT STREET FROM DIMADDRESS WHERE STUDENTID = @CUR_STUD)

			IF(@FNAME != @FNAME_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET FIRSTNAME = @FNAME_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@LNAME != @LNAME_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET LASTNAME = @LNAME_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@MNAME != @MNAME_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET MIDDLENAME = @MNAME_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@FULLNAME != @FULLNAME_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET FULLNAME = @FULLNAME_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@GENDER != @GENDER_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET GENDER = @GENDER_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@SCHOOLNAME != @SCHOOLNAME_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET SCHOOLNAME = @SCHOOLNAME_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@DOA != @DOA_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET DATEOFADMISSION = @DOA_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END

			IF(@DOB != @DOB_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET DATEOFBIRTH = @DOB_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END
			
			IF(@CURGRADE != @CURGRADE_NEW)
			BEGIN
				UPDATE DIMSTUDENT
				SET CURRENTGRADE = @CURGRADE_NEW,
					LASTUPDATEDDATE = GETUTCDATE()
				WHERE STUDENTID = @CUR_STUD
			END
			
			IF(@MOBILENUMBER != @MOBILENUMBER_NEW)
			BEGIN
				UPDATE DIMCONTACT
				SET MOBILENUMBER = @MOBILENUMBER_NEW
				WHERE STUDENTID = @CUR_STUD
			END
			
			IF(@REGION != @REGION_NEW)
			BEGIN
				UPDATE DIMADDRESS
				SET REGIONID = @REGION_NEW
				WHERE STUDENTID = @CUR_STUD
			END
			
			IF(@STREET != @STREET_NEW)
			BEGIN
				UPDATE DIMADDRESS
				SET STREET = @STREET_NEW
				WHERE STUDENTID = @CUR_STUD
			END



		END
		ELSE
		BEGIN
			INSERT INTO DIMSTUDENT (STUDENTID, FIRSTNAME, MIDDLENAME, LASTNAME, FULLNAME, GENDER, SCHOOLNAME, DATEOFBIRTH, DATEOFADMISSION, CURRENTGRADE, CREATEDDATE, LASTUPDATEDDATE) VALUES
			(@CUR_STUD, @FNAME_NEW, @MNAME_NEW, @LNAME_NEW, @FullNAME_NEW, @GENDER_NEW, @SCHOOLNAME_NEW, @DOB_NEW, @DOA_NEW, @CURGRADE_NEW, GETUTCDATE(), GETUTCDATE())

			INSERT INTO DIMCONTACT(STUDENTID, MOBILENUMBER) VALUES
			(@CUR_STUD, @MOBILENUMBER_NEW)

			INSERT INTO DIMADDRESS(STUDENTID, STREET, REGIONID) VALUES
			(@CUR_STUD, @STREET_NEW, @REGION_NEW)

		END


		SET @CNT = @CNT + 1

	END

	DELETE FROM DIMGP
	DBCC CHECKIDENT ('[DIMGP]', RESEED, 0)

	INSERT INTO DIMGP(StudentId, CourseId, GP)
	SELECT STUDENTID, COURSEID, GP FROM STAGEGP

END
GO
