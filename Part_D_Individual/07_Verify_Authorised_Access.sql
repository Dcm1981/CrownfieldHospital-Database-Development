-- PART D - D1
-- Verify Patient Role and authorised access

SELECT
    CURRENT_USER() AS ConnectedUser,
    CURRENT_ROLE() AS ActiveRole;

-- Patient can view clinic information
SELECT
    ClinicID,
    ClinicName
FROM CrownfieldHospital.Clinics
LIMIT 5;
