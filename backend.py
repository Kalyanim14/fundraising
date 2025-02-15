from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/user/<int:user_id>')
def get_user(user_id):
    users = {1: {"id": 1, "name": "John Doe"},2:{"id":2,"name":"kalyani"}}
    if user_id in users:
        return jsonify(users[user_id])
    else:
        return jsonify({"error": "User not found"}), 404

if __name__ == '__main__':
    app.run(debug=True)
