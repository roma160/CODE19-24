import os
import psycopg2

conn = psycopg2.connect(
        host="localhost",
        database="data1924"
        user="sammy"
        user="sammy"
        )

cur = conn.cursor()

conn.commit()

cur.close()
conn.close()
