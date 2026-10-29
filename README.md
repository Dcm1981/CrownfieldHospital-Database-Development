# Crownfield Eye Hospital — Database Development

**Module:** CPU4:103 — Introduction to Database  
**Programme:** BSc (Hons) Computing  
**Lecturer:** Mrs. Puna-Rimam Maiyaki  
**Individual Student (Parts C and D):** Daniel Camargo Moreira (G1418730)  
**Group Work (Parts A and B):** Serat Choudhury (G1411615), Natalin Tek Ozler (G1438117)
**Database Management System:** MySQL 8.0  
**Development Environment:** MySQL Workbench  
**Project Scenario:** Crownfield Eye Hospital NHS Foundation Trust (fictional)  
**Development Company:** Flytech Ltd

## 1. Project Overview

This project involves the analysis, design, implementation and testing of a relational database for the fictional Crownfield Eye Hospital.

The database is designed to manage patient information, clinicians, medical specialties, clinics, appointments, diagnoses, prescriptions, medicines and follow-up plans.

The assessment combines collaborative database development (Parts A and B) with individually assessed SQL functionalities and security demonstrations (Parts C and D).

## 2. Part A — Database Analysis and Design

The database was developed using relational database design principles and normalization techniques.

The design process includes:

- Analysis of the original Appendix 1 dataset and identification of data anomalies.
- Entity Relationship Diagram (ERD) using Crow's Foot notation.
- Identification of primary keys, foreign keys, cardinality and optionality.
- Normalization from Unnormalized Form (UNF) through First Normal Form (1NF) and Second Normal Form (2NF) to Third Normal Form (3NF).

### Database Tables

The final implementation contains 11 relational tables:

| Table | Purpose |
|---|---|
| Patients | Stores patient information |
| Specialties | Stores medical specialties |
| Clinicians | Stores clinicians and their primary specialty |
| Clinics | Stores hospital clinic locations |
| Appointments | Records patient appointments |
| Diagnoses | Stores diagnosis information |
| AppointmentDiagnoses | Links appointments and diagnoses |
| Medicines | Stores medicine information |
| Prescriptions | Records prescriptions linked to appointments |
| PrescriptionItems | Stores each medicine in a prescription, with dose, route, frequency and duration |
| FollowUpPlans | Records the follow-up plan of an appointment (due date, priority and status) |

The ERD image and its editable MySQL Workbench source are in the `05_ERD/` folder.

## 3. Part B — Database Implementation and Testing

The database was implemented using MySQL and includes:

- 11 relational tables.
- 155 records across the database.
- The original Appendix 1 records plus 10 synthetic records in every main table.
- Primary Key and Foreign Key constraints.
- NOT NULL, UNIQUE, DEFAULT and CHECK constraints where appropriate.
- `ALTER TABLE` statements adding CHECK constraints after table creation.
- Controlled UPDATE and DELETE operations that preserve referential integrity.

### Testing

| File | Purpose |
|---|---|
| `03_update_delete_tests.sql` | Controlled UPDATE; controlled DELETE with transaction, SAVEPOINT and ROLLBACK; referential integrity test; CHECK constraint tests |
| `04_data_audit.sql` | Counts the records in all 11 tables |

The tests demonstrate how database constraints and transactions help maintain data consistency.

## 4. Part C — Individual SQL Functionalities

Six individual SQL functionalities were developed to demonstrate data retrieval, aggregation, procedural SQL and business rule enforcement.

| Query | Functionality | Purpose |
|---|---|---|
| Query 01 | GROUP BY and HAVING | Identifies clinics with more than one appointment |
| Query 02 | INNER JOIN (3 tables) | Lists each prescription with its medicine name and frequency |
| Query 03 | LEFT JOIN | Identifies appointments without prescriptions |
| Query 04 | Subquery | Identifies appointments with a High or Urgent follow-up |
| Query 05 | Stored Procedure | Retrieves the appointment history of a selected patient |
| Query 06 | Trigger | Prevents a clinician from being double-booked on INSERT |

