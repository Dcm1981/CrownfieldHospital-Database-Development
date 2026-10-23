USE CrownfieldHospital;

-- Query 2: INNER JOIN with 3 tables
-- Prescription, medication and frequency

SELECT
    pr.PrescriptionID,
    m.MedicineName,
    pi.Frequency
FROM Prescriptions pr
INNER JOIN PrescriptionItems pi ON pr.PrescriptionID = pi.PrescriptionID
INNER JOIN Medicines m ON pi.MedicineID = m.MedicineID;