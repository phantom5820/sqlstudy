--#8101) t_professor ���̺��� profno, name, email, hpage Į���� ����ϴ� view�� �����ϼ��� view �� �̸��� v_prof�� �ϼ���
--VIEW
CREATE or replace VIEW V_PROF AS SELECT PROFNO, NAME, EMAIL, HPAGE FROM SCOTT7.T_PROFESSOR;

select * from v_prof;

select tname from tab;

-- view ����
drop view v_prof;

--view ������ �÷��̸� ��������!!
CREATE or replace VIEW V_PROF(pfno, nm, em, hp) AS SELECT PROFNO, NAME, EMAIL, HPAGE FROM SCOTT7.T_PROFESSOR;

select * from v_prof;

--Ư�� ����ڰ� ������ view ��� Ȯ�ο�
select owner as schema_name, view_name from sys.all_views where owner = 'SCOTT7' ORDER BY owner, view_name;

--#8102) t_professor, t_department ���̺��� join �Ͽ� ������ȣ�� �����̸��� �Ҽ��а� �̸��� ��ȸ�ϴ� view �� �����ϼ���. (�̸�: v_prof_dept)
select * from scott7.t_professor;
select * from scott7.t_department;
--����--
select p.profno ������ȣ, p.name ������, d.dname �Ҽ��а���
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno;
--�����--
create or replace view v_prof_dept as 
select p.profno ������ȣ, p.name ������, d.dname �Ҽ��а���
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno;

select * from v_prof_dept;
--�÷����� �ѱ۷� ����� ���� �ǵ��� ���ؾ� �Ѵ�, ���߿� �Ӹ� �������� �߻��� �� �ֱ� �����̴�.
----------------------------------------------------------------------------------------
--inline view (from���� SubQuery�� ������)
--#8103) t_student, t_department ���̺� : �а����� �л����� �ִ�Ű�� �ִ������, �а� �̸��� ����ϼ���
select * from scott7.t_student;
select * from scott7.t_department;

select d.dname �а���, s.max_height �ִ�Ű, s.max_weight �ִ������
from (select deptno1, max(height) max_height, max(weight) max_weight from scott7.t_student group by deptno1) s , scott7.t_department d
where s.deptno1 = d.deptno;
--�̰��� ��ȸ���̱� ������ Ȱ���� �����ϴ� ��쿡�� view�� �����δ°��� ����

--#8104) t_student, t_department ���̺� : �а���(deptno1)�� ���� Ű�� ū �л����� �̸��� Ű, �а��̸��� �ζ��κ� �� ����Ͽ� ������ ���� ����ϼ���
select deptno1, max(height) max_height from SCOTT7.t_student group by deptno1;

select d.dname �а���, a.max_height �ִ�Ű, s.name �л��̸�, a.max_height Ű 
from (select deptno1, max(height) max_height from SCOTT7.t_student group by deptno1) a, SCOTT7.t_student s, SCOTT7.t_department d
where s.deptno1 = a.deptno1 and s.height = a.max_height and s.deptno1 = d.deptno;

--#8105) t_student ���̺� : �л��� Ű�� ���� �г��� ��� Ű���� ū �л����� �г�� �̸��� Ű, �ش� �г��� ���Ű�� ����ϵ�, 
    --inline view �� ����ؼ� �Ʒ��� ���� ����ϼ���. 
    --�� �г� Į���� ���� �������� ����.
-- �г⺰ ���Ű
select grade, avg(height) from SCOTT7.t_student group by grade; 

select s.grade �г�, s.name �̸�, s.height Ű, a.avg_height ���Ű, s.height - a.avg_height "����"
from (select grade, avg(height) avg_height from SCOTT7.t_student group by grade) a, SCOTT7.t_student s
where a.grade = s.grade and s.height > a.avg_height
order by 1, "����" desc;
----------------------------------------------------------------------------------------