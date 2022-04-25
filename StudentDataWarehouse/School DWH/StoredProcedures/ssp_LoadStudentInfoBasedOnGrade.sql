
CREATE PROCEDURE [dbo].[ssp_LoadStudentInfoBasedOnGrade]
@GPA FLOAT,
@SchoolName VARCHAR(50)
AS
BEGIN

	SELECT 
			StudentName, 
			SchoolName, 
			CurrentGrade, 
			DateOfBirth,
			Gender, 
			Address, 
			MobileNumber, 
			OverallCGPA
	FROM view_FactGradePoint FGP
	WHERE	FGP.ValidUntil IS NULL AND FGP.OverallCGPA >= @GPA AND (FGP.SchoolName = @SchoolName OR @SchoolName IS NULL OR @SchoolName = '')
END

