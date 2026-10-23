# Part C — Individual SQL Functionalities

## Overview

This folder contains six individual SQL functionalities developed for the Crownfield Eye Hospital database as part of the CPU4:103 assessment.

## SQL Queries

| File | Functionality | Purpose |
|---|---|---|
| `Query_01_GroupBy_Having.sql` | GROUP BY and HAVING | Identifies clinics with more than one appointment |
| `Query_02_Inner_Join.sql` | INNER JOIN | Retrieves prescription IDs, medicine names and prescription frequencies using three tables |
| `Query_03_Left_Join.sql` | LEFT JOIN | Identifies appointments without prescriptions |
| `Query_04_Subquery.sql` | Subquery | Identifies appointments requiring High or Urgent follow-up |
| `Query_05_Stored_Procedure.sql` | Stored Procedure | Retrieves appointment history for a selected patient |
| `Query_06_Trigger.sql` | Trigger | Prevents clinician double-booking when inserting an appointment |

## Stored Procedure

The procedure `GetPatientAppointments_Daniel` accepts a patient ID as an input parameter and returns their appointment history, including clinician, clinic, date and time.

## Trigger

The trigger `PreventDoubleBooking_Daniel` checks whether a clinician already has an appointment at the proposed date and time before a new appointment is inserted.

## Trigger Validation

Three supporting tests demonstrate:

- Checking whether an appointment slot is available.
- Inserting a valid appointment and reversing the change using ROLLBACK.
- Rejecting a conflicting appointment using the trigger.

## Execution

Use the `CrownfieldHospital` database after executing the schema and sample data scripts in `Part_B_Implementation`.

Run Queries 01–04, create the stored procedure (Query 05), and then create the trigger (Query 06).

The negative trigger test is expected to raise Error 1644, demonstrating that the business rule is enforced.

## Academic Context

Part C is individually assessed and demonstrates SQL querying, aggregation, joins, stored procedures and triggers.
