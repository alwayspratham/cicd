from fastapi import FastAPI, HTTPException, Depends
from typing import List
import uvicorn



app = FastAPI(title="CI/CD Application", version="1.0.0")


@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI Application", "status": "healthy"}


@app.get("/health")
def health_check():
    return {"status": "ok"}

