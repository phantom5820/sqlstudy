--직원(t_emp) 의 이름, 직책(job), 급여를 select 하되 직책(job)은 내림차순으로 급여(sal)은 오름차순으로 select하기
select * from scott7.t_emp;
select ename, job, sal from scott7.t_emp order by job desc, sal asc;
select name, tel, substr(tel,1,instr(tel,')',1,1) -1) 지역번호 from SCOTT7.t_student where deptno1 = 101;
select name 이름, pay 급여, nvl(bonus,0) 보너스, pay *12 + nvl(bonus, 0) 연봉 from SCOTT7.t_professor where deptno = 101;


select sysdate, to_char(sysdate, 'yyyy') from dual;
select sysdate, to_char(sysdate, 'rrrr') from dual;
select sysdate, to_char(sysdate, 'yy') from dual;
select sysdate, to_char(sysdate, 'year') from dual;

select to_char(SYSDATE, 'mm') from dual;
select to_char(SYSDATE, 'mon') from dual;
select to_char(SYSDATE, 'month') from dual;
select to_char(SYSDATE, 'mon', 'NLS_DATE_LANGUAGE=ENGLISH') from dual;
select to_char(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH') from dual;
select to_char(SYSDATE, 'month', 'NLS_DATE_LANGUAGE=ENGLISH') from dual;
select to_char(SYSDATE, 'Month', 'NLS_DATE_LANGUAGE=ENGLISH') from dual;

select to_char(sysdate, 'DD') from dual;
select to_char(sysdate, 'DDTH') from dual;
select to_char(sysdate, 'DAY') from dual;
select to_char(sysdate, 'DY') from dual;

select to_char(sysdate, 'HH24') from dual;
select to_char(sysdate, 'HH') from dual;
select to_char(sysdate, 'MI') from dual;
select to_char(sysdate, 'ss') from dual;

--#4301)  다음과 같은 형식으로 현재시간을 출력해보세요
select sysdate, to_char(sysdate, 'rrrr-mm-dd hh24:mi:ss') 날짜 from dual;
select sysdate, to_char(sysdate, 'hh24:mi:ss rrrr-mm-dd') 날짜 from dual;
--신용카드 포멧
select sysdate, to_char(sysdate, 'mm/yy') from dual;
--2019년07월16일 21시22분34초
select sysdate, to_char(sysdate, 'YYYY"년"MM"월"DD"일" HH24"시"MI"분"SS"초"') 날짜 from dual;

SELECT * FROM SCOTT7.t_student;
SELECT NAME, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') 생일 FROM SCOTT7.t_student WHERE TO_CHAR(birthday, 'MM') = 03;

SELECT TO_CHAR(1234, '99999') FROM DUAL;
SELECT TO_CHAR(1234, '099999') FROM DUAL;
SELECT TO_CHAR(1234, '$9999') FROM DUAL;
SELECT TO_CHAR(1234.1234, '9999.99') FROM DUAL;
SELECT TO_CHAR(1234, '99,999') FROM DUAL;
SELECT TO_CHAR(123456789, '999,999,999') FROM DUAL;

--#4303)  t_professor 테이블에서 101번 학과 교수들의 이름(name), 연봉(pay) 를 출력하세요,단, 연봉은 (pay * 12) + bonus로 계산하고 천단위 구분기호로 표시하세요.
SELECT * FROM SCOTT7.t_professor;
SELECT NAME, TO_CHAR((PAY * 12) + NVL(BONUS,0),'99,999') 연봉 FROM SCOTT7.t_professor WHERE DEPTNO = 101;

SELECT '123.44' 문자열, TO_NUMBER('123.44') 숫자변환 FROM DUAL;
SELECT TO_NUMBER('ABC') 숫자변환 FROM DUAL;

SELECT TO_DATE('2012-01-01', 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('04-24-1998', 'MM-DD-YYYY') FROM DUAL;

--#4304) t_professor 테이블에서 2000년 이전에 입사한 교수명과 입사일,
--          현재 연봉과 10% 인상 후 연봉을 아래와 같은 양식으로 출력하세요.
--          연봉은 보너스(bonus)를 제외한 pay * 12 로 계산하고 연봉과 인상후 연봉은 천단위 구분 기호를 추가하여 출력하세요

SELECT * FROM SCOTT7.t_professor;
SELECT NAME, HIREDATE 입사일, TO_CHAR((PAY * 12),'99,999') 현재연봉, TO_CHAR((PAY * 12) * 1.1,'99,999') 인상후 FROM SCOTT7.t_professor WHERE TO_CHAR(hiredate,'RRRR') < TO_NUMBER('2000');

SELECT SYSDATE 오늘, SYSDATE +1 "내일(24시간뒤)", SYSDATE -2 "그저께" FROM DUAL;
SELECT SYSDATE + 1/24 "한시간 뒤" FROM DUAL;

SELECT SYSDATE "오늘", SYSDATE - TO_DATE('2021-03-16') FROM DUAL;

SELECT MONTHS_BETWEEN('2012-03-01', '2012-01-01') FROM DUAL;
SELECT MONTHS_BETWEEN('2012-01-01', '2012-03-01') FROM DUAL;

SELECT MONTHS_BETWEEN('2012-02-29', '2012-02-01') "2월29일 - 2월 01일" FROM DUAL;

SELECT MONTHS_BETWEEN('2012-02-28', '2012-02-01') "2월28일 - 2월01일" FROM DUAL;

SELECT MONTHS_BETWEEN('2019-01-31', '2019-01-01') "1월31일 - 1월01일" FROM DUAL;

SELECT * FROM SCOTT7.t_professor;

-- #4501) t_professor 테이블에서 오늘(SYSDATE)을 기준으로 
--근속연수, 근속개월,  근속일를 계산해서 출력
--날짜양식은 YYYY-MM-DD 로,  근속개월, 근속일은 반올림 하여 소수점 1자리까지 표현
SELECT NAME 이름, TO_CHAR(SYSDATE,'YYYY-MM-DD') 오늘, TO_CHAR(HIREDATE,'YYYY-MM-DD') 입사일, TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(hiredate,'YYYY') 근속연수, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),1) 근속개월, ROUND(SYSDATE - hiredate,1) FROM SCOTT7.t_professor;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) "3개월 뒤" FROM DUAL;

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE 오늘, NEXT_DAY(SYSDATE, '월') FROM DUAL;

