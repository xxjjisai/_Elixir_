from flask import Flask,jsonify
from flask import request,make_response
import time
import sys
import json

app = Flask(__name__)

nCount = 1

@app.route('/',methods=['GET','POST'])
def hello_world():

    global nCount

    nCount = nCount + 1

    # test = { 'key1':'123','key2':'456'}

    rsp = make_response('hello4') #这个方法生成了一个response对象
    rsp.mimetype = 'text/plain'
    rsp.headers['nCount'] = nCount
    rsp.set_cookie('user','wang')#这个值可以用接下来访问的request.cookies来取得 


    # return json.dumps(test)
    return rsp

if __name__ == '__main__':
    app.run(debug=True)