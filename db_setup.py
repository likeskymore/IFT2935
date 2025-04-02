from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Global variables for the engine and session
engine = None
SessionLocal = None
Base = declarative_base()

def configure_db(host, port, dbname, user, password):
    global engine, SessionLocal

    DATABASE_URL = f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{dbname}"

    # Create the engine dynamically
    engine = create_engine(DATABASE_URL)
    
    # Create a session
    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

    print("Database configuration updated!")

def get_engine():
    if engine is None:
        raise Exception("Database is not configured. Call configure_db() first.")
    return engine