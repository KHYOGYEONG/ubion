use ubion10;
select * from emp where SAL >= 2000;

# 월급이 1500 이상이고 3000 이하인 사원의 정보를 출력
select * from emp where SAL >= 1500 and SAL <= 3000;
# 위 문제를 between 사용해서 풀기
select * from emp where SAL between 1500 and 3000;

# job 컬럼의 데이터가 'salesman', 'manager'인 사원 정보 출력
select * from emp where job = 'salesman' or job = 'manager';

#위 문제 다르게 풀기 (in 사용)
select * from emp where job in('salesman','manager');

# job이 salesman, manager가 아닌 사원의 정보 출력 (!=와 and, not in 사용)
select * from emp where job !='salesman' and job != 'manager';
select * from emp where job not in ('salesman','manager');
 
 # 사원의 이름에서 S로 시작하는 사원 정보 출력( like "%"를 사용)
 select * from emp where ENAME like "s%";
 
 # 그룹화
 # job을 기준으로 그룹화, SAL 평균 (컬럼 자리에 써주면 됨!!)
 select job, avg(sal) as mean from emp
 group by job;
 
 
