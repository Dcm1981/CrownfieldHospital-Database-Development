# Part A — Database Analysis and Design

## Overview

This folder contains the collaborative database analysis and design for the fictional Crownfield Eye Hospital.

The objective is to transform the original unnormalised ophthalmology dataset provided in Appendix 1 into a structured relational database.

## Database Analysis

The analysis considers:

- Data redundancy and potential insertion, update and deletion anomalies.
- Business rules and relationships between hospital entities.
- Primary keys and foreign keys.
- Relationship cardinality and optionality.

## Entity Relationship Diagram (ERD)

The database consists of 11 relational tables:

- Patients
- Specialties
- Clinicians
- Clinics
- Appointments
- Diagnoses
- AppointmentDiagnoses
- Medicines
- Prescriptions
- PrescriptionItems
- FollowUpPlans

The ERD uses Crow's Foot notation to represent relationships and distinguish identifying from non-identifying relationships.

## Database Normalisation

The database design applies normalisation principles from Unnormalised Form (UNF) through First Normal Form (1NF), Second Normal Form (2NF) and Third Normal Form (3NF).

The final structure reduces data redundancy and separates patient, appointment, diagnosis, prescription and medicine information into related tables.

## Files

- `ERD.png` — Visual representation of the relational database design.
- `ERD.mwb` — Editable MySQL Workbench database model.

## Academic Context

Part A forms part of the collaborative component of the CPU4:103 assessment. Each student is individually responsible for explaining the design decisions and their contribution.
