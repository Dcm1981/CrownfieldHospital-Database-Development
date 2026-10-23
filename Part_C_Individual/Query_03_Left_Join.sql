USE CrownfieldHospital;

-- Query 3: LEFT JOIN
-- Appointments without a prescription

SELECT
    a.AppointmentID,
    a.AppointmentDate,
    pr.PrescriptionID
FROM Appointments a
LEFT JOIN Prescriptions pr ON a.AppointmentID = pr.AppointmentID
WHERE pr.PrescriptionID IS NULL;