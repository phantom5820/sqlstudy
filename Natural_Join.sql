select t_emp.deptno, t_emp.empno, t_emp.ename, t_dept.dname
from scott7.t_emp inner join scott7.t_dept
on t_emp.deptno = t_dept.deptno;

-----------------------------------------------------------------
--Natural Join (자연 join)

select * from scott7.t_emp;
select * from scott7.t_dept;
--사원번호, 사원이름, 소속부서 코드, 소속부서 이름
select deptno, empno, ename, dname
from scott7.t_emp natural join scott7.t_dept
order by empno;
--위에 코드 비록 별도의 'join 조건'을 주진 않았지만 (즉, where,on,using 은 없음)
--두 테이블의 deptno 가 동일이름 컬럼으로 '자동으로' 인식하여 join처리를 한다.

select e.deptno, e.empno, e.ename, d.dname
from scott7.t_emp e, scott7.t_dept d
where e.deptno = d.deptno
order by e.empno;


--#6301) t_emp, t_dept 테이블에서 사원번호, 사원이름， 소속부서코드, 소속부서 이름 출력 / 부서번호(deptno), 직원번호(empno) 오름차순 정렬
select * from scott7.t_emp;
select * from scott7.t_dept;
--natural join
select deptno, empno, ename, dname 
from scott7.t_emp natural join scott7.t_dept
order by deptno, empno;

--oracle equi join
select e.deptno, e.empno, e.ename, d.dname
from scott7.t_emp e, scott7.t_dept d
where e.deptno = d.deptno
order by deptno, empno;

--ansi join
select e.deptno, e.empno, e.ename, d.dname
from scott7.t_emp e join scott7.t_dept d
on e.deptno = d.deptno
order by deptno, empno;

------------------------------------------------------------------------------

--’SELECT *’ 처럼 별도의 칼럼 순서를 지정하지 않으면 NATURAL JOIN의 기준이 되는 칼럼 들이 다른 칼럼보다 먼저 출력된다. (ex: DEPTNO가 첫 번째 칼럼이 된다.) 이때 NATURAL JOIN은 JOIN에 사용된 같은 이름의 칼럼을 '한개'로 처리한다
 --#6303)
select * 
from scott7.t_emp natural join scott7.t_dept;

select * 
from scott7.t_emp e join scott7.t_dept d on e.deptno = d.deptno;

-----------------------------------------------------------------------------
--#6305) t_dept 의 내용으로 DEPT_TEMP 테이블 생성 하기 (CREATE TALBLE)
select * from scott7.t_dept;
create table dept_temp as select * from scott7.t_dept;
select * from dept_temp;
--#6306)  dept_temp 테이블의 dname 컬럼에서 RESEARCH → R&D 로      SALES → MARKETING 으로 수정하세요
update dept_temp set dname = 'R&D' where dname = 'RD';
update dept_temp set dname = 'MARKETING' where dname = 'SALES';
drop table dept_temp;

--두개의 t_dept 와 dept_temp 테이블은  컬럼명은 같다.  그러나 데이터가 다르다
--과연 ? Natural Join 에서 어떻게 동작할 것인가?
--#6307)  과연 결과는
SELECT * FROM scott7.t_dept NATURAL JOIN dept_temp;

--inner join 
--예제: USING 사용
--세 개의 칼럼명이 모두 같은 DEPT와 DEPT TEMP 테이블을 DEPTNO 칼럼을 이용한 [INNER] JOIN의 USING 조건절로 수행한다
--#6308) SELECT * FROM t_DEPT JOIN DEPT_TEMP USING (DEPTNO);
SELECT * FROM scott7.t_DEPT JOIN DEPT_TEMP USING (DEPTNO);


        --USING 조건절을 이용한 EQUI JOIN에서도 NATURAL JOIN과 마찬가지로--
		--JOIN 칼럼에 대해서는 ALIAS나 테이블 이름과 같은 접두사를 붙일 수 없다--
--#6309) 잘못된 경우
SELECT t_dept.deptno. t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM scott7.t_dept JOIN dept_temp USING (deptno); 
--#6310) 바른 경우
SELECT deptno, t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM scott7.t_dept JOIN dept_temp USING (deptno);

--예제 #6311)이번에는 t_dept와 dept_temp 테이블의 일부 데이터 내용이 변경되었던 DNAME 칼럼을 조인 조건으로 [INNER] JOIN의 USING 조건절을 수행
select * from scott7.t_dept join dept_temp using (dname);

--예제 : Inner Join 에 USING 을 사용
--#6312) 이번에는 세 개의 칼럼명이 모두 같은 DEPT와 DEPT TEMP 테이블을 LOC와 DEPTNO 2개 칼럼을 이용한  [INNER] JOIN의 USING 조건절로 수행한다. 
select * from scott7.t_dept join dept_temp using (loc, deptno);
select * from scott7.t_dept join dept_temp using (deptno, dname, loc);