SELECT 'ROUND', ROUND(12.34) "12.34" FROM DUAL;
SELECT ROUND(12.536) "(12.536)" FROM DUAL;
SELECT ROUND(12.536, 2) FROM DUAL;
SELECT ROUND(16.345, -1) FROM DUAL;

SELECT 'TRUNC', TRUNC(12.345) FROM DUAL;
SELECT 'TRUNC', TRUNC(12.345,2) FROM DUAL;
SELECT 'TRUNC', TRUNC(12.345, -1) FROM DUAL;

SELECT 'CEIL', CEIL(4.5) FROM DUAL;
SELECT 'CEIL', CEIL(-3.2) FROM DUAL;

SELECT 'FLOOR', FLOOR(4.5) FROM DUAL;
SELECT 'FLOOR', FLOOR(-3.2) FROM DUAL;

SELECT '12.5', ROUND(12.5) ROUND, TRUNC(12.5) TRUNC, CEIL(12.5) CEIL, FLOOR(12.5) FLOOR FROM DUAL;
SELECT '-12.5', ROUND(-12.5) ROUND, TRUNC(-12.5) TRUNC, CEIL(-12.5) CEIL, FLOOR(-12.5) FLOOR FROM DUAL;

SELECT 'MOD', MOD(12, 10) FROM DUAL;
SELECT 'MOD', MOD(42, 13) FROM DUAL;
SELECT 'MOD', MOD(12.6, 4.1) FROM DUAL;

SELECT 'POWER', POWER(3,2) FROM DUAL;
SELECT 'POWER', POWER(-3,3) FROM DUAL;
--루트2
SELECT 'POWER', POWER(2, 1/2) "루트2" FROM DUAL;
SELECT 'POWER', POWER(27, 1/3) "27의 3제곱근" FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE) FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE) FROM DUAL;



