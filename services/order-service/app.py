
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(service="order-service", status="running")

@app.route("/orders")
def orders():
    return jsonify([
        {"id": 500, "product": "Laptop"},
        {"id": 501, "product": "Phone"}
    ])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
