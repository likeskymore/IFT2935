from db_setup import SessionLocal
from models import Etudiant

# Create a session
session = SessionLocal()

# Debug: Check if session is open
print("✅ Session created.")


# Debug: Check if query runs
try:
    students = session.query(Etudiant).all()
    print(f"✅ Query executed. Found {len(students)} students.")
    for student in students:
        print(student.nom, student.prenom)
except Exception as e:
    print(f"❌ Query failed: {e}")

# Close session
session.close()
print("✅ Session closed.")
