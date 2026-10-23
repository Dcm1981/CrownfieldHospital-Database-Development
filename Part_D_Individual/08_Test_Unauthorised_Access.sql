-- PART D - D1
-- Test unauthorised access to patient records

SELECT
    PatientID,
    PatientName
FROM CrownfieldHospital.Patients
LIMIT 5;
