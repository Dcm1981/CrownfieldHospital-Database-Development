# Part C — Individual SQL Functionalities

## Overview

This folder contains six individual SQL functionalities developed for the Crownfield Eye Hospital database as part of the CPU4:103 assessment. Individual objects carry the `_Daniel` suffix.

## SQL Queries

| File | Functionality | Purpose | Expected result |
|---|---|---|---|
| `Query_01_GroupBy_Having.sql` | GROUP BY and HAVING | Identifies clinics with more than one appointment | `CL001 | 3` |
| `Query_02_Inner_Join.sql` | INNER JOIN (3 tables) | Retrieves prescription IDs, medicine names and frequencies | 15 rows; frequency NULL for PR001–PR004 (not recorded in Appendix 1) |
| `Query_03_Left_Join.sql` | LEFT JOIN | Identifies appointments without prescriptions | `A004` |
| `Query_04_Subquery.sql` | Subquery | Identifies appointments requiring High or Urgent follow-up | 6 rows: A001, A002, A102, A104, A106, A109 |
| `Query_05_Stored_Procedure.sql` | Stored Procedure | Retrieves appointment history for a selected patient | `OP001` → A001, A003; `OP999` → no rows |
| `Query_06_Trigger.sql` | Trigger | Prevents clinician double-booking when inserting an appointment | Trigger created; shown by `SHOW TRIGGERS` |

## Stored Procedure

The procedure `GetPatientAppointments_Daniel` accepts a patient ID as an input parameter and returns their appointment history, including clinician, clinic, date and time. Because the patient ID is passed as a parameter, MySQL treats it as a value rather than executable SQL, reducing the risk of SQL injection.

## Trigger

The trigger `PreventDoubleBooking_Daniel` runs BEFORE INSERT on `Appointments`. It checks whether a clinician already has an appointment at the proposed date and time and, if so, uses `SIGNAL` to reject the insert. It does not check rescheduling through UPDATE.

## Trigger Validation

| File | Test | Expected result |
|---|---|---|
| `Trigger_Tests/Test_01_Check_Available_Slot.sql` | Confirms the slot C001, 2026-12-20, 16:30 is free | 0 rows |
| `Trigger_Tests/Test_02_Positive_A997.sql` | Inserts a valid appointment, then reverses it with ROLLBACK | 1 row inserted, then 0 rows after ROLLBACK |
| `Trigger_Tests/Test_03_Negative_A996.sql` | Inserts a conflicting appointment for Dr Maya Shah | **Error 1644** – business rule enforced |

## Execution

1. Run `Part_B_Implementation/01_schema.sql` and `02_data.sql` first.
2. Run Queries 01–04.
3. Run Query 05 to create and test the stored procedure.
4. Run Query 06 to create the trigger, then the three trigger tests in order.

**Important:** `01_schema.sql` drops and recreates the database, which also removes the procedure and the trigger. If the schema is run again, re-run Queries 05 and 06 before testing.

## Academic Context

Part C is individually assessed and demonstrates SQL querying, aggregation, joins, stored procedures and triggers.
