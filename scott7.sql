select * from SCOTT7.phonebook;
update SCOTT7.phonebook set name = 'Ʈ����' where name like '������';

select 20*10 from dual;
select 'ABCD' from scott7.phonebook;

select * from scott7.t_emp;

select empno,ename from scott7.t_emp;

select name from SCOTT7.t_professor;

select name, '������ �ȳ��ϼ���' from SCOTT7.t_professor;

select studno, name from SCOTT7.t_student;
select studno �й�, name �̸� from SCOTT7.t_student;

select studno "�л� ��ȣ", name as �̸� from SCOTT7.t_student;
select empno �����ȣ, ename  �����, job ���� from SCOTT7.t_emp;

select deptno "�μ�#", dname �μ���, loc ��ġ from SCOTT7.t_dept;

select DISTINCT deptno from scott7.t_emp;

select * from SCOTT7.t_student;
select distinct deptno1, name from SCOTT7.t_student;
select * from scott7.t_emp;
select DISTINCT job from scott7.t_emp;

select name, position from scott7.t_professor;
select name || '-' || position �����Ը�� from scott7.t_professor;

select * from SCOTT7.t_student;


select name || '�� Ű��' || height || 'cm, ' || '�����Դ�' || weight || 'kg �Դϴ�.' "�л��� Ű�� ������" from SCOTT7.t_student; 

select * from scott7.t_emp;

select ename, sal, sal * 1.025 "�޿� 2.5% �λ��" from scott7.t_emp;
select ename, sal, sal * 1.025 "�޿� 2.5% �λ��" from scott7.t_emp;

select * from scott7.t_emp;

select sal �޿�, comm �����, sal + comm "�޿� + �����" from SCOTT7.t_emp;

select * from scott7.t_emp;

select empno ���, ename �̸�, job ��å, mgr, hiredate, sal �޿�, comm, deptno from scott7.t_emp where job = 'salesman';
select * from scott7.t_emp where job = 'SALESMAN';

select ename �̸�, sal �޿�, deptno �μ���ȣ from SCOTT7.t_emp where deptno = 10;
select ename �̸�, sal �޿� from scott7.t_emp where sal > 2000;
select ename �̸�, empno ���, sal �޿� from scott7.t_emp where ename like 'SCOTT';

select * from SCOTT7.t_student;
select name, grade from scott7.t_student where grade = 2 or grade =3;
select name, grade from scott7.t_student where grade in (2,3);
select name, grade from scott7.t_student where grade not in (1,4);
select name, grade from SCOTT7.t_student where grade > 1 and grade <4;

select ename from scott7.t_emp;
select * from SCOTT7.t_emp where ename like '%S';

select name from SCOTT7.t_professor where name like '��%';

select ename from SCOTT7.t_emp where ename like '%NE%';

select ename from scott7.t_emp where ename like '_A%';

select * from SCOTT7.t_professor;

select name, position from SCOTT7.t_professor where bonus is not null;

select ename from SCOTT7.t_emp where ename like '%L%' order by ename DESC; 

select * from SCOTT7.t_emp;
select ename, job, sal from scott7.t_emp order by job desc, sal asc;

select * from scott7.t_student;
select name, birthday, height, weight from SCOTT7.t_student where grade = 1 order by birthday;
select name �̸�, height Ű from SCOTT7.t_student order by name;
select * from scott7.t_emp2;
select name, birthday from s
cott7.t_emp2 where birthday like '8%' order by birthday;

select * from scott7.t_student;
select name, grade, height from scott7.t_student order by grade, height desc;

select * from SCOTT7.t_student where height >= 180;
select name, weight from SCOTT7.t_student where weight between 60 and 80;
select * from SCOTT7.t_student where deptno1 in (101,201);
select * from SCOTT7.t_student where name like '��%';

select name, grade, height from SCOTT7.t_student where grade = 4 and height > 170;
select name, height, grade, weight from SCOTT7.t_student where grade = 1 or weight >= 80;
select name, grade, height, weight from scott7.t_student where grade = 2 and height > 180 and weight > 70;
select * from scott7.t_emp;
select ename, hiredate from scott7.t_emp where hiredate < '92-01-01';

select * from scott7.t_student;
select name, birthday, height, weight from scott7.t_student where grade = 1 order by birthday;
select name �̸�, height Ű from SCOTT7.t_student order by name; 
select * from scott7.t_emp2;

select * from SCOTT7.t_student;
select * from SCOTT7.t_student where height >= 180;
select name, weight from SCOTT7.t_student where weight between 60 and 80;
select * from SCOTT7.t_student where deptno1 in (101,201);
select * from SCOTT7.t_student where name like '��%';

