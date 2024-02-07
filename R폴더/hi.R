#매개변수가 존재하지 않는 함수를 생성
func_1 <- function(){
  print('Hello R') 
}
#생성된 함수를 호출
func_1()
func_2 <- function(){
  return("Hello R") #파이썬에서는 return이 값을 돌려주는 명령(print는 안됨됨)
}
func_2()
result1 <- func_1()
result2 <- func_2()

# 매개변수 존재하는 함수 생성
# 일반 변수와 차이를 두기위해 앞에 inpu_t을을 입력한다.
# 함수 안에서 입력 값으로 쓰인 걸 표시하기 위함임.
func_3 <- function(input_x, input_y){
  result = input_x + input_y
  print(result) #지역 변수이기 떄문에 함수 안에서 호출(밖에서는 안됨)
}
result3 = func_3(10, 3)

# 변수의 종류 (전역/ 지역)
# 전역 변수 
#  함수 내부나 외부 모든 영역에서 사용이 가능한 변수(오브젝트뷰에 Values로 표시됨)
# 지역 변수
#  함수 내부에서 생선된 변수들은 함수 내부에서만 사용이 가능
#  함수의 외부에서 지역 변수를 호출하면 호풀이 되지 않는다.
#  휘발성 변수라고 부르기도 한다.
#  지역변수를 만든 이유는 저장이 되지 않는 특징 -> 메모리(공간)의 효율성때문

# 매개변수
#  함수를 생성할 때 인자 값(입력값)이 저장되는 공간
#  지역변수와 마찬가지로 함수 내부에서만 사용이 가능


# 매개변수의 개수와 인자의 개수를 다르게 호출하는 경우
func_3(10) # 2개를 넣어야 하는데 1개를 넣은 경우 >> 에러 발생
func_3(10,3,2) # 2개를 넣어야 하는데 3개를 넣은 경우 >> 에러 발생

# 인자의 개수가 가변인 경우의 함수를 생성
# 인자의 개수 상관없이 넣을 수 있음(...)
func_4 <- function(...){
  print(c(...))
}

func_4() # 입력값이 없는 경우도 허용용
func_4(1,2,3,4)

# 함수를 이용해서 커스텀 연산자(%s%) 생성
# 연산자로 변수를 만들면 출력(호출)할때 다름
"%s%" <- function(input_x, input_y){
  result <- input_x ^ input_y
  return(result)
}

10 %s% 5 

# 매개변수에 기본값을 설정하여 함수를 생성
func_5 <- function(input_x, input_y = 2, input_z = 3){
  result <- input_x + input_y - input_z
  return(result)
}
func_5(5, 10, 3) #설정한 기본값말고 다른 변수를 집어넣어도 출력
func_5(5)        #입력을 안하면 기본에 설정한 값과 계산되어 출력

func_5(10,input_z = 1) #y는 그대로쓰고 z를 바꿔서 쓰는 경우


# 매개변수가 2개인 함수를 생성
# 매개변수 사이의 값들을 모두 합계를 구해주는 함수 생성
func_6 <- function(start, end){
  # start부터 end까지의 합
  # 1단계 : 누적합을 할 수 있는 데이터 공간 생성(변수 생성)
  result = 0
  # 2단계 : start부터 end까지 반복을 하는 반복문 생성
  for(i in start:end){
    # i에 대입 되는 데이터는 -> 벡터 데이터 각 원소가 하나씩 대입, 반복, 실행
    # 대입하여 반복 실행
    # 3단계 : reult에 누적합을 실행
    result = result+ i
  }
  return(result)
}
func_6(1,10)


max(10, 3, 6,11, 8)

min(5, 3, 8, 1, 10) 
# 인자의 갯수는 상관이 없음. (...)으로 가능~
# 인자들 끼리 비교해서 작은 인자를 추출하는 원리
  #구조는 첫번째 값을 val로 지정, 나머지는 (...)로 설정해서 비교

#최솟값을 구하는 구조조
# 함수를 생성
# 매개변수는 2개를 생성
# 첫번째 매개변수는 데이터 하나를 저장
# 두번째 매개변수는 인자의 개수가 가변인 경우
func_8 <- function(val, ...){
  # 최소값을 돠돌려주는 함수
  result <- val
  # result와 두번째 입력 값을 비교하여 작은 값을 result에 담는다.(이걸 반복실행)
  # 비교연산자 사용
  # if문을 해당하는 갯수만큼 반복하면 됨.
  for( i in c(...)){
    if(result > i){
    result <- i
  }
  } 
return(result)  
  
}
func_8(10,5,6,8)
func_8(3,4)


