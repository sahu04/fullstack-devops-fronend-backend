from fastapi import FastAPI
from sqlalchemy import create_engine, text
import os
import time

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise Exception("DATABASE_URL not found!")

engine = None

for i in range(10):
    try:
        engine = create_engine(DATABASE_URL)
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        print("Database connected!")
        break
    except Exception as e:
        print("Waiting for database...", e)
        time.sleep(3)

@app.get("/api")
def read_api():
    with engine.connect() as conn:
        conn.execute(text("SELECT 1"))
    return {"message": "Backend + PostgreSQL Working 🚀"}
