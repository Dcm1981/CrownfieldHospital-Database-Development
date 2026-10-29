# Part B — Database Implementation and Testing

## Overview

This folder contains the collaborative database implementation and testing scripts for the fictional Crownfield Eye Hospital.

The database was developed using MySQL 8.0 and contains 11 relational tables and 155 records: the original Appendix 1 data plus 10 synthetic records in every main table.

## SQL Files

| File | Description |
|---|---|
| `01_schema.sql` | Creates the 11 tables with PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, DEFAULT and CHECK constraints. Two `ALTER TABLE` statements add `chk_appointment_time` (08:00–18:00) and `chk_route`. |
| `02_data.sql` | Populates the database with the original and synthetic records. |
| `03_update_delete_tests.sql` | Demonstrates a controlled UPDATE, a controlled DELETE with START TRANSACTION, SAVEPOINT and ROLLBACK, foreign key protection and CHECK constraint tests. |
| `04_data_audit.sql` | Verifies the record counts across all 11 tables. |

## Execution Order

1. `01_schema.sql`
2. `02_data.sql`
3. `03_update_delete_tests.sql`
4. `04_data_audit.sql`

**Important:** `01_schema.sql` contains `DROP DATABASE IF EXISTS CrownfieldHospital`. Running it deletes and recreates that database, including the stored procedure, trigger and clinical-notes table from Parts C and D. Only execute it where the existing database can safely be replaced, and re-run Parts C and D afterwards.

The negative tests are placed at the end of `03_update_delete_tests.sql`. MySQL Workbench stops at the first error, so run each of them individually (place the cursor on the statement and use "Execute Current Statement").

## Expected Results

| Test | Expected result |
|---|---|
| `01_schema.sql` | All statements succeed (11 CREATE TABLE, 2 ALTER TABLE) |
| `04_data_audit.sql` | 13–15 records per table, 155 in total |
| UPDATE of follow-up F001 | Status changes from "Not recorded" to "Scheduled" (1 row) |
| DELETE of temporary patient OP995 | Deleted, restored by ROLLBACK TO SAVEPOINT, removed by final ROLLBACK |
| DELETE of patient OP001 (has appointments) | **Error 1451** – foreign key prevents it; patient remains |
| UPDATE priority to 'Low' | **Error 3819** – CHECK constraint |
| Appointment at 22:00 | **Error 3819** – `chk_appointment_time` |

## Academic Context

Parts A and B form the collaborative database design and implementation component of the CPU4:103 assessment. Each student is individually responsible for explaining and documenting their contribution.