### Stored Procedure

`GetPatientAppointments_Daniel`

The stored procedure accepts a PatientID parameter and retrieves the patient's appointment history, including clinician, clinic, date and time.

### Trigger

`PreventDoubleBooking_Daniel`

The trigger checks whether a clinician already has an appointment at the proposed date and time before a new appointment is inserted.

Three tests support it: a check that the slot is free, a positive test (A997, inserted and then removed with ROLLBACK) and a negative test (A996, rejected with Error 1644).

The trigger implements an INSERT-time business rule; it does not independently handle appointment rescheduling through UPDATE.

## 5. Part D — Database Security and Data Protection

### D1 — Role-Based Access Control

Four database roles were created:

| Role | Main responsibilities |
|---|---|
| `crownfield_admin` | Full database management and administration |
| `crownfield_doctor` | Read clinical information; record diagnoses, prescriptions and follow-up plans; no DELETE |
| `crownfield_receptionist` | Manage patient registration and appointments; no access to clinical data |
| `crownfield_patient` | Read clinic and specialty information only |

Permissions were implemented using `CREATE ROLE`, `GRANT`, `CREATE USER`, `SET DEFAULT ROLE` and `SHOW GRANTS`.

Authorised and unauthorised access tests, run as the `crownfield_patient_demo` user, demonstrate differentiated privileges and the principle of least privilege.

The demonstration does not implement patient-specific record access (each patient seeing only their own records). A production system would need views or application-level controls for this.

### D2 — AES Encryption and Data Protection

The table `ClinicalNotes_Daniel` stores fictional clinical notes encrypted with AES.

The demonstration includes:

- Encryption using `AES_ENCRYPT()` and storage in a `VARBINARY` column.
- Display of the stored data as unreadable hexadecimal with `HEX()`.
- Decryption with the correct key using `AES_DECRYPT()`.
- A wrong-key test that returns `NULL`.

The encryption key is written in the script for academic demonstration only. A production system would store it in a separate key-management system.

## 6. Repository Structure

```text
CrownfieldHospital-Database-Development/
│
├── README.md
│
├── 05_ERD/
│   ├── ERD.mwb
│   └── ERD.png
│
├── Part_B_Implementation/
│   ├── 01_schema.sql
│   ├── 02_data.sql
│   ├── 03_update_delete_tests.sql
│   └── 04_data_audit.sql
│
├── Part_C_Individual/
│   ├── Query_01_GroupBy_Having.sql
│   ├── Query_02_Inner_Join.sql
│   ├── Query_03_Left_Join.sql
│   ├── Query_04_Subquery.sql
│   ├── Query_05_Stored_Procedure.sql
│   ├── Query_06_Trigger.sql
│   └── Trigger_Tests/
│       ├── Test_01_Check_Available_Slot.sql
│       ├── Test_02_Positive_A997.sql
│       └── Test_03_Negative_A996.sql
│
└── Part_D_Individual/
    ├── D1_Access_Control/
    │   ├── 01_Create_Four_Roles.sql
    │   ├── 02_Administrator_Role.sql
    │   ├── 03_Doctor_Role.sql
    │   ├── 04_Receptionist_Role.sql
    │   ├── 05_Patient_Role.sql
    │   ├── 06_Assign_Patient_Demo_Role.sql
    │   ├── 07_Verify_Authorised_Access.sql
    │   └── 08_Test_Unauthorised_Access.sql
    └── D2_Data_Protection/
        └── D2_AES_Encryption_Demo.sql
```

## 7. Installation and Execution Instructions

### Requirements

- MySQL Server 8.0 or later (required for CHECK constraints and roles)
- MySQL Workbench
- The root account, or an account with permission to create databases, roles and users

### Execution Order

