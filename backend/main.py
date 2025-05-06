# This file will includes all the backend code and API's that we need to connect with the front end app

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="PirssiCab API")

# Allow browser clients from any origin (we’ll lock this down later)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],              # <— in prod, list your exact domains
    allow_credentials=True,
    allow_methods=["*"],             # GET, POST, etc
    allow_headers=["*"],             # permits Content-Type, Authorization, ...
)

# Testing the backend api
@app.get("/health")
def health_check():
    return {"status": "ok", "message": "PirssiCab backend is up!"}
