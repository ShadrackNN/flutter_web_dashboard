import mysql.connector

def fetch_data():
    # Connect to the database
    conn = mysql.connector.connect(
        host='127.0.0.1',
        user='root',
        password='',
        database='flutter_db'
    )
    cursor = conn.cursor()

    # Execute the query
    cursor.execute("SELECT * FROM data")

    # Fetch all rows
    rows = cursor.fetchall()

    # Close the connection
    cursor.close()
    conn.close()

    return rows

if __name__ == "__main__":
    data = fetch_data()
    for row in data:
        print(row)
