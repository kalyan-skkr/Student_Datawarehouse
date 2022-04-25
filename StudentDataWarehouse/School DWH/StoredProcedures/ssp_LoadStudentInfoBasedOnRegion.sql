CREATE PROCEDURE [dbo].[ssp_LoadStudentInfoBasedOnRegion]
	@Region VARCHAR(50),
	@SchoolName VARCHAR(50)
AS
BEGIN
	
	SELECT 
		DR.City AS Region, 
		DS.SchoolName, 
		FRS.StudentCount, 
		COALESCE(CONVERT(VARCHAR(15), FRS.ValidUntil,103), 'Present') AS ValidUntil 
	FROM FactRegionalStats FRS (NOLOCK)
	INNER JOIN DimRegion DR (NOLOCK) ON FRS.RegionId = DR.RegionId
	INNER JOIN DimSchool DS (NOLOCK) ON DS.SchoolId = FRS.SchoolId 
	WHERE DR.City = @Region AND (DS.SchoolName = @SchoolName OR @SchoolName IS NULL OR @SchoolName = '')
	
END