--그룹함수
SELECT * FROM SCOTT7.t_professor;

SELECT COUNT(*), COUNT(HPAGE) FROM SCOTT7.t_professor;

SELECT SUM(PAY) FROM SCOTT7.t_professor;
SELECT SUM(BONUS) FROM SCOTT7.t_professor;
SELECT COUNT(BONUS), COUNT(PAY) FROM SCOTT7.t_professor;

SELECT AVG(PAY), AVG(BONUS) FROM SCOTT7.t_professor;

SELECT AVG(BONUS), AVG(NVL(BONUS,0)) FROM SCOTT7.t_professor;

--문제 T_PROFESSOR 테이블에서 '학과별로' 교수들의 평균 보너스를 출력하기
--SELECT DEPTNO, AVG(BONUS) FROM SCOTT7.t_professor;
SELECT DEPTNO, ROUND(AVG(NVL(BONUS,0)),1), COUNT(*) FROM SCOTT7.t_professor GROUP BY DEPTNO;

--문제 학생테이블에서 '학년별' 학생의 수
SELECT * FROM SCOTT7.t_student;
SELECT GRADE, DEPTNO1, COUNT(*) FROM SCOTT7.t_student GROUP BY GRADE, DEPTNO1 ORDER BY GRADE; 

--#5101) t_professor 테이블 : 학과별(deptno) 그리고 직급별(position)로 교수들의 평균 급여를 계산하여 출력하세요
SELECT DEPTNO, POSITION, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO, POSITION ORDER BY DEPTNO, POSITION;

--부서별 평균급여를 출력하되, 평균급여가 450 보다 많은 부서만 출력
SELECT * FROM SCOTT7.t_professor;
SELECT DEPTNO, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor WHERE AVG(PAY) > 450 GROUP BY DEPTNO;

SELECT DEPTNO, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO HAVING AVG(PAY) > 450;

--#5102) t_emp 테이블: 매니저별(MGR)로 관리하는 직원들의 ‘매니저’, ‘직원수’와 ‘급여총액’과 ‘급여평균’과 ‘교통비 (COMM) 평균’ 지급액 을 출력하세요.  단 사장님은 (job = president)제외 
SELECT * FROM SCOTT7.T_EMP;
SELECT MGR 매니저, COUNT(*) 직원수, SUM(SAL) 급여총액, ROUND(AVG(SAL),1) 급여평균, AVG(NVL(COMM,0)) 교통비평균 FROM SCOTT7.T_EMP WHERE JOB <> 'PRESIDENT' GROUP BY MGR;

--문제 #5103) t_professor 테이블 :  직위가 정교수 혹은 조교수 인 분들 중에서 ‘과별(deptno)’로  과번호, 소속교수 총수, 근속일 평균, 급여평균, 보너스 평균을 출력해보세요
SELECT * FROM SCOTT7.t_professor;
SELECT DEPTNO, COUNT(*) 총인원, ROUND(AVG(SYSDATE - HIREDATE),1) 근속일평균, AVG(PAY) 급여평균, AVG(NVL(BONUS,0)) 보너스평균 FROM SCOTT7.t_professor WHERE POSITION IN('정교수','조교수') GROUP BY DEPTNO ORDER BY DEPTNO ASC;

--#5104) t_student 테이블 : 학과별(deptno1) 로,  학과번호, 최대몸무게 - 최소몸무게 차이 값을 출력해보세요
SELECT * FROM SCOTT7.t_student;
SELECT DEPTNO1 학과, MAX(WEIGHT) 최대몸무게, MIN(WEIGHT) 최소몸무게, MAX(WEIGHT)-MIN(WEIGHT) 몸무게차 FROM SCOTT7.t_student GROUP BY DEPTNO1 HAVING MAX(WEIGHT)-MIN(WEIGHT) >= 30;


SELECT NAME, PROFNO FROM SCOTT7.t_student;
SELECT PROFNO, NAME FROM SCOTT7.t_professor;
SELECT * FROM SCOTT7.t_student, SCOTT7.t_professor;
SELECT SCOTT7.t_student.name, SCOTT7.t_professor.name FROM SCOTT7.t_student, SCOTT7.t_professor;

