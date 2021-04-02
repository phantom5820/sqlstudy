select * from SCOTT7.phonebook;
update SCOTT7.phonebook set name = '트럼프' where name like '동동이';

select 20*10 from dual;
select 'ABCD' from scott7.phonebook;

select * from scott7.t_emp;

select empno,ename from scott7.t_emp;

select name from SCOTT7.t_professor;

select name, '교수님 안녕하세요' from SCOTT7.t_professor;

select studno, name from SCOTT7.t_student;
select studno 학번, name 이름 from SCOTT7.t_student;

select studno "학생 번호", name as 이름 from SCOTT7.t_student;
select empno 사원번호, ename  사원명, job 직업 from SCOTT7.t_emp;

select deptno "부서#", dname 부서명, loc 위치 from SCOTT7.t_dept;

select DISTINCT deptno from scott7.t_emp;

select * from SCOTT7.t_student;
select distinct deptno1, name from SCOTT7.t_student;
select * from scott7.t_emp;
select DISTINCT job from scott7.t_emp;

select name, position from scott7.t_professor;
select name || '-' || position 교수님목록 from scott7.t_professor;

select * from SCOTT7.t_student;


select name || '의 키는' || height || 'cm, ' || '몸무게는' || weight || 'kg 입니다.' "학생의 키와 몸무게" from SCOTT7.t_student; 

select * from scott7.t_emp;

select ename, sal, sal * 1.025 "급여 2.5% 인상분" from scott7.t_emp;
select ename, sal, sal * 1.025 "급여 2.5% 인상분" from scott7.t_emp;

select * from scott7.t_emp;

select sal 급여, comm 교통비, sal + comm "급여 + 교통비" from SCOTT7.t_emp;

select * from scott7.t_emp;

select empno 사번, ename 이름, job 직책, mgr, hiredate, sal 급여, comm, deptno from scott7.t_emp where job = 'salesman';
select * from scott7.t_emp where job = 'SALESMAN';

select ename 이름, sal 급여, deptno 부서번호 from SCOTT7.t_emp where deptno = 10;
select ename 이름, sal 급여 from scott7.t_emp where sal > 2000;
select ename 이름, empno 사번, sal 급여 from scott7.t_emp where ename like 'SCOTT';

select * from SCOTT7.t_student;
select name, grade from scott7.t_student where grade = 2 or grade =3;
select name, grade from scott7.t_student where grade in (2,3);
select name, grade from scott7.t_student where grade not in (1,4);
select name, grade from SCOTT7.t_student where grade > 1 and grade <4;

select ename from scott7.t_emp;
select * from SCOTT7.t_emp where ename like '%S';

select name from SCOTT7.t_professor where name like '김%';

select ename from SCOTT7.t_emp where ename like '%NE%';

select ename from scott7.t_emp where ename like '_A%';

select * from SCOTT7.t_professor;

select name, position from SCOTT7.t_professor where bonus is not null;

select ename from SCOTT7.t_emp where ename like '%L%' order by ename DESC; 

select * from SCOTT7.t_emp;
select ename, job, sal from scott7.t_emp order by job desc, sal asc;

select * from scott7.t_student;
select name, birthday, height, weight from SCOTT7.t_student where grade = 1 order by birthday;
select name 이름, height 키 from SCOTT7.t_student order by name;
select * from scott7.t_emp2;
select name, birthday from s
cott7.t_emp2 where birthday like '8%' order by birthday;

select * from scott7.t_student;
select name, grade, height from scott7.t_student order by grade, height desc;

select * from SCOTT7.t_student where height >= 180;
select name, weight from SCOTT7.t_student where weight between 60 and 80;
select * from SCOTT7.t_student where deptno1 in (101,201);
select * from SCOTT7.t_student where name like '김%';

select name, grade, height from SCOTT7.t_student where grade = 4 and height > 170;
select name, height, grade, weight from SCOTT7.t_student where grade = 1 or weight >= 80;
select name, grade, height, weight from scott7.t_student where grade = 2 and height > 180 and weight > 70;
select * from scott7.t_emp;
select ename, hiredate from scott7.t_emp where hiredate < '92-01-01';

select * from scott7.t_student;
select name, birthday, height, weight from scott7.t_student where grade = 1 order by birthday;
select name 이름, height 키 from SCOTT7.t_student order by name; 
select * from scott7.t_emp2;

