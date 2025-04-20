import tkinter as tk
import db_setup
from db_setup import Base
from tkinter import ttk
from sqlalchemy.orm import sessionmaker
from models import Stage,Enseignant,Entreprise,Etudiant
from sqlalchemy.orm import aliased
from sqlalchemy import and_
from sqlalchemy import func

# Global variable for database session
db_session = None
error_label = None

# Function to connect to the database
def connect_to_db():
    global db_session

    if db_session is not None:
        print("Using the existing database session.")
        return db_session

    try:
        dbname = dbname_entry.get()
        user = user_entry.get()
        password = password_entry.get()
        host = host_entry.get()
        port = port_entry.get()

        # Configure database connection
        db_setup.configure_db(host, port, dbname, user, password)
        engine = db_setup.get_engine()

        Base.metadata.create_all(engine) 

        SessionLocal = sessionmaker(bind=engine)
        db_session = SessionLocal()

        hide_error_message()
        hide_info_message()
        print("Connection successful!")
        return db_session

    except Exception as e:
        show_error_message(f"Error connecting to database: {e}")
        return None

# Function to display error messages
def show_error_message(message):
    global error_label
    if error_label:
        error_label.config(text=message, fg="red")

# Function to hide error messages
def hide_error_message():
    global error_label
    if error_label:
        error_label.config(text="")

def show_info_message(message):
    if info_label:
        info_label.config(text=message, fg="blue")

def hide_info_message():
    if info_label:
        info_label.config(text="")

# Function to execute a query and display the result
def execute_query(results, columns):
    print("Query Results:")
    display_results_on_gui(results, columns)

# Function to display query results
def display_results_on_gui(results, columns):
    for widget in result_frame.winfo_children():
        widget.destroy()

    treeview = ttk.Treeview(result_frame, columns=columns, show="headings", height=15)

    for col in columns:
        treeview.heading(col, text=col)
        treeview.column(col, width=100, anchor="center")

    for row in results:
        treeview.insert("", "end", values=row)

    treeview.pack(fill=tk.BOTH, expand=True)
    scrollbar = tk.Scrollbar(result_frame, orient="vertical", command=treeview.yview)
    treeview.config(yscrollcommand=scrollbar.set)
    scrollbar.pack(side="right", fill="y")

# Button click function to execute ORM queries
def on_button_click(button_number):
    if db_session is None:
        show_error_message("No active connection. Please connect first.")
        return

    print(f"Button {button_number} clicked!")
    results = []
    columns = []

    if button_number == 1:
        show_info_message('le nom et prénom des étudiants pour lesquels le prof a effectué une visite pour leur stage en cours')
        query = (
            db_session.query(Etudiant.nom, Etudiant.prenom)
            .join(Stage, Stage.idetudiant == Etudiant.idetudiant)
            .filter(
                Stage.etat == "En cours",
                Stage.datevisite != None
            )
            .all()
        )
        columns = ["nom", "prenom"]
        results = [list(row) for row in query]
    elif button_number == 2:
        show_info_message("les noms (Nom, Prénom) et la filière de tous les étudiants qui n'ont actuellement aucun stage à l'état 'en cours'")
        StageAlias = aliased(Stage)
        query = (
            db_session.query(Etudiant.nom, Etudiant.prenom, Etudiant.filiere)
            .outerjoin(
                StageAlias,
                and_(
                    StageAlias.idetudiant == Etudiant.idetudiant,
                    StageAlias.etat == "en cours"
                )
            )
            .filter(StageAlias.idstage == None)
            .all()
        )
        columns = ["nom", "prenom", "filiere"]
        results = [list(row) for row in query]
    elif button_number == 3:
        show_info_message("Lister les noms et emails des entreprises qui offrent au moins un stage mais dont aucun stage n'a jamais été attribué à un étudiant de la filière 'Informatique'")
        query = (
            db_session.query(Entreprise.nomentreprise, Entreprise.email)
            .join(Stage, Entreprise.identreprise == Stage.identreprise)
            .outerjoin(
                Etudiant,
                and_(
                    Etudiant.idetudiant == Stage.idetudiant,
                    Etudiant.filiere == 'Informatique'
                )
            )
            .group_by(Entreprise.identreprise, Entreprise.nomentreprise, Entreprise.email)
            .having(func.count(Etudiant.idetudiant) == 0)
            .all()
        )
        columns = ["nomentreprise", "email"]
        results = [list(row) for row in query]
        
    # elif button_number == 4:
    #     stages = a
    #     columns = Stage.__table__.columns.keys()
    #     results = [[getattr(stage, col) for col in columns] for stage in stages]

    execute_query(results, columns)

# Function to close the database session
def close_connection():
    global db_session
    if db_session:
        db_session.close()
        db_session = None
        submit_button.config(state=tk.ACTIVE)
        hide_info_message()
        hide_error_message()
        print("Connection closed.")
        update_buttons_state()

# Function to update button states
def update_buttons_state():
    state = tk.NORMAL if db_session else tk.DISABLED
    for button in buttons:
        button.config(state=state)

# Function to handle submit button click
def on_submit():
    connect_to_db()
    update_buttons_state()
    if db_session:
        submit_button.config(state=tk.DISABLED)

# Create the main window
root = tk.Tk()
root.title("Stage Database Connection")
root.geometry("600x500")

# Create input form
form_frame = tk.Frame(root)
form_frame.pack(pady=10)

fields = ["Host", "Port", "Database Name", "Username", "Password"]
entries = {}
for i, field in enumerate(fields):
    tk.Label(form_frame, text=f"{field}:").grid(row=i, column=0, padx=5, pady=5)
    entry = tk.Entry(form_frame, show="*" if field == "Password" else "")
    entry.grid(row=i, column=1, padx=5, pady=5)
    entries[field] = entry

host_entry, port_entry, dbname_entry, user_entry, password_entry = entries.values()
host_entry.insert(0, "localhost")
port_entry.insert(0, "5432")

# Error message label
error_label = tk.Label(root, text="", fg="red")
error_label.pack(pady=5)

# Info message label (not for errors)
info_label = tk.Label(root, text="", fg="blue", wraplength=500, justify="left")
info_label.pack(pady=5)

# Submit button
submit_button = tk.Button(root, text="Connect", command=on_submit)
submit_button.pack(pady=10)

# Button frame
button_frame = tk.Frame(root)
button_frame.pack(pady=10)
buttons = []
for i in range(1, 5):
    button = tk.Button(button_frame, text=f"Query {i}", command=lambda i=i: on_button_click(i))
    button.grid(row=0, column=i-1, padx=10, pady=10)
    buttons.append(button)

# Close button
close_button = tk.Button(root, text="Close Connection", command=close_connection)
close_button.pack(pady=10)

# Result frame
result_frame = tk.Frame(root)
result_frame.pack(padx=20, pady=20, fill=tk.BOTH, expand=True)

# Start Tkinter loop
root.mainloop()