select name, grade, height from SCOTT7.t_student where height >= 170;
select name, height, grade, weight from SCOTT7.t_student where grade = 1 or weight >= 80;
select name, grade, height, weight from SCOTT7.t_student where grade = 2 and height > 180 and weight > 70;
-- ???--
select name, grade, height, weight from SCOTT7.t_student where grade = 2 and height > 180 or weight > 70;

select * from SCOTT7.t_emp;
select ename, hiredate from SCOTT7.t_emp where hiredate < '92-01-01';

select * from SCOTT7.t_student;
select name, birthday, height, weight from SCOTT7.t_student where grade = 1 order by birthday;
select name �̸�, height Ű from SCOTT7.t_student where grade = 1 order by name;
select * from scott7.t_emp2;
select name, birthday from scott7.t_emp2 where birthday between '80-01-01' and '90-01-01';


--(1) INITCAP �Լ� : ù���ڸ� �빮�ڷ� ��ȯ�Ͽ� ���
select INITCAP('we are the champion')from dual;
select * from SCOTT7.t_student;
select id,INITCAP(id) from SCOTT7.t_student where deptno1 = 201;

--(2) lower, upper
select name �̸�, id, lower(id) �ҹ���, upper(id) �빮�� from SCOTT7.t_student where deptno1 = 201;

select name �̸�, id, length(id) ���ڼ� from SCOTT7.t_student where length(id) >= 9; 

select name �̸�, length(name) ����, lengthb(name) "����Ʈ ��" from SCOTT7.t_student where deptno1 = 201;
select ename �̸�, length(ename) ����, lengthb(ename) "����Ʈ ��" from scott7.t_emp where comm is not null;

select * from SCOTT7.t_professor;
select concat(name,position) �����Ը�� from SCOTT7.t_professor where deptno = 101;
select name || position �����Ը�� from SCOTT7.t_professor where deptno = 101;

select SUBSTR('ABCDEF',-3,3) from dual;
select SUBSTR('ABCDEFG',3,10) from dual;
select SUBSTR('ABCDEFG',20,3) from dual;
select SUBSTR('ABCDEFG',-2,3) from dual;
select * from SCOTT7.t_student;
select name, substr(jumin,1,6) ������� from SCOTT7.t_student where deptno1 = 101;

--t_student ���̺� : jumin Į���� ����ؼ�  �¾ ���� 8���� ����� �̸��� ��������� ����ϼ���
select name, substr(jumin,1,6) ������� from scott7.t_student where substr(jumin,4,1) = 8;
select name, substr(jumin,1,6) ������� from scott7.t_student where substr(jumin,3,2) = '08';
select name, substr(jumin,1,6) ������� from scott7.t_student where jumin like '__08%';

--���� #4109) t_student ���̺� : 4�г� �л����� �����л��� ���� �̸��� �ֹι�ȣ ���

select name, substr(jumin,1,13) �ֹι�ȣ, grade from scott7.t_student where grade = 4 and substr(jumin,7,1) = 2;

-- INSTR()�Լ�
select INSTR('A*B*C*','*',1,1) from dual;
select INSTR('A*B*C*','*',1,2) from dual;
select INSTR('A*B*C*','*',3,2) from dual;
select INSTR('A*B*C*','*',-4,1) from dual;
select INSTR('A*B*C*','*',-2,2) from dual;

--#4110) t_student ���̺� : tel Į���� ����Ͽ� 101�� �а�(deptno1) �� �л��� �̸��� ��ȭ��ȣ, ��)�� �� ������ ��ġ ���  
select name, tel, instr(tel,')',2,1) ��ġ from SCOTT7.t_student where deptno1 = 101;
--#4111) t_student ���̺� : 1������ 101 �� �л��� �̸��� ��ȭ��ȣ, ������ȣ�� ����ϼ���. ������ȣ�� ���ڸ�!
select * from SCOTT7.t_student;
select name, tel, substr(tel,1,instr(tel,')')-1) from SCOTT7.t_student where deptno1 = 101;

select lpad('abcd',10,'#-') LAPD, rpad('abcd',10,'#-') from dual;
--#4112) t_student ���̺� : 1������ 101���� �л����� id�� �� 10�ڸ��� ����ϰ� ���� ���ڸ��� ��$�� ��ȣ�� ä�켼�� 
select id, lpad(id,10,'$'), length(lpad(id,10,'$')) ����  from SCOTT7.t_student;