mean(1:10) #백터가 인수인 경우
# 평균을 구하는 함수 생성
# 매개변수가 가변인 함수 생성
# 인자 값들을 모두 더한다.(반복문 사용)
# 합계라는 초기 데이터를 생성하여 0을 대입입
# 인자들을 백터 데이터로 변환
# 반복문을 이용해서 모든 데이터 누적합해줌.
# 합계에 인자의 개수로 나눠준다.
# 결과를 되돌려준다.

func_9 <- function(...){
  result = 0
  cnt =0
  for(i in c(...)){
    result = result+ i
    cnt = cnt + 1
  }
  print(result) 
  print(cnt)
  mean_f = result / cnt
  print(mean_f)
}
func_9(1,2,3,4,5,6,7,8,9,10)

sum(5,3,2)
length(c(3,2,1))
#위 문제를 함수로 사용해서 푸는 경우
func_10 <- function(...){
  result = sum(...) / length(c(...))
  return(result)
}
func_10(5,3,1)

sum()

#sum함수 구조보기
test_sum <- function(...){
  result=0
  for(i in c(...)){
    result = result + i
  }
  return(result)
}
test_sum(5,3,1)

#len함수 구조보기(인자가 꼭 입력이 되어야함.)
test_len <- function(value){
  cnt = 0
  for(i in value){
    cnt = cnt + 1
  }
  return(cnt)
}
test_len(c(1,5,3))
test_len()

## 데이터프레임 생성
## 벡터데이터를 이용하여 데이터프레임 생성
## 벡터 데이터 c와 name, grade와 같은 인덱스를 지정한 걸 표로 만들어줌
name<-c('A', 'B', 'C', 'D', 'E')
grade<- c(1,3,2,2,1)
data.frame(name,grade)->student #변수에 넣어줘야 저장됨

## 행렬 생성
## cbind() : 열을 추가하는 함수
midturm <- c(70,80,75,60,90)
final<-c(80,90,70,75,85)

cbind(midturm, final)->score

## 행렬과 데이터프레임을 결합
## 인덱스의 갯수가 같아야함 무조건~
data.frame(student,score)
cbind(student,score)

## 벡터데이터를 생성
gender = c('M','F', 'F', 'M', 'F')

## 데이터프레임과 벡터 데이터와 행렬을 결합
data.frame(student, gender, score)

cbind(student, gender, score) -> students


#길이가 다른 벡터 데이터를 결합 >> 에러 발생
test_vec = c(1,2,3,4)

cbind(students, test_vec)
data.frame(students, test_vec)

# 파생변수를 생성 (컬럼을 추가하겠다는 의미, ex_등급을 나눠줌)
# 데이터프레임에서 새로운 컬럼을 추가하는 작업
# 기존에 있는 데이터에서 분석에서 사용할 데이터가 존재하지 않을때
# 데이터들을 가공하여 새로운 데이터를 생성

students
# 기존에 생성했던 벡터데이터들의 합
midturm + final

# 데이터프레임에서 특정 컬럼을 선택하여 합한다.(두 가지 방법($, [[]])
students$midturm + studentsstudents[['final']] -> total

# cbind(), data.frame() 함수를 이용하여 파생변수 생성
cbind(students, total)
data.frame(students, total)

#위 방법아니면 아래 방법으로 결합해줘도 됨
students$total <- students$midturm + students$final
students


### students에 파생변수를 생성
### 평균성적을 생성
### 컬럼의 이름은 mean이라고 지정

students$total / 2 -> students$mean 
#다른 방법은 data.frame(students, mean) 또는 cbind(students, mean) 사용
students

# 나눠주는 방법 두가지
students$total /2
students$total / c(2,2,2,2,2)

#####위 여기까지 인덱스를 추가하는 방법#####

# 새로운 학생 정보를 추가(=행을 추가하는 방법)
# 같은 형식을 가지고 있는 데이터로 구성해서 추가해야함.
new_student <- data.frame(name='F', grade=1, gender='M', midturm=80,final=70,total=150,mean=75)

#데이터프레임 행을 추가
rbind(students, new_student)
#data.frame() 함수는 행 추가가 안된다.XXXXXXX
data.frame(students, new_student)

#데이터 순서가 바뀌었을 경우 >> 상관없다.
new_student2<-data.frame(name='G',gender='M', grade=1, midturm=80,final=70,total=150,mean=75)
rbind(students, new_student2)


