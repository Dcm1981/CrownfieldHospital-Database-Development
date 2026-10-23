-- PART D - TASK D1
-- Assign permissions to Receptionist Role

-- Manage patient registrations
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.Patients
TO 'crownfield_receptionist';

-- Manage appointments
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.Appointments
TO 'crownfield_receptionist';

-- View clinic information
GRANT SELECT
ON CrownfieldHospital.Clinics
TO 'crownfield_receptionist';

-- View clinician information
GRANT SELECT
ON CrownfieldHospital.Clinicians
TO 'crownfield_receptionist';

-- Verify assigned permissions
SHOW GRANTS FOR 'crownfield_receptionist';
