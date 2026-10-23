USE CrownfieldHospital;

-- =============================================
-- PART B - CONTROLLED UPDATE AND DELETE TESTS
-- =============================================

-- ---------------------------------------------
-- TEST 1 - Controlled UPDATE
-- ---------------------------------------------

-- Before
SELECT * FROM FollowUpPlans WHERE FollowUpID = 'F001';

-- Update one record using the primary key
UPDATE FollowUpPlans
SET FollowUpStatus = 'Scheduled'
WHERE FollowUpID = 'F001';

-- After
SELECT * FROM FollowUpPlans WHERE FollowUpID = 'F001';

-- ---------------------------------------------
-- TEST 2 - Controlled DELETE (transaction and savepoint)
-- ---------------------------------------------

-- 1. Check that the test ID is available
SELECT *
FROM Patients
WHERE PatientID = 'OP995';

-- 2. Start transaction
START TRANSACTION;

-- 3. Insert a temporary patient
INSERT INTO Patients (
    PatientID,
    PatientName,
    Postcode
)
VALUES (
    'OP995',
    'Temporary Delete Test',
    'SM1 1AA'
);

-- 4. Check the patient exists
SELECT *
FROM Patients
WHERE PatientID = 'OP995';

-- 5. Create a savepoint
SAVEPOINT BeforeDelete;

-- 6. Delete the temporary record
DELETE FROM Patients
WHERE PatientID = 'OP995'
  AND PatientName = 'Temporary Delete Test';

-- 7. Verify deletion
SELECT *
FROM Patients
WHERE PatientID = 'OP995';

-- 8. Restore the deleted record
ROLLBACK TO SAVEPOINT BeforeDelete;

-- 9. Verify restoration
SELECT *
FROM Patients
WHERE PatientID = 'OP995';

-- 10. Remove all temporary changes
ROLLBACK;

-- 11. Verify final ROLLBACK
SELECT *
FROM Patients
WHERE PatientID = 'OP995';

-- ---------------------------------------------
-- TEST 3 - Referential Integrity Test
-- ---------------------------------------------

-- Verify patient and related appointments
SELECT *
FROM Patients
WHERE PatientID = 'OP001';

SELECT
    AppointmentID,
    PatientID,
    AppointmentDate
FROM Appointments
WHERE PatientID = 'OP001';

-- =============================================
-- NEGATIVE TESTS - EXPECTED TO FAIL
-- Workbench stops at the first error:
-- run each statement on its own (cursor + second lightning icon)
-- =============================================

-- TEST 4 - Expected to fail due to Foreign Key constraint (Error 1451)
DELETE FROM Patients
WHERE PatientID = 'OP001';

-- Confirm that the patient remains in the database after the blocked DELETE
SELECT *
FROM Patients
WHERE PatientID = 'OP001';

-- TEST 5 - Expected to fail: invalid priority (Error 3819)
UPDATE FollowUpPlans
SET Priority = 'Low'
WHERE FollowUpID = 'F001';

-- TEST 6 - Expected to fail: appointment outside clinic hours (Error 3819)
INSERT INTO Appointments VALUES ('A999', 'OP001', 'C001', 'CL001', '2026-12-01', '22:00:00');
