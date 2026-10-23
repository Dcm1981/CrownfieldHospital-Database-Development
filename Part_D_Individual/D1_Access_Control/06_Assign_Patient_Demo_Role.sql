-- PART D - TASK D1
-- Create demo user and assign Patient Role

CREATE USER IF NOT EXISTS 'crownfield_patient_demo'@'localhost'
IDENTIFIED BY 'Patient#2026';

-- Reset the password in case the user already existed
ALTER USER 'crownfield_patient_demo'@'localhost'
IDENTIFIED BY 'Patient#2026';

GRANT 'crownfield_patient'
TO 'crownfield_patient_demo'@'localhost';

-- Activate role automatically at login
SET DEFAULT ROLE 'crownfield_patient'
TO 'crownfield_patient_demo'@'localhost';

-- Verify permissions
SHOW GRANTS FOR 'crownfield_patient_demo'@'localhost';

-- Verify default role
SELECT
    DEFAULT_ROLE_USER,
    DEFAULT_ROLE_HOST
FROM mysql.default_roles
WHERE USER = 'crownfield_patient_demo'
  AND HOST = 'localhost';
