from flask import Flask,jsonify
from flask import request,make_response
import time
import sys
import json

app = Flask(__name__)
 
tbData = {}

@app.route('/',methods=['GET','POST'])
def hello_world(): 
    global tbData
    tbData = { 'key1':'value1','key2':'value2','key3':'value3' } 
    return json.dumps(tbData)

if __name__ == '__main__':
    app.run(debug=True)