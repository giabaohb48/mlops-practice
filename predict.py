import pickle
from flask import Flask, jsonify, request

# Load model from pickle file
with open('./model/finalized_model.pkl', 'rb') as f:
    model = pickle.load(f)

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    # Get input data from request
    input_data = request.get_json(force=True)
    print(input_data)
    # Prepare input values for prediction
    # fixed acidity,volatile acidity,citric acid,residual sugar,chlorides,free sulfur dioxide,total sulfur dioxide,density,pH,sulphates,alcohol
    input_values = [input_data['fixed acidity'], input_data['volatile acidity'], input_data['citric acid'], input_data['residual sugar'], input_data['chlorides'], input_data['free sulfur dioxide'], input_data['total sulfur dioxide'], input_data['density'], input_data['pH'], input_data['sulphates'], input_data['alcohol']]

    # Make prediction using loaded model and input values
    prediction = model.predict([input_values])[0]

    # Prepare response in JSON format
    response = {
        'quality': str(prediction)
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True, port=5000,host='0.0.0.0')