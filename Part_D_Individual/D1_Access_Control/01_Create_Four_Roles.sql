-- PART D - TASK D1
-- Create four database roles

CREATE ROLE IF NOT EXISTS
    'crownfield_admin',
    'crownfield_doctor',
    'crownfield_receptionist',
    'crownfield_patient';

-- Verify the roles exist

SELECT
    User,
    Host
FROM mysql.user
WHERE User IN (
    'crownfield_admin',
    'crownfield_doctor',
    'crownfield_receptionist',
    'crownfield_patient'
)
ORDER BY User;