select * from SCOTT7.t_student;
select * from SCOTT7.t_student where height >= 180;
select name, weight from SCOTT7.t_student where weight between 60 and 80;
select * from SCOTT7.t_student where deptno1 in (101,201);
select * from SCOTT7.t_student where name like '김%';

select name, grade, height from SCOTT7.t_student where height >= 170;
select name, height, grade, weight from SCOTT7.t_student where grade = 1 or weight >= 80;
select name, grade, height, weight from SCOTT7.t_student where grade = 2 and height > 180 and weight > 70;
-- ???--
select name, grade, height, weight from SCOTT7.t_student where grade = 2 and height > 180 or weight > 70;

select * from SCOTT7.t_emp;
select ename, hiredate from SCOTT7.t_emp where hiredate < '92-01-01';

select * from SCOTT7.t_student;
select name, birthday, height, weight from SCOTT7.t_student where grade = 1 order by birthday;
select name 이름, height 키 from SCOTT7.t_student where grade = 1 order by name;
select * from scott7.t_emp2;
select name, birthday from scott7.t_emp2 where birthday between '80-01-01' and '90-01-01';


--(1) INITCAP 함수 : 첫글자만 대문자로 변환하여 출력
select INITCAP('we are the champion')from dual;
select * from SCOTT7.t_student;
select id,INITCAP(id) from SCOTT7.t_student where deptno1 = 201;

--(2) lower, upper
select name 이름, id, lower(id) 소문자, upper(id) 대문자 from SCOTT7.t_student where deptno1 = 201;

select name 이름, id, length(id) 글자수 from SCOTT7.t_student where length(id) >= 9; 

select name 이름, length(name) 길이, lengthb(name) "바이트 수" from SCOTT7.t_student where deptno1 = 201;
select ename 이름, length(ename) 길이, lengthb(ename) "바이트 수" from scott7.t_emp where comm is not null;

select * from SCOTT7.t_professor;
select concat(name,position) 교수님명단 from SCOTT7.t_professor where deptno = 101;
select name || position 교수님명단 from SCOTT7.t_professor where deptno = 101;

select SUBSTR('ABCDEF',-3,3) from dual;
select SUBSTR('ABCDEFG',3,10) from dual;
select SUBSTR('ABCDEFG',20,3) from dual;
select SUBSTR('ABCDEFG',-2,3) from dual;
select * from SCOTT7.t_student;
select name, substr(jumin,1,6) 생년월일 from SCOTT7.t_student where deptno1 = 101;

--t_student 테이블 : jumin 칼럼을 사용해서  태어난 달이 8월인 사람의 이름과 생년월일을 출력하세요
select name, substr(jumin,1,6) 생년월일 from scott7.t_student where substr(jumin,4,1) = 8;
select name, substr(jumin,1,6) 생년월일 from scott7.t_student where substr(jumin,3,2) = '08';
select name, substr(jumin,1,6) 생년월일 from scott7.t_student where jumin like '__08%';

--문제 #4109) t_student 테이블 : 4학년 학생들중 ‘여학생’ 들의 이름과 주민번호 출력

select name, substr(jumin,1,13) 주민번호, grade from scott7.t_student where grade = 4 and substr(jumin,7,1) = 2;

-- INSTR()함수
select INSTR('A*B*C*','*',1,1) from dual;
select INSTR('A*B*C*','*',1,2) from dual;
select INSTR('A*B*C*','*',3,2) from dual;
select INSTR('A*B*C*','*',-4,1) from dual;
select INSTR('A*B*C*','*',-2,2) from dual;

--#4110) t_student 테이블 : tel 칼럼을 사용하여 101번 학과(deptno1) 의 학생의 이름과 전화번호, ‘)’ 가 나오는 위치 출력  
select name, tel, instr(tel,')',2,1) 위치 from SCOTT7.t_student where deptno1 = 101;
--#4111) t_student 테이블 : 1전공이 101 인 학생의 이름과 전화번호, 지역번호를 출력하세요. 지역번호는 숫자만!
select * from SCOTT7.t_student;
select name, tel, substr(tel,1,instr(tel,')')-1) from SCOTT7.t_student where deptno1 = 101;

select lpad('abcd',10,'#-') LAPD, rpad('abcd',10,'#-') from dual;
--#4112) t_student 테이블 : 1전공이 101번인 학생들의 id를 총 10자리로 출력하고 왼쪽 빈자리는 ‘$’ 기호로 채우세요 
select id, lpad(id,10,'$'), length(lpad(id,10,'$')) 길이  from SCOTT7.t_student;