--#4113) t_dept2 ���̺� :  �μ��� (dname) �� ������ ���� ����� �������� ���� �ۼ� �� 10���ڷ� ����ϵ�, ���� ���ڸ��� ���ڷ� ä���
select * from scott7.t_dept2;
select lpad(dname,10,'1234') lpad����, length(lpad(dname,10,'1234')) ���� from scott7.t_dept2;
--#4114) Student ���̺��� ������ ���� id�� 12�ڸ��� ����ϵ� ������ ���ڸ����� ��*�� �� ä�켼��
select * from scott7.t_student;
select rpad(id,12,'*') rpad���� from scott7.t_student;
--#4115) t_dept2 ���̺��� ����Ͽ� �μ���(dname)�� ������ ���� ����� �������� ������ �ۼ��ϼ��� 
select rpad(dname,10,'1234567890') rpad���� from scott7.t_dept2; 

select LTRIM('���۽��۽�����', '����') ltrim,
Ltrim('       ������������', ' ') ltrim,
rtrim('������������                          ', ' ') rtrim from dual;

--#4116) t_dept2 ���̺��� �μ���(dname) �� ����ϵ� ���ʿ� ������ �̶� ���ڸ� ��� �����ϰ� ����ϼ���. 
SELECT * FROM SCOTT7.T_DEPT2;
SELECT LTRIM(DNAME,'��') LTRIM FROM SCOTT7.T_DEPT2;

--#4117) T_dept2 ���̺��� �μ���(dname) �� ����ϵ� ������ ���� ���Ρ� ��� ���ڴ� �����ϰ� ����ϼ���.
SELECT * FROM SCOTT7.T_DEPT2;
SELECT RTRIM(DNAME,'��') RTRIM FROM SCOTT7.T_DEPT2;
SELECT REPLACE('���۸� ���۰�', '����', '�Ŀ�') REPLACE���� FROM dual;

--#4118) t_student ���̺��� 102�� �а�(deptno1) �� �л����� �̸��� ����ϵ� �� �κ��� ��#��  ���� ǥ�õǰ� ����ϼ��� 
select * from scott7.t_student;
SELECT name, replace(name, substr(name,1,1),'#') �� from scott7.t_student where deptno1 = 102;

--#4119) t_student ���̺��� 101�� �а�(deptno1) �� �л����� �̸��� ����ϵ� ��� ���ڸ� ��#��  ���� ǥ�õǰ� ����ϼ���
select replace(name, substr(name,2,1),'#') from scott7.t_student where deptno1 = 101;
--#4120) t_student ���̺��� 1����(deptno1) �� 101���� �л����� �̸��� �ֹε�Ϲ�ȣ�� ����ϵ� �ֹε�Ϲ�ȣ�� �� 7�ڸ��� ��*�� �� ǥ�õǰ� ���
select name, replace(jumin,substr(jumin,7,7),'*******') �ֹι�ȣ from scott7.t_student where deptno1 = 101;
--#4121) Student ���̺��� ���� �� ���� 1����(deptno1) �� 102���� �л����� �̸�(name) �� ��ȭ��ȣ(tel), ��ȭ��ȣ���� ���� �κи� ��#�� ó���Ͽ� ����ϼ���. �� ��� ������ 3�ڸ��� �����մϴ�.
select name, tel, replace(tel, substr(tel,instr(tel,')')+1,3),'###') ��ȭ��ȣ from SCOTT7.t_student where deptno1 = 101;


select * from SCOTT7.t_professor;
select name, pay, bonus, pay + bonus from SCOTT7.t_professor;

--#4201) Professor ���̺� : 101�� �а� �������� �̸�(name), �޿�(pay), ���ʽ�(bonus ), ����(pay) ����ϱ�.  ������ pay * 12 + bonus �� ���,  bonus �� ���� ������ 0 ���� ���
select * from SCOTT7.t_professor;
select name �̸�, pay �޿�, nvl(bonus,0) ���ʽ�, pay *12 + nvl(bonus, 0) ���� from SCOTT7.t_professor where deptno = 101;
--#4202) professor ���̺� :  101�� �а� ������ �̸��� pay, bonus, ���� ���,  
������ pay*12 + bonus �� ���, bonus �� ������ �޿��� 0 ���� ó�� (nvl2 ���)
select name �̸�, pay �޿�, nvl(bonus,0) ���ʽ�, nvl2(bonus, pay *12 + bonus, pay * 12) ���� from SCOTT7.t_professor where deptno = 101;
select 1 + '1' from dual;
