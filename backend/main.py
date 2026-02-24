from fastapi import FastAPI
from sqlalchemy import create_engine, text
import os
import time

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")

# Wait for database to be ready
for i in range(10):
    try:
        engine = create_engine(DATABASE_URL)
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        print("Database connected!")
        break
    except Exception:
        print("Waiting for database...")
        time.sleep(3)

@app.get("/")
def read_root():
    with engine.connect() as conn:
        conn.execute(text("SELECT 1"))
    return {"message": "Backend + PostgreSQL Working 🚀"}
