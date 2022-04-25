CREATE VIEW [dbo].[view_FactGradePoint]
	AS 
	SELECT 
		DS.FullName AS StudentName, 
		DS.SchoolName, 
		DS.CurrentGrade, 
		CONVERT(VARCHAR(15),DS.DateOfBirth, 103) AS DateOfBirth,
		CASE DS.Gender WHEN 'M' THEN 'Male' ELSE 'Female' END AS Gender, 
		DA.Street + ', ' + DR.City + ', ' + DR.Country AS Address, 
		DC.MobileNumber, 
		FGP.OverallCGPA,
		FGP.ValidUntil
	FROM FactGradePoint FGP (NOLOCK)
	INNER JOIN DimStudent DS (NOLOCK) ON DS.StudentId = FGP.StudentId
	INNER JOIN DimSchool DSc (NOLOCK) ON DSc.SchoolName = DS.SchoolName
	INNER JOIN DimAddress DA (NOLOCK) ON DA.AddressId = FGP.AddressId
	INNER JOIN DimRegion DR (NOLOCK) ON DR.RegionId = DA.RegionId
	INNER JOIN DimContact DC (NOLOCK) ON DC.StudentId = DS.StudentId

