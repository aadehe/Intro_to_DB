import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server (adjust host, user, password as needed)
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password=''  # Update with your MySQL root password if needed
    )
    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
        cursor.close()
    else:
        print("Failed to connect to the MySQL server.")
except Error as e:
    print(f"Error while connecting to MySQL: {e}")
finally:
    if 'connection' in locals() and connection.is_connected():
        connection.close()

