import psycopg2
import os
from dotenv import load_dotenv
load_dotenv()
def conectar():
    return psycopg2.connect(
        host="localhost",
        database="biblioteca",
        user="app",
        password=os.getenv("DB_PASSWORD")
    )