**Warning:** `01_schema.sql` starts with `DROP DATABASE IF EXISTS CrownfieldHospital`. Do not run it on a server that holds an existing `CrownfieldHospital` database with important records.

| Step | File(s) | Run as |
|---|---|---|
| 1 | `Part_B_Implementation/01_schema.sql` | root |
| 2 | `Part_B_Implementation/02_data.sql` | root |
| 3 | `Part_B_Implementation/03_update_delete_tests.sql` | root |
| 4 | `Part_B_Implementation/04_data_audit.sql` | root |
| 5 | `Part_C_Individual/Query_01` to `Query_05` | root |
| 6 | `Part_C_Individual/Query_06_Trigger.sql`, then `Trigger_Tests/Test_01`, `Test_02`, `Test_03` | root |
| 7 | `Part_D_Individual/D1_Access_Control/01` to `06` | root |
| 8 | `Part_D_Individual/D1_Access_Control/07` and `08` | `crownfield_patient_demo` |
| 9 | `Part_D_Individual/D2_Data_Protection/D2_AES_Encryption_Demo.sql` | root |

**Notes:**

- Because `01_schema.sql` recreates the database, all scripts can be run again from Step 1.
- Some tests are designed to fail, to prove that a constraint works. MySQL Workbench stops at the first error, so run each negative test on its own (place the cursor on the statement and use "Execute Current Statement").
- For Step 8, create a new Workbench connection with user `crownfield_patient_demo` and the demonstration password set in `06_Assign_Patient_Demo_Role.sql`.

### Expected Results

| Test | Expected result |
|---|---|
| `04_data_audit.sql` | 13–15 records in each table, 155 in total |
| UPDATE of follow-up F001 | 1 row affected |
| Controlled DELETE of OP995 | Deleted, restored by ROLLBACK TO SAVEPOINT, removed by ROLLBACK |
| DELETE of patient OP001 (has appointments) | Error 1451 (foreign key); patient remains |
| Invalid priority or appointment at 22:00 | Error 3819 (CHECK constraint) |
| Trigger positive test (A997) | Inserted, then removed by ROLLBACK |
| Trigger negative test (A996) | Error 1644 (double booking) |
| Patient user reads `Patients` | Error 1142 (access denied) |
| AES decryption with the wrong key | NULL |

## 8. Assumptions

- Records with codes `001`–`005` come from Appendix 1; records with codes `101`–`110` are synthetic test data.
- Appendix 1 has no appointment identifier, so `AppointmentID` was introduced.
- Each clinician has one primary specialty.
- Appendix 1 does not record dose, route, frequency or duration, so these are NULL for the original prescription items.
- The follow-up interval in Appendix 1 (for example "6 weeks") is stored as a due date.
- Appointments are restricted to clinic hours (08:00–18:00).

## 9. Data Integrity and Ethical Considerations

All patient information and clinical records are fictional and intended solely for academic purposes.

The database demonstrates relational integrity through primary keys, foreign keys and validation constraints.

Access control and encryption demonstrations illustrate selected information security techniques but do not constitute a production-ready clinical information system.

The demonstration passwords and the AES key in these scripts are fictional and used only for this assessment. Real credentials and encryption keys must never be published in a repository.

## 10. Collaborative and Individual Contributions

**Parts A and B — Collaborative:** Database analysis, normalization, ERD design, schema implementation and synthetic data preparation were undertaken as part of the group project.

**Parts C and D — Individual:** The SQL queries, stored procedure, trigger, role-based security demonstrations, encryption tests and related evidence document the student's own implementation and evaluation work. Individual database objects carry the `_Daniel` suffix.

## 11. Conclusion

The Crownfield Eye Hospital database demonstrates the development of a normalized relational database using MySQL, supported by SQL queries, procedural functionality, integrity constraints and database security techniques.

The project provides practical experience in database design, implementation, testing and documentation as part of the CPU4:103 assessment.
