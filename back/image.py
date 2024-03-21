from flask import Flask, request, jsonify, Blueprint

bp = Blueprint('image', __name__, url_prefix='/image')

@bp.route("/upload", methods=["POST"])
def process_image():
    file = request.files['image']
    filename = request.files['image'].filename;

    return jsonify({'filename' : filename,
                    'calories' : 3
                    })