SELECT s.name, p.name FROM SCOTT7.t_student s, SCOTT7.t_professor p;

--학생의 이름과 그 학생의 담당교수 이름.
select s.name, p.name from SCOTT7.t_student s, SCOTT7.t_professor p where s.profno = p.profno; 

--#6101) t_student 테이블과 t_department 테이블을 사용하여 학생이름, 1전공 학과번호, 1전공 학과 이름을 출력하세요
select * from scott7.t_student s, scott7.t_department d;
select s.name 학생이름, s.deptno1 학과번호, d.dname 학과이름 from scott7.t_student s, scott7.t_department d where s.deptno1 = d.deptno;

select s.name 학생이름, s.deptno1 학과번호, d.dname 학과이름 from scott7.t_student s join scott7.t_department d on s.deptno1 = d.deptno;

--#6102) t_student 테이블, t_professor 테이블 을 join하여 ‘학생이름’, ‘지도교수 번호’, ‘지도교수이름’ 을 출력하세요
SELECT * FROM SCOTT7.t_student;
SELECT * FROM SCOTT7.t_department;
SELECT * FROM SCOTT7.t_professor;
select s.name 학생이름, s.profno "지도교수 번호", p.name 지도교수이름 from SCOTT7.t_student s join SCOTT7.t_professor p on s.profno = p.profno;
select s.name 학생이름, s.profno "지도교수 번호", p.name 지도교수이름 from SCOTT7.t_student s, SCOTT7.t_professor p where s.profno = p.profno;

--#6103) 
--t_student, t_department, t_professor 테이블 을 join 하여  학생의 이름, 학과이름, 지도교수 이름  을 출력하세요
--oracle join
select s.name 학생이름, d.dname 학과이름, p.name "지도교수 이름" 
from SCOTT7.t_student s, SCOTT7.t_department d, SCOTT7.t_professor p 
where s.deptno1 = d.deptno and s.profno= p.profno; 
--ANSI JOIN
select s.name 학생이름, d.dname 학과이름, p.name "지도교수 이름" 
from SCOTT7.t_student s 
join SCOTT7.t_department d on s.deptno1 = d.deptno
join SCOTT7.t_professor p on s.profno = p.profno;

--#6104) t_emp2 직원 테이블과 t_post 직급 테이블을 조회하여 사원의 이름과 직급, 현재연봉, 해당직급의 연봉의 하한금액(s_pay)과 상한금액(e_pay)을 출력하세요
select * from scott7.t_emp2;
select * from scott7.t_post;
--oracle join
select e.name 사원이름, e.post 직급, e.pay 현재연봉, p.s_pay 하한금액, p.e_pay 상한금액 
from scott7.t_emp2 e, scott7.t_post p
where e.post = p.post; 
--ansi join
select e.name 사원이름, e.post 직급, e.pay 현재연봉, p.s_pay 하한금액, p.e_pay 상한금액 
from scott7.t_emp2 e join scott7.t_post p
on e.post = p.post;

--#6105) t_student - t_professor 테이블 join 하여 제1전공(deptno1) 이 101번인 학생들의 학생이름과 지도교수 이름을 출력하세요
select * from scott7.t_professor;
--oracle join
select s.name 학생이름, p.name 지도교수이름
from SCOTT7.t_student s, scott7.t_professor p
where s.profno = p.profno 
and s.deptno1 = 101;
--ansi join
select s.name 학생이름, p.name 지도교수이름
from SCOTT7.t_student s join scott7.t_professor p
on s.profno = p.profno 
where s.deptno1 = 101;


SELECT NAME, PROFNO FROM SCOTT7.t_student; --20명
SELECT PROFNO, NAME FROM SCOTT7.t_professor;


-- #6201) t_customer 테이블, t_gift 테이블을 join 하여  고객의 마일리지 포인트별로 받을수 있는 상품을 조회하여 고객의 '이름(c_name)'과 포인트(c_point) 상품명(g_name)을 출력하세요
select * from SCOTT7.t_customer;
select * from scott7.t_gift;

