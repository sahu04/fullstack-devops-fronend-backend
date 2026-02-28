from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
import os
import time

app = FastAPI()

# ✅ CORS Configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, replace with your ALB domain
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ✅ Get DATABASE_URL from environment
DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise Exception("DATABASE_URL not found!")

engine = None

# ✅ Wait for PostgreSQL to be ready
for i in range(10):
    try:
        engine = create_engine(DATABASE_URL)
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        print("✅ Database connected!")
        break
    except SQLAlchemyError as e:
        print("⏳ Waiting for database...", e)
        time.sleep(3)

if engine is None:
    raise Exception("❌ Could not connect to database")

# ✅ Health Check Route
@app.get("/")
def health():
    return {"status": "Backend running"}

# ✅ API Route
@app.get("/api")
def read_api():
    try:
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        return {"message": "Backend + PostgreSQL Working 🚀"}
    except Exception as e:
        return {"error": str(e)}
