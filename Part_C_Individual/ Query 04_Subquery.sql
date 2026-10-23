USE CrownfieldHospital;

-- PART C - QUERY 04
-- Identify appointments requiring priority follow-up

SELECT f.AppointmentID
FROM FollowUpPlans AS f
WHERE f.Priority IN ('High', 'Urgent');

SELECT
    a.AppointmentID,
    p.PatientName,
    c.ClinicianName,
    a.AppointmentDate
FROM Appointments AS a
INNER JOIN Patients AS p
    ON a.PatientID = p.PatientID
INNER JOIN Clinicians AS c
    ON a.ClinicianID = c.ClinicianID
WHERE a.AppointmentID IN (
    SELECT f.AppointmentID
    FROM FollowUpPlans AS f
    WHERE f.Priority IN ('High', 'Urgent')
)
ORDER BY a.AppointmentDate;