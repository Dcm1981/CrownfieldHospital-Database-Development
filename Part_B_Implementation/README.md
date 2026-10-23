# Part B — Database Implementation and Testing

## Overview

This folder contains the collaborative database implementation and testing scripts for the fictional Crownfield Eye Hospital.

The database was developed using MySQL 8.0 and contains 11 relational tables and 155 records, including the original Appendix 1 data and additional synthetic records.

## SQL Files

| File | Description |
|---|---|
| `01_schema.sql` | Creates the database structure, primary and foreign keys, and additional CHECK constraints. |
| `02_data.sql` | Populates the database with the original and synthetic records. |
| `03_update_delete_tests.sql` | Demonstrates controlled UPDATE and DELETE operations, transactions, SAVEPOINT, ROLLBACK, foreign key protection and CHECK constraint tests. |
| `04_data_audit.sql` | Verifies the record counts across all 11 tables. |

## Execution Order

Run the scripts in the following order:

1. `01_schema.sql`
2. `02_data.sql`
3. `03_update_delete_tests.sql`
4. `04_data_audit.sql`

**Important:** The schema script contains `DROP DATABASE IF EXISTS CrownfieldHospital`. Running it will delete and recreate that database. Only execute it in a disposable test environment or where the existing database can safely be replaced.

Some integrity tests intentionally produce errors to demonstrate that database constraints prevent invalid operations. Run these negative tests individually when necessary.

## Expected Results

- 11 relational tables.
- 155 records across the database.
- Controlled UPDATE and DELETE operations demonstrated.
- Foreign Key restrictions tested.
- CHECK constraints tested.
- Database population verified.

## Academic Context

Parts A and B form the collaborative database design and implementation component of the CPU4:103 assessment. Each student is individually responsible for explaining and documenting their contribution.
