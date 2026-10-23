-- PART D - TASK D1
-- Assign permissions to Doctor Role

-- Read patient information
GRANT SELECT
ON CrownfieldHospital.Patients
TO 'crownfield_doctor';

-- Read appointment information
GRANT SELECT
ON CrownfieldHospital.Appointments
TO 'crownfield_doctor';

-- View clinic and clinician information
GRANT SELECT
ON CrownfieldHospital.Clinicians
TO 'crownfield_doctor';

GRANT SELECT
ON CrownfieldHospital.Clinics
TO 'crownfield_doctor';

-- Read diagnoses
GRANT SELECT
ON CrownfieldHospital.Diagnoses
TO 'crownfield_doctor';

-- Read medicine information
GRANT SELECT
ON CrownfieldHospital.Medicines
TO 'crownfield_doctor';

-- Record diagnoses for appointments
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.AppointmentDiagnoses
TO 'crownfield_doctor';

-- Manage prescriptions
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.Prescriptions
TO 'crownfield_doctor';

-- Manage prescription items
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.PrescriptionItems
TO 'crownfield_doctor';

-- Manage follow-up plans
GRANT SELECT, INSERT, UPDATE
ON CrownfieldHospital.FollowUpPlans
TO 'crownfield_doctor';

-- Verify assigned permissions
SHOW GRANTS FOR 'crownfield_doctor';
