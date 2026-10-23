-- PART D - TASK D2
-- Data Protection: AES encryption of clinical notes

USE CrownfieldHospital;

-- 1. Create a table to store encrypted clinical notes
DROP TABLE IF EXISTS ClinicalNotes_Daniel;

CREATE TABLE ClinicalNotes_Daniel (
    NoteID INT PRIMARY KEY,
    PatientID VARCHAR(10) NOT NULL,
    EncryptedNote VARBINARY(255) NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- 2. Insert a note encrypted with AES
INSERT INTO ClinicalNotes_Daniel (NoteID, PatientID, EncryptedNote)
VALUES (1, 'OP001', AES_ENCRYPT('Review eye pressure in 6 weeks', 'Crownfield#2026!'));

-- 3. Stored data is unreadable
SELECT NoteID, PatientID, HEX(EncryptedNote) AS EncryptedNote
FROM ClinicalNotes_Daniel;

-- 4. Correct key: the note can be read
SELECT NoteID, PatientID,
       CAST(AES_DECRYPT(EncryptedNote, 'Crownfield#2026!') AS CHAR) AS DecryptedNote
FROM ClinicalNotes_Daniel;

-- 5. Wrong key: the result is NULL
SELECT NoteID, PatientID,
       CAST(AES_DECRYPT(EncryptedNote, 'WrongKey') AS CHAR) AS DecryptedNote
FROM ClinicalNotes_Daniel;
