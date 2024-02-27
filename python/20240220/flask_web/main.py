# flask 프레임워크를 로드
from flask import Flask, render_template

## Flask class 생성
## Flask({파일의 이름})
## __name__ : 현재 파일의 이름
app = Flask(__name__)

# 웹서버의 주소는 localhost:8080
## 이 자리에 API 목록 생성

## @의 의미는? 네비게이터 함수로 연결을 시켜주는 역할이다.
## 뭐랑 연결하냐고? 네비게이터 바로 아래 함수랑 연결
## @app.route('/')의 의미는 웹으로 localhost:8080/이라고 요청이 들어올 경우 바로 아래 함수 실행
@app.route('/')
def index():
    #return "HELLO WORLD" # 데이터를 보내준거임.
    return render_template('index.html')
## localhost:3000/second 요청시
## 아래의 함수를 호출
@app.route("/second")
def second():
    return "Second Page"

## class 내부의 함수 run() 호출 : 웹서버를 오픈 = 식당을 만들었대
app.run(port=8080)
