-- PART D - TASK D1
-- Assign permissions to Patient Role

-- Allow patients to view clinic information
GRANT SELECT
ON CrownfieldHospital.Clinics
TO 'crownfield_patient';

-- Allow patients to view medical specialties
GRANT SELECT
ON CrownfieldHospital.Specialties
TO 'crownfield_patient';

-- Verify assigned permissions
SHOW GRANTS FOR 'crownfield_patient';
