import os
import psycopg
from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    connection = psycopg.connect(
        host=os.getenv("DB_HOST"),
        port=5432,
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD"),
        dbname=os.getenv("POSTGRES_DB")
    )

    with connection.cursor() as cursor:
        cursor.execute("SELECT 'Hello from PostgreSQL!'")
        result = cursor.fetchone()

    connection.close()

    return result[0]


app.run(host="0.0.0.0", port=8000)