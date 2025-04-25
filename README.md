# IFT2935

## Guide d’installation
### Guide d’importation de la base de données
1. Ouvrir un terminal dans le dossier du projet.
2. Exécuter la commande suivante pour créer la base de données :
p s q l −U p o s t g r e s −c "CREATE DATABASE nomdelabase ; "
3. Restaurer le fichier de sauvegarde dans la base de données :
p g _ r e s t o r e −U n o m u t i l i s a t e u r −d nomdelabase −−c l e a n −−i f −e x i s t s
−−no−owner P r o j e t F i n a l . backup
### Guide d’exécution du programme
1. Ouvrir un terminal dans le dossier du projet.
2. (Optionnel) Créer un environnement virtuel :
python −m venv . venv
3. (Si un environnement a été créé) L’activer :
— Sous Windows (cmd) :
. venv \ S c r i p t s \ a c t i v a t e
— Sous PowerShell :
. \ . venv \ S c r i p t s \ A c t i v a t e . ps1
4. Installer les dépendances et exécuter le programme :
pip i n s t a l l −r r e q u i r e m e n t s . t x t && python window . py
5. Sous PowerShell, vous pouvez aussi utiliser :
pip i n s t a l l −r r e q u i r e m e n t s . t x t ; python window . py
