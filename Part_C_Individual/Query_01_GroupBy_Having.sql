USE CrownfieldHospital;

-- Query 1: GROUP BY + HAVING
-- Clinics with more than one appointment

SELECT
    ClinicID,
    COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY ClinicID
HAVING COUNT(*) > 1;