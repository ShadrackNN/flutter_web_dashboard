from flask import Flask, jsonify
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


def fetch_data():
    conn = mysql.connector.connect(
        host='127.0.0.1',
        user='root',
        password='',
        database='flutter_db'
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM data")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return rows


@app.route('/data', methods=['GET'])
def get_data():
    rows = fetch_data()
    data = [{'id': row[0], 'name': row[1], 'value': row[2]} for row in rows]
    return jsonify(data)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
