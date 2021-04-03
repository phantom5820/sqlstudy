select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101;

select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;

--���� ������(Set Operator)
--���� �����ڴ� ���� ���� ������ ����� �����Ͽ� �ϳ��� �����ϴ� ����� ����Ѵ�. 
--���� ������ �� 2�� �̻��� ���� ����� �ϳ��� ����� ����� �ش�. 

--���տ����� ����
--UNION(�ߺ��� ����, ���ļ���) : �������� SQL�� ����� ���� �������ա����� ������� �ߺ��� ���� �ϳ��� ������ ����
--UNION ALL(�ߺ��� ���� ����, ���ļ��� ����) :  
--INTERSECT(���ļ���) : SQL���� ����� ���� �ڱ����ա� �ߺ��� ���� �ϳ��� ������ ����
--EXCEPT �Ǵ� MINUS : SQL���� ������� ���� SQL���� ����� ���� �������ա�, �ߺ��� ���� �ϳ��� ������ ����
--(�Ϻ� DB�� MINUS�� ����Ѵ�) (���� ����, �������� �߿�)



--���� #3201) UNION �� ���
--t_student ���̺�� t_professor 101�� �а�(deptno1) �� �ҼӵǾ� �ִ��л��� �������� ������ȣ, �̸� �а���ȣ ���
--union���� ��ģ��
select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101
UNION
select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;
--union all�� ��ģ��
select studno, name, deptno1
from SCOTT7.t_student
where deptno1 = 101
UNION all
select profno, name, deptno
from SCOTT7.t_professor
where deptno = 101;
-- �� ����� ���ľ��� ������ ���� ����� �״�� ���Ͽ� �����

--#3202)  UNION �� ����Ͽ�
--t_student ���� ��1����(deptno1)�� 101���а��� �л��� ��2����(deptno2)�� 201�� �а��� �����ϴ� �л����� �̸��� ��� ���
--UNION ó��
select name
from SCOTT7.t_student
where deptno1 = 101
union
select name
from SCOTT7.t_student
where deptno2 = 201;
--UNION ALLó��
select name
from SCOTT7.t_student
where deptno1 = 101
union all
select name
from SCOTT7.t_student
where deptno2 = 201;

--#3202)  INTERSECT �� ���
-- t_student ���� ��1����(deptno1)�� 101��, �׸��� ��2����(deptno2)�� 201�� �� ���� �����ϴ� �л����� �̸��� ��� ���
select name
from SCOTT7.t_student
where deptno1 = 101
INTERSECT
select name
from SCOTT7.t_student
where deptno2 = 201;


--#3203) MINUS ��� �ڿ���Ŭ������ MINUS�����ڸ� ���� excpt�� MYSQL ����� ����
--t_professor �����Ե���
--�޿��� 20% �λ��ϱ� ���� ���(�̸�, ����)�� ���
--��, ������ ���Ӱ����� ����� ����

select * from SCOTT7.t_professor;
select name, position
from SCOTT7.t_professor
minus
select name, position
from SCOTT7.t_professor
where position = '���Ӱ���';
