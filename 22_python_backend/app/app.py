from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("home.html")


@app.route("/post/<int:post_id>")
def post(post_id):
    menu = ["Bla", "Bla2", "Bla3", "Bla4"]
    return render_template("post.html", id=post_id, enum_menu=enumerate(menu))
