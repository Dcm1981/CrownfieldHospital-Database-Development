# Part D1 — Database Access Control

This folder contains the individual role-based access control implementation for Crownfield Eye Hospital.

Four database roles are demonstrated: Administrator, Doctor, Receptionist and Patient. The scripts cover role creation, permissions, role assignment, authorised and unauthorised access tests, and a summary of all grants. Together they illustrate the principle of least privilege.

## Files and execution order

| File | Purpose | Run as |
|---|---|---|
| `01_Create_Four_Roles.sql` | Creates the four roles | root |
| `02_Administrator_Role.sql` | Grants all privileges on the database | root |
| `03_Doctor_Role.sql` | Read clinical data; record diagnoses, prescriptions and follow-ups (no DELETE) | root |
| `04_Receptionist_Role.sql` | Manage patients and appointments; no clinical data | root |
| `05_Patient_Role.sql` | Read clinics and specialties only | root |
| `06_Assign_Patient_Demo_Role.sql` | Creates `crownfield_patient_demo` and assigns the Patient role | root |
| `07_Verify_Authorised_Access.sql` | Patient user reads Clinics | `crownfield_patient_demo` |
| `08_Test_Unauthorised_Access.sql` | Patient user tries to read Patients | `crownfield_patient_demo` |
| `09_Show_All_Grants.sql` | Shows the privileges of the four roles | root |

## Expected results

- `07`: `CURRENT_USER()` shows `crownfield_patient_demo@localhost` and the Clinics rows are returned.
- `08`: **Error 1142** (SELECT command denied), which proves the restriction works.
- `09`: the privileges match the access matrix in the report (Table 4).

Run `07` and `08` in a separate MySQL Workbench connection using the demonstration password set in `06_Assign_Patient_Demo_Role.sql`.
