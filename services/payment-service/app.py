from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
        return jsonify({
                    "service": "payment-service",
                    "status": "running"
         })

@app.route("/payments")
def payments():
        return jsonify([
                            {"id": 1, "amount": 100, "status": "paid"},
                            {"id": 2, "amount": 250, "status": "pending"}
         ])

if __name__ == "__main__":
         app.run(host="0.0.0.0", port=5001)
