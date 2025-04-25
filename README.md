# IFT2935

## Database Import Guide

### Guide d’importation de la base de données:
1. Ouvrir un terminal dans le dossier du projet.
2. Exécuter la commande suivante pour créer la base de données:
```bash
psql -U postgres -c "CREATE DATABASE your_database_name;"
```
3. Restaurer le fichier de sauvegarde dans la base de données:
```bash
pg_restore -U username -d your_database_name --clean --if-exists --no-owner ProjectFinal.backup
``` 
### Guide d’exécution du programme
1. Ouvrir un terminal dans le dossier du projet.
2. (Optionnel) Créer un environnement virtuel:
```bash
python -m venv .venv
```
3. (Si un environnement a été créé) L’activer:
- Sous Windows(terminal):
```bash
.venv\Scripts\activate
```
- Sous Powershell:
```bash
.\.venv\Scripts\Activate.ps1
```
4. Installer les dépendances et exécuter le programme:
```bash
pip install -r requirements.txt && python window.py
```
5. Sous PowerShell, vous pouvez aussi utiliser:
```bash
pip install -r requirements.txt ; python window.py
```

