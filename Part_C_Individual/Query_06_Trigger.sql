USE CrownfieldHospital2;

-- PART C - QUERY 06
-- Trigger: Prevent Clinician Double Booking

DROP TRIGGER IF EXISTS PreventDoubleBooking_Daniel;

DELIMITER //

CREATE TRIGGER PreventDoubleBooking_Daniel
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Appointments
        WHERE ClinicianID = NEW.ClinicianID
        AND AppointmentDate = NEW.AppointmentDate
        AND AppointmentTime = NEW.AppointmentTime
    )
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Clinician already has an appointment at this date and time';
    END IF;
END //

DELIMITER ;

-- Test 1: should FAIL (Dr Maya Shah already has A001 at this time)
INSERT INTO Appointments VALUES ('A900', 'OP002', 'C001', 'CL001', '2026-10-05', '09:00:00');

-- Test 2: should WORK (same day, different time)
INSERT INTO Appointments VALUES ('A901', 'OP002', 'C001', 'CL001', '2026-10-05', '15:00:00');