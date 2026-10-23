
USE CrownfieldHospital;

-- PART C - QUERY 06
-- Positive Trigger Test

START TRANSACTION;

-- Insert a valid appointment
INSERT INTO Appointments (
    AppointmentID,
    PatientID,
    ClinicianID,
    ClinicID,
    AppointmentDate,
    AppointmentTime
)
VALUES (
    'A997',
    'OP002',
    'C001',
    'CL001',
    '2026-12-20',
    '16:30:00'
);

-- Confirm the appointment was inserted
SELECT *
FROM Appointments
WHERE AppointmentID = 'A997';

-- Undo the test insertion
ROLLBACK;

-- Confirm the appointment was removed
SELECT *
FROM Appointments
WHERE AppointmentID = 'A997';
