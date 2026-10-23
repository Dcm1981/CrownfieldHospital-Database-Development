
USE CrownfieldHospital;

-- Query 06 - Test setup: confirm slot is free before testing

SELECT
    AppointmentID,
    ClinicianID,
    AppointmentDate,
    AppointmentTime
FROM Appointments
WHERE AppointmentID = 'A997'
   OR (
       ClinicianID = 'C001'
       AND AppointmentDate = '2026-12-20'
       AND AppointmentTime = '16:30:00'
   );
