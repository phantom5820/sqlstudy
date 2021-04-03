select t_emp.deptno, t_emp.empno, t_emp.ename, t_dept.dname
from scott7.t_emp inner join scott7.t_dept
on t_emp.deptno = t_dept.deptno;

-----------------------------------------------------------------
--Natural Join (�ڿ� join)

select * from scott7.t_emp;
select * from scott7.t_dept;
--�����ȣ, ����̸�, �ҼӺμ� �ڵ�, �ҼӺμ� �̸�
select deptno, empno, ename, dname
from scott7.t_emp natural join scott7.t_dept
order by empno;
--���� �ڵ� ��� ������ 'join ����'�� ���� �ʾ����� (��, where,on,using �� ����)
--�� ���̺��� deptno �� �����̸� �÷����� '�ڵ�����' �ν��Ͽ� joinó���� �Ѵ�.

select e.deptno, e.empno, e.ename, d.dname
from scott7.t_emp e, scott7.t_dept d
where e.deptno = d.deptno
order by e.empno;


--#6301) t_emp, t_dept ���̺��� �����ȣ, ����̸��� �ҼӺμ��ڵ�, �ҼӺμ� �̸� ��� / �μ���ȣ(deptno), ������ȣ(empno) �������� ����
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

--��SELECT *�� ó�� ������ Į�� ������ �������� ������ NATURAL JOIN�� ������ �Ǵ� Į�� ���� �ٸ� Į������ ���� ��µȴ�. (ex: DEPTNO�� ù ��° Į���� �ȴ�.) �̶� NATURAL JOIN�� JOIN�� ���� ���� �̸��� Į���� '�Ѱ�'�� ó���Ѵ�
 --#6303)
select * 
from scott7.t_emp natural join scott7.t_dept;

select * 
from scott7.t_emp e join scott7.t_dept d on e.deptno = d.deptno;

-----------------------------------------------------------------------------
--#6305) t_dept �� �������� DEPT_TEMP ���̺� ���� �ϱ� (CREATE TALBLE)
select * from scott7.t_dept;
create table dept_temp as select * from scott7.t_dept;
select * from dept_temp;
--#6306)  dept_temp ���̺��� dname �÷����� RESEARCH �� R&D ��      SALES �� MARKETING ���� �����ϼ���
update dept_temp set dname = 'R&D' where dname = 'RD';
update dept_temp set dname = 'MARKETING' where dname = 'SALES';
drop table dept_temp;

--�ΰ��� t_dept �� dept_temp ���̺���  �÷����� ����.  �׷��� �����Ͱ� �ٸ���
--���� ? Natural Join ���� ��� ������ ���ΰ�?
--#6307)  ���� �����
SELECT * FROM scott7.t_dept NATURAL JOIN dept_temp;

--inner join 
--����: USING ���
--�� ���� Į������ ��� ���� DEPT�� DEPT TEMP ���̺��� DEPTNO Į���� �̿��� [INNER] JOIN�� USING �������� �����Ѵ�
--#6308) SELECT * FROM t_DEPT JOIN DEPT_TEMP USING (DEPTNO);
SELECT * FROM scott7.t_DEPT JOIN DEPT_TEMP USING (DEPTNO);


        --USING �������� �̿��� EQUI JOIN������ NATURAL JOIN�� ����������--
		--JOIN Į���� ���ؼ��� ALIAS�� ���̺� �̸��� ���� ���λ縦 ���� �� ����--
--#6309) �߸��� ���
SELECT t_dept.deptno. t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM scott7.t_dept JOIN dept_temp USING (deptno); 
--#6310) �ٸ� ���
SELECT deptno, t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM scott7.t_dept JOIN dept_temp USING (deptno);

--���� #6311)�̹����� t_dept�� dept_temp ���̺��� �Ϻ� ������ ������ ����Ǿ��� DNAME Į���� ���� �������� [INNER] JOIN�� USING �������� ����
select * from scott7.t_dept join dept_temp using (dname);

--���� : Inner Join �� USING �� ���
--#6312) �̹����� �� ���� Į������ ��� ���� DEPT�� DEPT TEMP ���̺��� LOC�� DEPTNO 2�� Į���� �̿���  [INNER] JOIN�� USING �������� �����Ѵ�. 
select * from scott7.t_dept join dept_temp using (loc, deptno);
select * from scott7.t_dept join dept_temp using (deptno, dname, loc);