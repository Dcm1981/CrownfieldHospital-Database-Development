-- PART D - TASK D1
-- Assign permissions to Administrator Role

GRANT ALL PRIVILEGES -- GRANT = authorise someone to perform actions in the Database
ON CrownfieldHospital.*
TO 'crownfield_admin';

-- Verify assigned permissions
SHOW GRANTS FOR 'crownfield_admin';
