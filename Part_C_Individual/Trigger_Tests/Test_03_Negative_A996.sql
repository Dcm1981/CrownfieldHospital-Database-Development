
USE CrownfieldHospital;

-- PART C - Negative Test — A996
-- Test: Prevent clinician double booking

INSERT INTO Appointments (
    AppointmentID,
    PatientID,
    ClinicianID,
    ClinicID,
    AppointmentDate,
    AppointmentTime
)
VALUES (
    'A996',
    'OP002',
    'C001',
    'CL001',
    '2026-10-05',
    '09:00:00'
);