--#4113) t_dept2 테이블 :  부서명 (dname) 을 다음과 같이 결과가 나오도록 쿼리 작성 총 10글자로 출력하되, 좌측 빈자리는 숫자로 채우기
select * from scott7.t_dept2;
select lpad(dname,10,'1234') lpad연습, length(lpad(dname,10,'1234')) 길이 from scott7.t_dept2;
--#4114) Student 테이블에서 다음과 같이 id를 12자리로 출력하되 오른쪽 빈자리에는 ‘*’ 로 채우세요
select * from scott7.t_student;
select rpad(id,12,'*') rpad연습 from scott7.t_student;
--#4115) t_dept2 테이블을 사용하여 부서명(dname)을 다음과 같이 결과가 나오도록 쿼리를 작성하세요 
select rpad(dname,10,'1234567890') rpad연습 from scott7.t_dept2; 

select LTRIM('슈퍼슈퍼슈가맨', '슈퍼') ltrim,
Ltrim('       좌측공백제거', ' ') ltrim,
rtrim('우측공백제거                          ', ' ') rtrim from dual;

--#4116) t_dept2 테이블에서 부서명(dname) 을 출력하되 왼쪽에 ‘영’ 이란 글자를 모두 제거하고 출력하세요. 
SELECT * FROM SCOTT7.T_DEPT2;
SELECT LTRIM(DNAME,'영') LTRIM FROM SCOTT7.T_DEPT2;

--#4117) T_dept2 테이블에서 부서명(dname) 을 출력하되 오른쪽 끝에 ‘부’ 라는 글자는 제거하고 출력하세요.
SELECT * FROM SCOTT7.T_DEPT2;
SELECT RTRIM(DNAME,'부') RTRIM FROM SCOTT7.T_DEPT2;
SELECT REPLACE('슈퍼맨 슈퍼걸', '슈퍼', '파워') REPLACE예제 FROM dual;

--#4118) t_student 테이블에서 102번 학과(deptno1) 의 학생들의 이름을 출력하되 성 부분은 ‘#’  으로 표시되게 출력하세요 
select * from scott7.t_student;
SELECT name, replace(name, substr(name,1,1),'#') 성 from scott7.t_student where deptno1 = 102;

--#4119) t_student 테이블에서 101번 학과(deptno1) 의 학생들의 이름을 출력하되 가운데 글자만 ‘#’  으로 표시되게 출력하세요
select replace(name, substr(name,2,1),'#') from scott7.t_student where deptno1 = 101;
--#4120) t_student 테이블에서 1전공(deptno1) 이 101번인 학생들의 이름과 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘*’ 로 표시되게 출력
select name, replace(jumin,substr(jumin,7,7),'*******') 주민번호 from scott7.t_student where deptno1 = 101;
--#4121) Student 테이블에서 다음 과 같이 1전공(deptno1) 이 102번인 학생들의 이름(name) 과 전화번호(tel), 전화번호에서 국번 부분만 ‘#’ 처리하여 출력하세요. 단 모든 국번은 3자리로 간주합니다.
select name, tel, replace(tel, substr(tel,instr(tel,')')+1,3),'###') 전화번호 from SCOTT7.t_student where deptno1 = 101;


select * from SCOTT7.t_professor;
select name, pay, bonus, pay + bonus from SCOTT7.t_professor;

--#4201) Professor 테이블 : 101번 학과 교수들의 이름(name), 급여(pay), 보너스(bonus ), 연봉(pay) 출력하기.  연봉은 pay * 12 + bonus 로 계산,  bonus 가 없는 교수는 0 으로 계산
select * from SCOTT7.t_professor;
select name 이름, pay 급여, nvl(bonus,0) 보너스, pay *12 + nvl(bonus, 0) 연봉 from SCOTT7.t_professor where deptno = 101;
--#4202) professor 테이블 :  101번 학과 교수의 이름과 pay, bonus, 연봉 출력,  
연봉은 pay*12 + bonus 로 계산, bonus 가 없으면 급여를 0 으로 처리 (nvl2 사용)
select name 이름, pay 급여, nvl(bonus,0) 보너스, nvl2(bonus, pay *12 + bonus, pay * 12) 연봉 from SCOTT7.t_professor where deptno = 101;
select 1 + '1' from dual;
