from flask import Flask

app = Flask(__name__)

@app.route('/')
def capstone():
    return 'Hello! This is my capstone project!'

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)
