# IFT2935

## guide installation pour tpist
### guide import database
 - ouvrir terminal dans ce folder et run **psql -U postgres -c "CREATE DATABASE *databasename*;"**
 - run **pg_restore -U *username* -d *databasename* --clean --if-exists --no-owner ProjetFinal.backup**
   
### guide execution du programme
 - ouvrir terminal, run ce command: **python -m venv .venv** pour créer python environnement pour ce projet (optionel)
 - si vous avez créé un environnement run **.venv\Scripts\activate** pour accéder à l'environnement
 - run **pip install -r requirements.txt && python window.py** (**Powershell**: pip install -r requirements.txt ; python window.py)

## guide installation pour coequipier
### guide import database
 - ouvrir terminal dans ce folder et run **psql -U postgres -c "CREATE DATABASE *databasename*;"**
 - run **pg_restore -U *username* -d *databasename* --clean --if-exists --no-owner ProjetFinal.backup**

### guide execution du programme
 - ouvrir terminal, run ce command: **python -m venv .venv** pour créer python environnement pour ce projet (optionel)
 - si vous avez créé un environnement run **.venv\Scripts\activate** pour accéder à l'environnement
 - run **pip install -r requirements.txt**
 - dans vscode en bas à droite, choisir python environnement comme interpreter
![image](https://github.com/user-attachments/assets/d9ca204a-7975-4a09-9d81-2aa8b08e22c5)


![image](https://github.com/user-attachments/assets/1562dcda-d0f5-42a8-ad1f-bf024e0a7390)

- maintenant vous pouvez click run dans window.py pour démarrer l'application
