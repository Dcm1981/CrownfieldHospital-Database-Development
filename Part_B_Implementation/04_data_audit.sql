USE CrownfieldHospital;

-- PART B - Data Population Audit
-- Verify records in all 11 tables

SELECT 'Patients' AS TableName, COUNT(*) AS Total
FROM Patients

UNION ALL
SELECT 'Specialties', COUNT(*) FROM Specialties

UNION ALL
SELECT 'Clinicians', COUNT(*) FROM Clinicians

UNION ALL
SELECT 'Clinics', COUNT(*) FROM Clinics

UNION ALL
SELECT 'Appointments', COUNT(*) FROM Appointments

UNION ALL
SELECT 'Diagnoses', COUNT(*) FROM Diagnoses

UNION ALL
SELECT 'AppointmentDiagnoses', COUNT(*)
FROM AppointmentDiagnoses

UNION ALL
SELECT 'Medicines', COUNT(*) FROM Medicines

UNION ALL
SELECT 'Prescriptions', COUNT(*) FROM Prescriptions

UNION ALL
SELECT 'PrescriptionItems', COUNT(*)
FROM PrescriptionItems

UNION ALL
SELECT 'FollowUpPlans', COUNT(*) FROM FollowUpPlans;
