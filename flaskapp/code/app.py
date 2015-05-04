import time
from flask import Flask
app = Flask(__name__)

t_launch = time.time()

@app.route("/")
def hello():
    return "Hello World!  (Uptime: {:.1f} seconds)".format(time.time() - t_launch)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
