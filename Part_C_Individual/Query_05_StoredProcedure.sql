-- =============================================
-- CROWNFIELD EYE HOSPITAL
-- PART C - QUERY 05
-- STORED PROCEDURE
-- Individual Implementation
-- =============================================

USE CrownfieldHospital;

DROP PROCEDURE IF EXISTS GetPatientAppointments_Daniel;

DELIMITER //

CREATE PROCEDURE GetPatientAppointments_Daniel(
    IN p_PatientID VARCHAR(10)
)
BEGIN
    SELECT
        a.AppointmentID,
        p.PatientName,
        c.ClinicianName,
        cl.ClinicName,
        a.AppointmentDate,
        a.AppointmentTime
    FROM Appointments AS a
    INNER JOIN Patients AS p
        ON a.PatientID = p.PatientID
    INNER JOIN Clinicians AS c
        ON a.ClinicianID = c.ClinicianID
    INNER JOIN Clinics AS cl
        ON a.ClinicID = cl.ClinicID
    WHERE a.PatientID = p_PatientID
    ORDER BY
        a.AppointmentDate,
        a.AppointmentTime;
END //

DELIMITER ;

-- Test 1: existing patient
CALL GetPatientAppointments_Daniel('OP001');

-- Test 2: patient that does not exist
CALL GetPatientAppointments_Daniel('OP999');