--oracle join
select c.c_name, c.c_point, g.g_name
from scott7.t_customer c, scott7.t_gift g
where c.c_point between g.g_start and g.g_end;
--ansi join
select c.c_name 고객명, c.c_point 고객포인트, g.g_name 상품명  
from SCOTT7.t_customer c join scott7.t_gift g
on c.c_point between g.g_start and g.g_end;
 
--#6202) 앞 예제에서 조회한 상품의 이름(g_name)과 필요수량이 몇개인지 조회하세요
--oracle join
select g.g_name 상품명, count(*) 필요수량  
from SCOTT7.t_customer c, scott7.t_gift g
where c.c_point between g.g_start and g.g_end
group by g.g_name;
--ansi join
select g.g_name 상품명, count(*) 필요수량  
from SCOTT7.t_customer c join scott7.t_gift g
on c.c_point between g.g_start and g.g_end
group by g.g_name;


--#6203)  t_student 테이블과 t_exam01 시험성적 테이블, t_credit 학점 테이블을 조회하여  학생들의 이름과 점수와 학점을 출력하세요
select * from SCOTT7.t_student;
select * from SCOTT7.t_exam01;
select * from SCOTT7.t_credit;
--oracle join
select s.name 학생이름, e.total 점수, c.grade 학점
from SCOTT7.t_student s, SCOTT7.t_exam01 e, SCOTT7.t_credit c
where s.studno = e.studno and e.total between c.min_point and c.max_point;
--ansi join
select s.name 학생이름, e.total 점수, c.grade 학점
from SCOTT7.t_student s join SCOTT7.t_exam01 e 
on s.studno = e.studno join SCOTT7.t_credit c 
on e.total between c.min_point and c.max_point;

--#6204) t_customer 와 t_gift 테이블 join : 자기 포인트(c_point) 보다 낮은 포인트의 상품 중 한가지를 선택할수 있다고 할때 '산악용자전거'를 선택할 수 있는 고객명(c_name)과 포인트(c_point), 상품명(g_name)을 출력하세요
select * from SCOTT7.t_customer;
select * from scott7.t_gift;
select c.c_name 고객명, c.c_point 포인트, g.g_name 상품명
from SCOTT7.t_customer c, SCOTT7.t_gift g
where c.c_point >= g.g_start and g.g_name = '산악용자전거';

--oracle join
select c.c_name 고객명, c.c_point 포인트, g.g_name 상품명
from SCOTT7.t_customer c, SCOTT7.t_gift g
where c.c_point >= g.g_start and g.g_no = 5;
--ansi join
select c.c_name 고객명, c.c_point 포인트, g.g_name 상품명
from SCOTT7.t_customer c join SCOTT7.t_gift g
on c.c_point >= g.g_start where g.g_no = 5;

--#6205) t_emp2, t_post 테이블 사용하여
--사원들의 이름(name)과 나이, 현재직급(post),  ‘예상직급’을 출력하세요. 
--‘예상직급’은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다. 
--나이는 오늘(SYSDATE)을 기준으로 하되 소수점 이하는 절삭하여 계산하세요
select * from scott7.t_emp2;
select * from scott7.t_post;
--oracle join
select e.name 이름, to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1 "현재나이", nvl(e.post,' ') 현재직급, p.post "예상직급"
from scott7.t_emp2 e, scott7.t_post p
where (to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1) between p.s_age and p.e_age;
--ansi join
select e.name 이름, to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1 "현재나이", nvl(e.post,' ') 현재직급, p.post "예상직급"
from scott7.t_emp2 e join scott7.t_post p
on (to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1) between p.s_age and p.e_age;

----------------------------------------------------------------------------------
--#6206) t_student 테이블과 t_professor 테이블 Join 하여 학생이름과 지도교수 이름을 출력하세요. 단! 지도교수가 결정되지 않은 학생의 명단도 함께 출력하세요
--** 기존의 INNER Join 방식으로 먼저 만들어 보고 OUTER Join 을 해보고 비교해보자
select * from SCOTT7.t_student;
select * from SCOTT7.t_professor;
--oracle join
select s.name "학생이름", p.name "교수이름"
from SCOTT7.t_student s,SCOTT7.t_professor p
where s.profno = p.profno(+);
--ansi join
select s.name "학생이름", p.name "교수이름"
from SCOTT7.t_student s
left outer join SCOTT7.t_professor p
on s.profno = p.profno;