# 리스트형태 데이터 
#data.frame은 데이터 정제할때 사용하고 누군가에게 보낼때는 list로 사용!!!!
#data.frame은 무거워서 List를 사용해서 저장함!!!
list_a = list(name = 'test', age = 20)
list_a$loc = 'seoul' #loc라는 키에 seoul이라는 value 리스트를 추가해줌
list_a

## 리스트 데이터에서 value가 벡터 데이터인 경우
list_b = list(
  name = c('test', 'test2'),
  age = c(20,30)
)
list_b

## 리스트 2차원 데이터에서 'test' 문자열 추출하려면
## 리스트에서 Key값을 이용하여 데이터를 추출
list_b$name[1]
list_b['name']
list_b[['name']][1] # 괄호 두번쓰면 벡터데이터로 변경

### 필터 
### 특정한 데이터만 보고싶을때 사용
### 필터하고 싶을때 : 데이터프레임명[행의 조건, 열의 조건]
students[1,]
students[c(1,3),] #1번과 3번 행을 보고싶을때

## 학년이 1학년인 학생의 정보만 출력
students$grade

students$grade == 1 #학년이 1학년인 데이터를 보여달라는 조건으로 TRUE/FALSE로 표시

students$grade == 1 -> flag #인덱스가 1인걸 보여달라는 조건
students[flag,] #이걸 students에 넣으면 학년이 1인 데이터만 보겠다는 말
                #학년이 1이 아닌 데이터를 삭제하겠다는 말과 같음
!flag
students[!flag,]


## 행과 열의 조건식으로 모두 이용하여 데이터 추출
## 여학생들의 중간, 기말 성적만 추출
## 여학생 -> 인덱스 조건식
## 중간, 기말 성적 -> 컬럼 조건식

students$gender == 'F' -> flag2 #인덱스 조건식
students[flag2, c('midturm', 'final') ]  #컬럼 조건식


## 전체 학생중 중간 성적이 80점 이상이고 기말 성적이 80이상인 학생 출력

students$midturm >= 80 & students$final >= 80 -> flag3

students[flag3 , ]

# 다른 방법 : 조건식 1개당 하나의 변수 사용

students$midturm >= 80 -> AAA
students$final >= 80 -> BBB

students[AAA& BBB, ] #[index자리, column자리]

## 데이터의 순서를 변경하는 함수
#index의 순서 변경
students[c(3,2,1,5,4),] #내가 지정한 대로 바꾸는 방법

## 컬럼의 순서를 변경(벡터에서 바꿔서 써주면 됨됨)

student[c('grade', 'name')] #뒤에 콤마를 안쓰는 경우, 컬럼의 조건으로 들어감

# 학년을 기준으로 오름차순 정렬(낮은게 첫번째 순서)
## order() : 벡터데이터의 데이터들을 오름차순 정렬 위치 출력
students
order(students$grade) -> flag5 #위치를 보여줌, 얘를 필터에 넣어주면 끝
students[flag5,]


# 기말 성적을 기준으로 해서 내림차순 정렬
## order()함수에서 특정 매개변수의 인자 값을 TRUE로 변경하면 내림차순 정렬됨
## decreasing = TRUE를 사용
order(students$final, decreasing = TRUE)

# 다른 방법
order(-students$final) -> flag6 #숫자 데이터일때만 가능하기 때문에 잘안쓴다.

order(students$name, decreasing = TRUE) #문자 데이터 내림차순한 경우

students[flag6,]


# 외부 패키지 설치치
install.packages('dplyr')

# 패키지 로드
library(dplyr)

# 컬럼의 이름을 변경
# 외부 데이터를 가져올 경우, 컬럼의 이름이 바뀌어서 들어오는 경우 때문에 사용
# 코드북을 보고 실제 데이터 이름을 알 수 있음
# rename(데이터프레임명, 새로운 컬럼의 이름 = 변경할 컬럼의 이름)
students
rename(students, mean_score = mean) # 여기서 끝나면 바뀐게 아님. students에 대입해야함.
rename(students, mean_score = mean) -> students

## ifelse(조건식, 참인 경우 출력값, 거짓인 경우 출력값) 



## 조건식을 이용하여 파생변수 생성

ifelse(
  students$mean_score >= 75,
  'pass',
  'fail'
) -> res

students$result <- res #result라는 컬럼으로 res변수를 넣겠다
students

## 75점 초과인 경우 pass
## 75점인 경우 hold
## 75점 미만인 경우는 fail

ifelse(
  students$mean_score > 75,
  'pass',
  
  ifelse(students$mean_score == 75,
         'hold',
         'fail'
)
)




