from fastapi import FastAPI
from sqlalchemy import create_engine, text
import os

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")

engine = create_engine(DATABASE_URL)

@app.get("/")
def read_root():
    with engine.connect() as connection:
        result = connection.execute(text("SELECT 1"))
    return {"message": "Backend + PostgreSQL Working 🚀"}