--#6207) t_student, t_professor 테이블 join :  학생이름과 지도교수 이름을 출력, 단! 지도 학생이 결정되지 않은 교수 명단도 출력
--oracle join
select s.name "학생이름", p.name "교수이름"
from SCOTT7.t_student s,SCOTT7.t_professor p
where s.profno(+) = p.profno;
--ansi join
select s.name "학생이름", p.name "교수이름"
from SCOTT7.t_student s
right outer join SCOTT7.t_professor p
on s.profno = p.profno;

--#6208) t_student, t_professor 테이블 join :  학생이름과 지도교수 이름을 출력, 단! 지도 학생이 결정되지 않은 교수 명단, 지도교수가 결정되지 않은 학생명단 모두 출력
select s.name "학생이름", p.name "교수이름"
from SCOTT7.t_student s
full outer join SCOTT7.t_professor p
on s.profno = p.profno;

--예제 #6209) t_dept2 테이블에서 부서명 과 그 부서의 상위부서명을 출력하세요
select * from SCOTT7.t_dept2 d1, SCOTT7.t_dept2 d2;
--oracle join
select d1.dname 부서명, d2.dname 상위부서명
from SCOTT7.t_dept2 d1, SCOTT7.t_dept2 d2
where d1.pdept = d2.dcode;
--ansi join
select d1.dname 부서명, d2.dname 상위부서명
from SCOTT7.t_dept2 d1 join SCOTT7.t_dept2 d2
on d1.pdept = d2.dcode;

--#6210) t_professor 테이블 : 교수번호, 교수이름, 입사일, 그리고 자신보다 입사일 빠른 사람의 인원수를 출력하세요, 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요
select * from scott7.t_professor;
select a.profno "교수번호", a.name "교수이름", to_char(a.hiredate, 'yyyy-mm-dd') "입사일", count(b.hiredate) "빠른사람"
from scott7.t_professor a left outer join scott7.t_professor b
on a.hiredate > b.hiredate group by a.profno, a.name, a.hiredate order by "빠른사람";

SELECT DEPTNO, POSITION, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO, POSITION ORDER BY DEPTNO, POSITION;

select * from scott7.t_emp;
--#7101) t_emp 테이블에서 scott 보다 급여를 많이 받는 사람의 이름과 급여 출력
select ename, sal from scott7.t_emp where sal > (select sal from scott7.t_emp where ename = 'SCOTT');

--#7102) t_student 테이블에서 가장 키 큰 학생의 '이름'과 '키'를 출력
select * from scott7.t_student;
--가장 키큰 학생의 키
select max(height) from scott7.t_student;
select name, height from scott7.t_student where height = (select max(height) from scott7.t_student);

--#7103) t_student, t_department 테이블 사용하여 이윤나 학생과 1전공이 동일한 학생들의 이름과 1전공 이름을 출력하세요
select * from scott7.t_student,scott7.t_department;

select deptno1 from scott7.t_student where name like '이윤나';

select s.name 학생이름, d.dname 제1전공 
from scott7.t_student s, scott7.t_department d
where s.deptno1 = d.deptno and s.deptno1 = (select deptno1 from scott7.t_student where name like '이윤나');

--#7104) t_professor, t_department 테이블 : 입사일이 송도권 교수보다 나중에 입사한 사람의 이름과 입사일, 
--학과명을 출력하세요

select * from scott7.t_professor;
select * from scott7.t_department;
select to_char(hiredate, 'yyyy-mm-dd') from scott7.t_professor where name like '송도권'; 

select p.name 교수명, to_char(p.hiredate,'yyyy-mm-dd') 입사일, d.dname
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno and p.hiredate > (select hiredate from scott7.t_professor where name like '송도권'); 


--#7105) t_student 테이블 : 1전공이 101번인 학과의 평균 몸무게보다 몸무게가 많은 학생들의 이름과 몸무게를 출력하세요
select * from scott7.t_student;

