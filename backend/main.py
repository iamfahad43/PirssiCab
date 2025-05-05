# This file will includes all the backend code and API's that we need to connect with the front end app

from fastapi import FastAPI

app = FastAPI(title="PirssiCab API")

# Testing the backend api
@app.get("/health")
def health_check():
    return {"status": "ok", "message": "PirssiCab backend is up!"}
