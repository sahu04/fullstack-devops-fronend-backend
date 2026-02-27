from fastapi import FastAPI
from pymongo import MongoClient
import os
import time

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL", "mongodb://mongo:27017")

client = None

for i in range(10):
    try:
        client = MongoClient(DATABASE_URL)
        client.admin.command("ping")
        print("MongoDB connected!")
        break
    except Exception as e:
        print("Waiting for MongoDB...", e)
        time.sleep(3)

@app.get("/api")
def read_api():
    return {"message": "Backend + MongoDB Working 🚀"}
