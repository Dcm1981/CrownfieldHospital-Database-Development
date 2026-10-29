# Part D2 — Data Protection

This folder contains an individual AES encryption and decryption demonstration using fictional clinical notes in the `CrownfieldHospital` database.

## File

| File | Purpose | Run as |
|---|---|---|
| `D2_AES_Encryption_Demo.sql` | Creates `ClinicalNotes_Daniel`, stores an AES-encrypted note and tests decryption | root |

Run it after `Part_B_Implementation/01_schema.sql` and `02_data.sql`, because the table references patient `OP001`.

## What the script does

1. Creates `ClinicalNotes_Daniel` with an `EncryptedNote` column of type `VARBINARY`.
2. Inserts a note encrypted with `AES_ENCRYPT()`.
3. Displays the stored value with `HEX()`.
4. Decrypts it with the correct key using `AES_DECRYPT()`.
5. Tries to decrypt it with a wrong key.

## Expected results

- Step 3: an unreadable hexadecimal value.
- Step 4: the readable note "Review eye pressure in 6 weeks".
- Step 5: `NULL`, because without the correct key the note cannot be read.

## Limitation

This is an academic demonstration, not a complete production security solution. The key is written in the script only for this assessment; a real system would keep it in a separate key-management service and combine encryption with access control and auditing.
