select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101;

select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;

--집합 연산자(Set Operator)
--집합 연산자는 여러 개의 질의의 결과를 연결하여 하나로 결합하는 방식을 사용한다. 
--집합 연산자 는 2개 이상의 질의 결과를 하나의 결과로 만들어 준다. 

--집합연산자 종류
--UNION(중복값 제거, 정렬수행) : 여러개의 SQL문 결과에 대한 ★합집합★으로 결과에서 중복된 행은 하나의 행으로 만듬
--UNION ALL(중복값 제거 안함, 정렬수행 안함) :  
--INTERSECT(정렬수행) : SQL문의 결과에 대한 ★교집합★ 중복된 행은 하나의 행으로 만듬
--EXCEPT 또는 MINUS : SQL문의 결과에서 뒤의 SQL문의 결과에 대한 ★차집합★, 중복된 행은 하나의 행으로 만듬
--(일부 DB는 MINUS를 사용한다) (정렬 수행, 쿼리순서 중요)



--예제 #3201) UNION 을 사용
--t_student 테이블과 t_professor 101번 학과(deptno1) 에 소속되어 있는학생과 교수들의 교수번호, 이름 학과번호 출력
--union으로 합친것
select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101
UNION
select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;
--union all로 합친것
select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101
UNION all
select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;
-- 위 결과는 정렬없이 각각의 쿼리 결과를 그대로 합하여 출력함

--#3202)  UNION 을 사용하여
--t_student 에서 제1전공(deptno1)이 101번학과인 학생과 제2전공(deptno2)이 201번 학과를 전공하는 학생들의 이름을 모두 출력
--UNION 처리
select name
from SCOTT7.t_student
where deptno1 = 101
union
select name
from SCOTT7.t_student
where deptno2 = 201;
--UNION ALL처리
select name
from SCOTT7.t_student
where deptno1 = 101
union all
select name
from SCOTT7.t_student
where deptno2 = 201;

--#3202)  INTERSECT 을 사용
-- t_student 에서 제1전공(deptno1)이 101번, 그리고 제2전공(deptno2)이 201번 을 복수 전공하는 학생들의 이름을 모두 출력
select name
from SCOTT7.t_student
where deptno1 = 101
INTERSECT
select name
from SCOTT7.t_student
where deptno2 = 201;


--#3203) MINUS 사용 ★오라클에서는 MINUS연산자를 사용★ excpt는 MYSQL 기능은 동일
--t_professor 교수님들의
--급여를 20% 인상하기 위한 명단(이름, 직급)을 출력
--단, 직급인 전임강사인 사람은 제외

select * from SCOTT7.t_professor;
select name, position
from SCOTT7.t_professor
minus
select name, position
from SCOTT7.t_professor
where position = '전임강사';