select avg(weight) from scott7.t_student where deptno1 = 101;

select name 이름, weight 몸무게 
from scott7.t_student
where weight > (select avg(weight) from scott7.t_student where deptno1 = 101);

--#7106) t_professor 테이블에서 ★심슨 교수와 같은 입사일★에 입사한 교수 중, 
--★조인형 교수보다 월급★을 적게 받는 교수의 이름과 급여, 입사일을 출력하세요
select * from scott7.t_professor;
--심슨교수 입사일
select hiredate from scott7.t_professor where name like '심슨';
--조인형 교수 월급
select pay from scott7.t_professor where name like '조인형';
select name 이름, pay 급여, to_char(hiredate,'yyyy-mm-dd') 입사일 
from scott7.t_professor
where hiredate = (select hiredate from scott7.t_professor where name like '심슨')
and
pay < (select pay from scott7.t_professor where name like '조인형');


--#7107) t_emp2, t_dept2 테이블 : 근무지역 (t_dept2.area) 이 서울 지사인 모든 사원들의 
--                               사번(empno)과 이름(name), 부서번호(deptno)를 출력하세요
select * from scott7.t_emp2;
select * from scott7.t_dept2;

select dcode from scott7.t_dept2 where area like '서울지사';

select empno, name, deptno 
from scott7.t_emp2
where deptno in(select dcode from scott7.t_dept2 where area like '서울지사');

--#7108) t_emp2 테이블 : 전체직원중 ★과장 직급의 최소연봉자★보다 연봉이 높은 사람의 
--                        이름(name)과 직급(post), 연봉(pay)을 출력하세요.  
--                        단, 연봉 출력 형식은 천 단위 구분 기호와 원 표시를 하세요
select * from scott7.t_emp2;
--과장직급의 최소연봉자
select pay from scott7.t_emp2 where post like '과장';
select name 이름, post 직급, TO_CHAR(pay, '999,999,999')|| '원' 연봉
from scott7.t_emp2
where pay >any (select pay from scott7.t_emp2 where post like '과장') order by pay desc;

--#7109) t_student 테이블 : 전체학생중에서 체중이 ★4학년 학생들의 체중★에서 
--                         가장 적게 나가는 학생 보다 몸무게가 적은 학생 의 이름과 학년과 몸무게를 출력하세요 <ALL

select * from SCOTT7.t_student;
--4학년 학생들의 체중★
select weight from scott7.t_student where grade = 4;

select name 이름, grade 학년, weight 몸무게
from SCOTT7.t_student
where weight <all (select weight from scott7.t_student where grade = 4);

---------------------------다중칼럼 Sub Query---------------------------
--#7201) t_student 테이블을 조회하여 각 ★학년별로 최대 키★를 가진 학생들의 
--        학년과 이름과 키를 출력하세요,학년 오름차순으로 출력

select * from SCOTT7.t_student;
--학년별 최대 키--
select grade, max(height) from SCOTT7.t_student group by grade;

select grade 학년, name 이름, height 키
from SCOTT7.t_student
where (grade, height) in(select grade, max(height) from SCOTT7.t_student group by grade) order by "학년";

--#7202) t_professor , t_department 테이블 :  
--각 ★학과별로 입사일이 가장 오래된 교수★의 교수번호와 이름, 학과명을 출력하세요.  
--단 학과이름 순으로 오름차순 정렬하세요
select * from scott7.t_professor;
select * from scott7.t_department;

select deptno, min(hiredate) from scott7.t_professor group by deptno; 
select p.profno 교수번호, p.name 교수이름, to_char(p.hiredate,'yyyy-mm-dd') 입사일, d.dname 학과명
from SCOTT7.t_professor p, SCOTT7.t_department d
where p.deptno = d.deptno 
and (p.deptno, p.hiredate) in(select deptno, min(hiredate) 
from scott7.t_professor group by deptno) order by "학과명";

--#7203) t_emp2 테이블 : ★직급별로 해당직급에서 최대 연봉★을 받는 직원의 이름과 직급, 연봉을 출력하세요,  
--                      단, 연봉순으로 오름차순 정렬하세요
SELECT * from scott7.t_emp2;
--★직급별 해당직급의 최대연봉★--
select post, max(pay) from scott7.t_emp2 group by post;

