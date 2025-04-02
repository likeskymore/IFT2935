from sqlalchemy import Column, Integer, String, Date, ForeignKey
from db_setup import Base

class Stage(Base):
    __tablename__ = "stage"

    idstage = Column(Integer, primary_key=True, autoincrement=True)
    titrestage = Column(String, nullable=False)
    datedebut = Column(Date, nullable=False)
    datefin = Column(Date, nullable=False)
    etat = Column(String, nullable=False)
    datevisite = Column(Date, nullable=True)
    idetudiant = Column(Integer, ForeignKey("etudiant.idetudiant"), nullable=False)
    identreprise = Column(Integer, ForeignKey("entreprise.identreprise"), nullable=False)
    idenseignant = Column(Integer, ForeignKey("enseignant.idenseignant"), nullable=False)

class Etudiant(Base):
    __tablename__ = "etudiant"

    idetudiant = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String, nullable=False)
    prenom = Column(String, nullable=False)
    birthdate = Column(Date, nullable=False)
    email = Column(String, unique=True, nullable=False)
    telephone = Column(String, nullable=False)
    filiere = Column(String, nullable=False)

class Entreprise(Base):
    __tablename__ = "entreprise"

    identreprise = Column(Integer, primary_key=True, autoincrement=True)
    nomentreprise = Column(String, nullable=False)
    adresse = Column(String, nullable=False)
    secteuractivitees = Column(String, nullable=False)
    telephone = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False)
    stageanterieures = Column(String, nullable=True)

class Enseignant(Base):
    __tablename__ = "enseignant"

    idenseignant = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String, nullable=False)
    prenom = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False)
    telephone = Column(String, nullable=False)
    domaineens = Column(String, nullable=False)


