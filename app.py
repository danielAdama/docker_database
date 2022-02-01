from flask import Flask, request, render_template, redirect, session
import pickledb

# Initialize the Flask application
app = Flask(__name__)

# Initialize the Database
db = pickledb.load('databasename.db', True)

# URL for each endpoint
@app.route("/", methods=['POST', 'GET'])
def first_last_name():
    """Function that returns the first and last name"""
    if request.method == "POST":
        first_name = request.form.get('first_name')
        last_name = request.form.get('last_name')

        first_name = db.set('first name', first_name)
        last_name = db.set('last name', last_name)

        db.dump()
    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')