select name 사원명, post 직급, to_char(pay,'999,999,999') ||'원' 연봉
from scott7.t_emp2
where (post, pay) in(select post, max(pay) from scott7.t_emp2 group by post) order by "연봉";

--#7204) t_emp2, t_dept2 테이블 : ★각 부서별 평균 연봉★을 구하고 
--			그 중에서 ★평균 연봉이 가장 적은 부서★의 평균연봉보다 적게 받는 
--			직원들의 부서명, 직원명, 연봉을 출력 하세요

select * from scott7.t_emp2;
select * from scott7.t_dept2;
--각 부서별 평균연봉
select avg(pay) from scott7.t_emp2 group by deptno;

select d.dname 부서명, e.name 직원명, e.pay 연봉
from scott7.t_emp2 e, scott7.t_dept2 d
where e.deptno = d.dcode 
and e.pay <all (select avg(pay) from scott7.t_emp2 group by deptno)
order by "연봉";

------------------------------------------------------------------------
--#7205) t_emp2 테이블 :  직원들 중에서 ★자신의 직급의 평균연봉★과 같거나 많이 받는 사람들의 이름과 직급, 현재 연봉을 출력하세요.
--일단 자신이 직급을 구해야 한다.
--그 것을 Sub Query 에 전달해 주어야 한다
--Sub Query는 받은뒤 수행하여 결과를 다시 Main Query에 전달해야 한다

select * from scott7.t_emp2;
--직급별 평균연봉
select avg(pay) from scott7.t_emp2 group by post;
select a.name 이름, nvl(a.post,' ') 직급, a.pay 연봉
from scott7.t_emp2 a
where a.pay >= (select avg(b.pay) from scott7.t_emp2 b where nvl(a.post,' ') = nvl(b.post, ' '));

--스칼라 서브쿼리
--#7206) t_emp2, t_dept2 테이블: 조회하여 사원들의 이름과 부서 이름을 출력
select * from scott7.t_emp2;
select * from scott7.t_dept2;
--동등조인방식
select e.name, d.dname
from scott7.t_emp2 e, scott7.t_dept2 d
where e.deptno = d.dcode;
--스칼라 서브쿼리 방식
select name 사원이름, (select dname from scott7.t_dept2 d where e.deptno = d.dcode) 부서이름
from scott7.t_emp2 e;
--JOIN 과 같은 결과 나옴.  그러나 데이터 양이 적은 경우는 스칼라서브쿼리 방식이 Join 보다 낳은 성능을 보여줌

---------------------------------------------------------------------------------
create table test_emp_a(
 emp_id number,
 emp_name varchar2(100)
);

create table test_emp_b(
 emp_id number,
 emp_name varchar2(100)
);
--한개의 row씩 insert
insert into test_emp_a values(101,'스파이더맨');
insert into test_emp_b values(201,'아이언맨');
select * from test_emp_a;
select * from test_emp_b;
--동시에 여러 테이블에 insert하기
insert all into test_emp_a values(102,'토르')
into test_emp_b values(202,'헐크')
select * from dual;
-- SubQuery로 insert
insert into test_emp_a (select 400, '호크아이' from dual);
insert into test_emp_a (select * from test_emp_a);
--insert 할때 type이 같아야한다. 다르면 에러발생
insert into test_emp_b(emp_name) (select emp_name from test_emp_a);

--SubQuery 로 CREATE TABLE 하기
--CREATE TABLE [테이블명]  AS [SubQuery]
--테이블 복사, 사본 만들기 좋다.
create table test_emp_c as (select emp_name, emp_id from test_emp_a);
select * from test_emp_c;

create table test_report1 as (select a.name 이름, nvl(a.post,' ') 직급, a.pay 연봉
from scott7.t_emp2 a
where a.pay >= (select avg(b.pay) from scott7.t_emp2 b where nvl(a.post,' ') = nvl(b.post, ' ')));

select * from test_report1;

--------------------------------------------------------------------------------------