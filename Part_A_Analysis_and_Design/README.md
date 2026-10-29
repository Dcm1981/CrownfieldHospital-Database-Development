# Part A — Database Analysis and Design

## Overview

This folder contains the collaborative database analysis and design for the fictional Crownfield Eye Hospital.

The objective is to transform the original unnormalised ophthalmology dataset provided in Appendix 1 into a structured relational database.

## Database Analysis

The analysis of Appendix 1 identified:

- Repeating groups, e.g. "Latanoprost | Timolol" in one cell and "6 weeks | High" mixing interval and priority.
- Redundancy, e.g. patient Amina Yusuf and clinician Dr Maya Shah repeated across rows.
- Insertion, update and deletion anomalies, e.g. deleting Michael Okoro's appointment would lose the fact that Dr Priya Nair is a Cornea specialist.

## Entity Relationship Diagram (ERD)

The database consists of 11 relational tables: Patients, Specialties, Clinicians, Clinics, Appointments, Diagnoses, AppointmentDiagnoses, Medicines, Prescriptions, PrescriptionItems and FollowUpPlans.

The ERD uses Crow's Foot notation. Key cardinality and optionality rules:

| Relationship | Rule |
|---|---|
| Patient / Clinician / Clinic → Appointment | One to zero or many |
| Appointment → Prescription | One to zero or many |
| Appointment → AppointmentDiagnoses | One to zero or many (resolves the many-to-many with Diagnoses) |
| Appointment → FollowUpPlan | One to zero or one (enforced by a UNIQUE key) |
| Prescription → PrescriptionItems | One to one or many |

Only three relationships are identifying (solid lines), because the foreign key is part of the primary key: Appointments → AppointmentDiagnoses, Diagnoses → AppointmentDiagnoses and Prescriptions → PrescriptionItems. All others are non-identifying (dashed lines).

## Database Normalisation

| Form | Step | Example |
|---|---|---|
| 1NF | Atomic values | One medicine per row; follow-up split into due date and priority |
| 2NF | Remove partial dependencies | DiagnosisName depends only on DiagnosisID within the key (AppointmentID, DiagnosisID) → Diagnoses table |
| 3NF | Remove transitive dependencies | ClinicianID → SpecialtyID → SpecialtyName → Specialties table |

The final structure reduces data redundancy and separates patient, appointment, diagnosis, prescription and medicine information into related tables.

## Files

- `ERD.png` — Visual representation of the relational database design.
- `ERD.mwb` — Editable MySQL Workbench model (open with File → Open Model in MySQL Workbench).

## Academic Context

Part A forms part of the collaborative component of the CPU4:103 assessment. Each student is individually responsible for explaining the design decisions and their contribution.
