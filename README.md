# IFT2935

## Database Import Guide

### Steps to Import the Database:
1. Open a terminal in the project directory.
2. Run the following command to create the database:
   ```bash
   psql -U postgres -c "CREATE DATABASE your_database_name;"
   pg_restore -U username -d your_database_name --clean --if-exists --no-owner ProjectFinal.backup
   ```
