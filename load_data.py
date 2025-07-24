import psycopg2
import pandas as pd
from sqlalchemy import create_engine

# Connect to source DB
source_conn = psycopg2.connect(
    host='localhost',       # or 'source_postgres' if running from Docker container
    port=5450,
    database='source_db',
    user='postgres',
    password='secret'
)

df = pd.read_sql('SELECT * FROM orders', source_conn)
print("Extracted from source:", df)

# Connect to destination DB
engine = create_engine('postgresql://postgres:secret@localhost:5460/destination_db')
df.to_sql('orders', engine, if_exists='replace', index=False)

print("Loaded to Destination, Well Done Guru, You DID IT 🎉")
