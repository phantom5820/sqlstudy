--#8101) t_professor 테이블의 profno, name, email, hpage 칼럼만 사용하는 view를 생성하세요 view 의 이름은 v_prof로 하세요
--VIEW
CREATE or replace VIEW V_PROF AS SELECT PROFNO, NAME, EMAIL, HPAGE FROM SCOTT7.T_PROFESSOR;

select * from v_prof;

select tname from tab;

-- view 삭제
drop view v_prof;

--view 생성시 컬럼이름 지정가능!!
CREATE or replace VIEW V_PROF(pfno, nm, em, hp) AS SELECT PROFNO, NAME, EMAIL, HPAGE FROM SCOTT7.T_PROFESSOR;

select * from v_prof;

--특정 사용자가 소유한 view 목록 확인용
select owner as schema_name, view_name from sys.all_views where owner = 'SCOTT7' ORDER BY owner, view_name;

--#8102) t_professor, t_department 테이블을 join 하여 교수번호와 교수이름과 소속학과 이름을 조회하는 view 를 생성하세요. (이름: v_prof_dept)
select * from scott7.t_professor;
select * from scott7.t_department;
--조인--
select p.profno 교수번호, p.name 교수명, d.dname 소속학과명
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno;
--뷰생성--
create or replace view v_prof_dept as 
select p.profno 교수번호, p.name 교수명, d.dname 소속학과명
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno;

select * from v_prof_dept;
--컬럼명은 한글로 만드는 것은 되도록 피해야 한다, 나중에 머리 아픈일이 발생할 수 있기 때문이다.
----------------------------------------------------------------------------------------
--inline view (from절에 SubQuery가 들어간형태)
--#8103) t_student, t_department 테이블 : 학과별로 학생들의 최대키와 최대몸무게, 학과 이름을 출력하세요
select * from scott7.t_student;
select * from scott7.t_department;

select d.dname 학과명, s.max_height 최대키, s.max_weight 최대몸무게
from (select deptno1, max(height) max_height, max(weight) max_weight from scott7.t_student group by deptno1) s , scott7.t_department d
where s.deptno1 = d.deptno;
--이것은 일회용이기 때문에 활용을 자주하는 경우에는 view를 만들어두는것이 좋다

--#8104) t_student, t_department 테이블 : 학과별(deptno1)로 가장 키가 큰 학생들의 이름과 키, 학과이름을 인라인뷰 를 사용하여 다음과 같이 출력하세요
select deptno1, max(height) max_height from SCOTT7.t_student group by deptno1;

select d.dname 학과명, a.max_height 최대키, s.name 학생이름, a.max_height 키 
from (select deptno1, max(height) max_height from SCOTT7.t_student group by deptno1) a, SCOTT7.t_student s, SCOTT7.t_department d
where s.deptno1 = a.deptno1 and s.height = a.max_height and s.deptno1 = d.deptno;

--#8105) t_student 테이블 : 학생의 키가 동일 학년의 평균 키보다 큰 학생들의 학년과 이름과 키, 해당 학년의 평균키를 출력하되, 
    --inline view 를 사용해서 아래와 같이 출력하세요. 
    --단 학년 칼럼은 오름 차순으로 정렬.
-- 학년별 평균키
select grade, avg(height) from SCOTT7.t_student group by grade; 

select s.grade 학년, s.name 이름, s.height 키, a.avg_height 평균키, s.height - a.avg_height "차이"
from (select grade, avg(height) avg_height from SCOTT7.t_student group by grade) a, SCOTT7.t_student s
where a.grade = s.grade and s.height > a.avg_height
order by 1, "차이" desc;
----------------------------------------------------------------------------------------