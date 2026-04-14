# main.py
from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello world from Render to Docker! 🚀"


@app.route("/health")
def health():
    return "OK", 200


if __name__ == "__main__":
    # Render задаёт порт через переменную окружения PORT
    import os

    port = int(os.environ.get("PORT", 5001))
    app.run(host="0.0.0.0", port=port)
