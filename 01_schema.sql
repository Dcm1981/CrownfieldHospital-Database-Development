DROP DATABASE IF EXISTS CrownfieldHospital;
CREATE DATABASE CrownfieldHospital;
USE CrownfieldHospital;

CREATE TABLE Specialties (
  SpecialtyID VARCHAR(10) PRIMARY KEY,
  SpecialtyName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Clinics (
  ClinicID VARCHAR(10) PRIMARY KEY,
  ClinicName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Diagnoses (
  DiagnosisID VARCHAR(10) PRIMARY KEY,
  DiagnosisName VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE Medicines (
  MedicineID VARCHAR(10) PRIMARY KEY,
  MedicineName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Patients (
  PatientID VARCHAR(10) PRIMARY KEY,
  PatientName VARCHAR(100) NOT NULL,
  Postcode VARCHAR(10) NOT NULL
);

CREATE TABLE Clinicians (
  ClinicianID VARCHAR(10) PRIMARY KEY,
  ClinicianName VARCHAR(100) NOT NULL,
  SpecialtyID VARCHAR(10) NOT NULL,
  FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
);

CREATE TABLE Appointments (
  AppointmentID VARCHAR(10) PRIMARY KEY,
  PatientID VARCHAR(10) NOT NULL,
  ClinicianID VARCHAR(10) NOT NULL,
  ClinicID VARCHAR(10) NOT NULL,
  AppointmentDate DATE NOT NULL,
  AppointmentTime TIME NOT NULL,
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (ClinicianID) REFERENCES Clinicians(ClinicianID),
  FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID)
);

CREATE TABLE AppointmentDiagnoses (
  AppointmentID VARCHAR(10),
  DiagnosisID VARCHAR(10),
  PRIMARY KEY (AppointmentID, DiagnosisID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
  FOREIGN KEY (DiagnosisID) REFERENCES Diagnoses(DiagnosisID)
);

CREATE TABLE Prescriptions (
  PrescriptionID VARCHAR(10) PRIMARY KEY,
  AppointmentID VARCHAR(10) NOT NULL,
  FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE PrescriptionItems (
  PrescriptionID VARCHAR(10),
  ItemNumber INT CHECK (ItemNumber > 0),
  MedicineID VARCHAR(10) NOT NULL,
  Dose VARCHAR(100),
  Route VARCHAR(50),
  Frequency VARCHAR(100),
  Duration VARCHAR(100),
  PRIMARY KEY (PrescriptionID, ItemNumber),
  FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
  FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE FollowUpPlans (
  FollowUpID VARCHAR(10) PRIMARY KEY,
  AppointmentID VARCHAR(10) NOT NULL UNIQUE,
  DueDate DATE NOT NULL,
  Priority VARCHAR(10) NOT NULL CHECK (Priority IN ('Routine', 'High', 'Urgent')),
  FollowUpStatus VARCHAR(20) NOT NULL DEFAULT 'Not recorded'
    CHECK (FollowUpStatus IN ('Not recorded', 'Pending', 'Scheduled', 'Completed', 'Cancelled')),
  Notes VARCHAR(255),
  FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

ALTER TABLE Appointments
ADD CONSTRAINT chk_appointment_time
CHECK (AppointmentTime BETWEEN '08:00:00' AND '18:00:00');

ALTER TABLE PrescriptionItems
ADD CONSTRAINT chk_route
CHECK (Route IN ('Topical', 'Intravitreal injection', 'Oral'));
