from fastapi import FastAPI
from sqlalchemy import create_engine

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "FastAPI Backend Working!"}
