--����(t_emp) �� �̸�, ��å(job), �޿��� select �ϵ� ��å(job)�� ������������ �޿�(sal)�� ������������ select�ϱ�
select * from scott7.t_emp;
select ename, job, sal from scott7.t_emp order by job desc, sal asc;
select name, tel, substr(tel,1,instr(tel,')',1,1) -1) ������ȣ from SCOTT7.t_student where deptno1 = 101;
select name �̸�, pay �޿�, nvl(bonus,0) ���ʽ�, pay *12 + nvl(bonus, 0) ���� from SCOTT7.t_professor where deptno = 101;


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

--#4301)  ������ ���� �������� ����ð��� ����غ�����
select sysdate, to_char(sysdate, 'rrrr-mm-dd hh24:mi:ss') ��¥ from dual;
select sysdate, to_char(sysdate, 'hh24:mi:ss rrrr-mm-dd') ��¥ from dual;
--�ſ�ī�� ����
select sysdate, to_char(sysdate, 'mm/yy') from dual;
--2019��07��16�� 21��22��34��
select sysdate, to_char(sysdate, 'YYYY"��"MM"��"DD"��" HH24"��"MI"��"SS"��"') ��¥ from dual;

SELECT * FROM SCOTT7.t_student;
SELECT NAME, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') ���� FROM SCOTT7.t_student WHERE TO_CHAR(birthday, 'MM') = 03;

SELECT TO_CHAR(1234, '99999') FROM DUAL;
SELECT TO_CHAR(1234, '099999') FROM DUAL;
SELECT TO_CHAR(1234, '$9999') FROM DUAL;
SELECT TO_CHAR(1234.1234, '9999.99') FROM DUAL;
SELECT TO_CHAR(1234, '99,999') FROM DUAL;
SELECT TO_CHAR(123456789, '999,999,999') FROM DUAL;

--#4303)  t_professor ���̺��� 101�� �а� �������� �̸�(name), ����(pay) �� ����ϼ���,��, ������ (pay * 12) + bonus�� ����ϰ� õ���� ���б�ȣ�� ǥ���ϼ���.
SELECT * FROM SCOTT7.t_professor;
SELECT NAME, TO_CHAR((PAY * 12) + NVL(BONUS,0),'99,999') ���� FROM SCOTT7.t_professor WHERE DEPTNO = 101;

SELECT '123.44' ���ڿ�, TO_NUMBER('123.44') ���ں�ȯ FROM DUAL;
SELECT TO_NUMBER('ABC') ���ں�ȯ FROM DUAL;

SELECT TO_DATE('2012-01-01', 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('04-24-1998', 'MM-DD-YYYY') FROM DUAL;

--#4304) t_professor ���̺��� 2000�� ������ �Ի��� ������� �Ի���,
--          ���� ������ 10% �λ� �� ������ �Ʒ��� ���� ������� ����ϼ���.
--          ������ ���ʽ�(bonus)�� ������ pay * 12 �� ����ϰ� ������ �λ��� ������ õ���� ���� ��ȣ�� �߰��Ͽ� ����ϼ���

SELECT * FROM SCOTT7.t_professor;
SELECT NAME, HIREDATE �Ի���, TO_CHAR((PAY * 12),'99,999') ���翬��, TO_CHAR((PAY * 12) * 1.1,'99,999') �λ��� FROM SCOTT7.t_professor WHERE TO_CHAR(hiredate,'RRRR') < TO_NUMBER('2000');

SELECT SYSDATE ����, SYSDATE +1 "����(24�ð���)", SYSDATE -2 "������" FROM DUAL;
SELECT SYSDATE + 1/24 "�ѽð� ��" FROM DUAL;

SELECT SYSDATE "����", SYSDATE - TO_DATE('2021-03-16') FROM DUAL;

SELECT MONTHS_BETWEEN('2012-03-01', '2012-01-01') FROM DUAL;
SELECT MONTHS_BETWEEN('2012-01-01', '2012-03-01') FROM DUAL;

SELECT MONTHS_BETWEEN('2012-02-29', '2012-02-01') "2��29�� - 2�� 01��" FROM DUAL;

SELECT MONTHS_BETWEEN('2012-02-28', '2012-02-01') "2��28�� - 2��01��" FROM DUAL;

SELECT MONTHS_BETWEEN('2019-01-31', '2019-01-01') "1��31�� - 1��01��" FROM DUAL;

SELECT * FROM SCOTT7.t_professor;

-- #4501) t_professor ���̺��� ����(SYSDATE)�� �������� 
--�ټӿ���, �ټӰ���,  �ټ��ϸ� ����ؼ� ���
--��¥����� YYYY-MM-DD ��,  �ټӰ���, �ټ����� �ݿø� �Ͽ� �Ҽ��� 1�ڸ����� ǥ��
SELECT NAME �̸�, TO_CHAR(SYSDATE,'YYYY-MM-DD') ����, TO_CHAR(HIREDATE,'YYYY-MM-DD') �Ի���, TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(hiredate,'YYYY') �ټӿ���, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),1) �ټӰ���, ROUND(SYSDATE - hiredate,1) FROM SCOTT7.t_professor;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) "3���� ��" FROM DUAL;

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE ����, NEXT_DAY(SYSDATE, '��') FROM DUAL;

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
--��Ʈ2
SELECT 'POWER', POWER(2, 1/2) "��Ʈ2" FROM DUAL;
SELECT 'POWER', POWER(27, 1/3) "27�� 3������" FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE) FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE) FROM DUAL;



--�׷��Լ�
SELECT * FROM SCOTT7.t_professor;

SELECT COUNT(*), COUNT(HPAGE) FROM SCOTT7.t_professor;

SELECT SUM(PAY) FROM SCOTT7.t_professor;
SELECT SUM(BONUS) FROM SCOTT7.t_professor;
SELECT COUNT(BONUS), COUNT(PAY) FROM SCOTT7.t_professor;

SELECT AVG(PAY), AVG(BONUS) FROM SCOTT7.t_professor;

SELECT AVG(BONUS), AVG(NVL(BONUS,0)) FROM SCOTT7.t_professor;

--���� T_PROFESSOR ���̺��� '�а�����' �������� ��� ���ʽ��� ����ϱ�
--SELECT DEPTNO, AVG(BONUS) FROM SCOTT7.t_professor;
SELECT DEPTNO, ROUND(AVG(NVL(BONUS,0)),1), COUNT(*) FROM SCOTT7.t_professor GROUP BY DEPTNO;

--���� �л����̺��� '�г⺰' �л��� ��
SELECT * FROM SCOTT7.t_student;
SELECT GRADE, DEPTNO1, COUNT(*) FROM SCOTT7.t_student GROUP BY GRADE, DEPTNO1 ORDER BY GRADE; 

--#5101) t_professor ���̺� : �а���(deptno) �׸��� ���޺�(position)�� �������� ��� �޿��� ����Ͽ� ����ϼ���
SELECT DEPTNO, POSITION, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO, POSITION ORDER BY DEPTNO, POSITION;

--�μ��� ��ձ޿��� ����ϵ�, ��ձ޿��� 450 ���� ���� �μ��� ���
SELECT * FROM SCOTT7.t_professor;
SELECT DEPTNO, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor WHERE AVG(PAY) > 450 GROUP BY DEPTNO;

SELECT DEPTNO, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO HAVING AVG(PAY) > 450;

--#5102) t_emp ���̺�: �Ŵ�����(MGR)�� �����ϴ� �������� ���Ŵ�����, ������������ ���޿��Ѿס��� ���޿���ա��� ������� (COMM) ��ա� ���޾� �� ����ϼ���.  �� ������� (job = president)���� 
SELECT * FROM SCOTT7.T_EMP;
SELECT MGR �Ŵ���, COUNT(*) ������, SUM(SAL) �޿��Ѿ�, ROUND(AVG(SAL),1) �޿����, AVG(NVL(COMM,0)) �������� FROM SCOTT7.T_EMP WHERE JOB <> 'PRESIDENT' GROUP BY MGR;

--���� #5103) t_professor ���̺� :  ������ ������ Ȥ�� ������ �� �е� �߿��� ������(deptno)����  ����ȣ, �Ҽӱ��� �Ѽ�, �ټ��� ���, �޿����, ���ʽ� ����� ����غ�����
SELECT * FROM SCOTT7.t_professor;
SELECT DEPTNO, COUNT(*) ���ο�, ROUND(AVG(SYSDATE - HIREDATE),1) �ټ������, AVG(PAY) �޿����, AVG(NVL(BONUS,0)) ���ʽ���� FROM SCOTT7.t_professor WHERE POSITION IN('������','������') GROUP BY DEPTNO ORDER BY DEPTNO ASC;

--#5104) t_student ���̺� : �а���(deptno1) ��,  �а���ȣ, �ִ������ - �ּҸ����� ���� ���� ����غ�����
SELECT * FROM SCOTT7.t_student;
SELECT DEPTNO1 �а�, MAX(WEIGHT) �ִ������, MIN(WEIGHT) �ּҸ�����, MAX(WEIGHT)-MIN(WEIGHT) �������� FROM SCOTT7.t_student GROUP BY DEPTNO1 HAVING MAX(WEIGHT)-MIN(WEIGHT) >= 30;


SELECT NAME, PROFNO FROM SCOTT7.t_student;
SELECT PROFNO, NAME FROM SCOTT7.t_professor;
SELECT * FROM SCOTT7.t_student, SCOTT7.t_professor;
SELECT SCOTT7.t_student.name, SCOTT7.t_professor.name FROM SCOTT7.t_student, SCOTT7.t_professor;

SELECT s.name, p.name FROM SCOTT7.t_student s, SCOTT7.t_professor p;

--�л��� �̸��� �� �л��� ��米�� �̸�.
select s.name, p.name from SCOTT7.t_student s, SCOTT7.t_professor p where s.profno = p.profno; 

--#6101) t_student ���̺�� t_department ���̺��� ����Ͽ� �л��̸�, 1���� �а���ȣ, 1���� �а� �̸��� ����ϼ���
select * from scott7.t_student s, scott7.t_department d;
select s.name �л��̸�, s.deptno1 �а���ȣ, d.dname �а��̸� from scott7.t_student s, scott7.t_department d where s.deptno1 = d.deptno;

select s.name �л��̸�, s.deptno1 �а���ȣ, d.dname �а��̸� from scott7.t_student s join scott7.t_department d on s.deptno1 = d.deptno;

--#6102) t_student ���̺�, t_professor ���̺� �� join�Ͽ� ���л��̸���, ���������� ��ȣ��, �����������̸��� �� ����ϼ���
SELECT * FROM SCOTT7.t_student;
SELECT * FROM SCOTT7.t_department;
SELECT * FROM SCOTT7.t_professor;
select s.name �л��̸�, s.profno "�������� ��ȣ", p.name ���������̸� from SCOTT7.t_student s join SCOTT7.t_professor p on s.profno = p.profno;
select s.name �л��̸�, s.profno "�������� ��ȣ", p.name ���������̸� from SCOTT7.t_student s, SCOTT7.t_professor p where s.profno = p.profno;

--#6103) 
--t_student, t_department, t_professor ���̺� �� join �Ͽ�  �л��� �̸�, �а��̸�, �������� �̸�  �� ����ϼ���
--oracle join
select s.name �л��̸�, d.dname �а��̸�, p.name "�������� �̸�" 
from SCOTT7.t_student s, SCOTT7.t_department d, SCOTT7.t_professor p 
where s.deptno1 = d.deptno and s.profno= p.profno; 
--ANSI JOIN
select s.name �л��̸�, d.dname �а��̸�, p.name "�������� �̸�" 
from SCOTT7.t_student s 
join SCOTT7.t_department d on s.deptno1 = d.deptno
join SCOTT7.t_professor p on s.profno = p.profno;

--#6104) t_emp2 ���� ���̺�� t_post ���� ���̺��� ��ȸ�Ͽ� ����� �̸��� ����, ���翬��, �ش������� ������ ���ѱݾ�(s_pay)�� ���ѱݾ�(e_pay)�� ����ϼ���
select * from scott7.t_emp2;
select * from scott7.t_post;
--oracle join
select e.name ����̸�, e.post ����, e.pay ���翬��, p.s_pay ���ѱݾ�, p.e_pay ���ѱݾ� 
from scott7.t_emp2 e, scott7.t_post p
where e.post = p.post; 
--ansi join
select e.name ����̸�, e.post ����, e.pay ���翬��, p.s_pay ���ѱݾ�, p.e_pay ���ѱݾ� 
from scott7.t_emp2 e join scott7.t_post p
on e.post = p.post;

--#6105) t_student - t_professor ���̺� join �Ͽ� ��1����(deptno1) �� 101���� �л����� �л��̸��� �������� �̸��� ����ϼ���
select * from scott7.t_professor;
--oracle join
select s.name �л��̸�, p.name ���������̸�
from SCOTT7.t_student s, scott7.t_professor p
where s.profno = p.profno 
and s.deptno1 = 101;
--ansi join
select s.name �л��̸�, p.name ���������̸�
from SCOTT7.t_student s join scott7.t_professor p
on s.profno = p.profno 
where s.deptno1 = 101;


SELECT NAME, PROFNO FROM SCOTT7.t_student; --20��
SELECT PROFNO, NAME FROM SCOTT7.t_professor;


-- #6201) t_customer ���̺�, t_gift ���̺��� join �Ͽ�  ���� ���ϸ��� ����Ʈ���� ������ �ִ� ��ǰ�� ��ȸ�Ͽ� ���� '�̸�(c_name)'�� ����Ʈ(c_point) ��ǰ��(g_name)�� ����ϼ���
select * from SCOTT7.t_customer;
select * from scott7.t_gift;

--oracle join
select c.c_name, c.c_point, g.g_name
from scott7.t_customer c, scott7.t_gift g
where c.c_point between g.g_start and g.g_end;
--ansi join
select c.c_name ����, c.c_point ������Ʈ, g.g_name ��ǰ��  
from SCOTT7.t_customer c join scott7.t_gift g
on c.c_point between g.g_start and g.g_end;
 
--#6202) �� �������� ��ȸ�� ��ǰ�� �̸�(g_name)�� �ʿ������ ����� ��ȸ�ϼ���
--oracle join
select g.g_name ��ǰ��, count(*) �ʿ����  
from SCOTT7.t_customer c, scott7.t_gift g
where c.c_point between g.g_start and g.g_end
group by g.g_name;
--ansi join
select g.g_name ��ǰ��, count(*) �ʿ����  
from SCOTT7.t_customer c join scott7.t_gift g
on c.c_point between g.g_start and g.g_end
group by g.g_name;


--#6203)  t_student ���̺�� t_exam01 ���輺�� ���̺�, t_credit ���� ���̺��� ��ȸ�Ͽ�  �л����� �̸��� ������ ������ ����ϼ���
select * from SCOTT7.t_student;
select * from SCOTT7.t_exam01;
select * from SCOTT7.t_credit;
--oracle join
select s.name �л��̸�, e.total ����, c.grade ����
from SCOTT7.t_student s, SCOTT7.t_exam01 e, SCOTT7.t_credit c
where s.studno = e.studno and e.total between c.min_point and c.max_point;
--ansi join
select s.name �л��̸�, e.total ����, c.grade ����
from SCOTT7.t_student s join SCOTT7.t_exam01 e 
on s.studno = e.studno join SCOTT7.t_credit c 
on e.total between c.min_point and c.max_point;

--#6204) t_customer �� t_gift ���̺� join : �ڱ� ����Ʈ(c_point) ���� ���� ����Ʈ�� ��ǰ �� �Ѱ����� �����Ҽ� �ִٰ� �Ҷ� '��ǿ�������'�� ������ �� �ִ� ����(c_name)�� ����Ʈ(c_point), ��ǰ��(g_name)�� ����ϼ���
select * from SCOTT7.t_customer;
select * from scott7.t_gift;
select c.c_name ����, c.c_point ����Ʈ, g.g_name ��ǰ��
from SCOTT7.t_customer c, SCOTT7.t_gift g
where c.c_point >= g.g_start and g.g_name = '��ǿ�������';

--oracle join
select c.c_name ����, c.c_point ����Ʈ, g.g_name ��ǰ��
from SCOTT7.t_customer c, SCOTT7.t_gift g
where c.c_point >= g.g_start and g.g_no = 5;
--ansi join
select c.c_name ����, c.c_point ����Ʈ, g.g_name ��ǰ��
from SCOTT7.t_customer c join SCOTT7.t_gift g
on c.c_point >= g.g_start where g.g_no = 5;

--#6205) t_emp2, t_post ���̺� ����Ͽ�
--������� �̸�(name)�� ����, ��������(post),  ���������ޡ��� ����ϼ���. 
--���������ޡ��� ���̷� ����ϸ� �ش� ���̰� �޾ƾ� �ϴ� ������ �ǹ��մϴ�. 
--���̴� ����(SYSDATE)�� �������� �ϵ� �Ҽ��� ���ϴ� �����Ͽ� ����ϼ���
select * from scott7.t_emp2;
select * from scott7.t_post;
--oracle join
select e.name �̸�, to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1 "���糪��", nvl(e.post,' ') ��������, p.post "��������"
from scott7.t_emp2 e, scott7.t_post p
where (to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1) between p.s_age and p.e_age;
--ansi join
select e.name �̸�, to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1 "���糪��", nvl(e.post,' ') ��������, p.post "��������"
from scott7.t_emp2 e join scott7.t_post p
on (to_char(sysdate,'yyyy') - to_char(e.birthday,'yyyy') +1) between p.s_age and p.e_age;

----------------------------------------------------------------------------------
--#6206) t_student ���̺�� t_professor ���̺� Join �Ͽ� �л��̸��� �������� �̸��� ����ϼ���. ��! ���������� �������� ���� �л��� ��ܵ� �Բ� ����ϼ���
--** ������ INNER Join ������� ���� ����� ���� OUTER Join �� �غ��� ���غ���
select * from SCOTT7.t_student;
select * from SCOTT7.t_professor;
--oracle join
select s.name "�л��̸�", p.name "�����̸�"
from SCOTT7.t_student s,SCOTT7.t_professor p
where s.profno = p.profno(+);
--ansi join
select s.name "�л��̸�", p.name "�����̸�"
from SCOTT7.t_student s
left outer join SCOTT7.t_professor p
on s.profno = p.profno;

--#6207) t_student, t_professor ���̺� join :  �л��̸��� �������� �̸��� ���, ��! ���� �л��� �������� ���� ���� ��ܵ� ���
--oracle join
select s.name "�л��̸�", p.name "�����̸�"
from SCOTT7.t_student s,SCOTT7.t_professor p
where s.profno(+) = p.profno;
--ansi join
select s.name "�л��̸�", p.name "�����̸�"
from SCOTT7.t_student s
right outer join SCOTT7.t_professor p
on s.profno = p.profno;

--#6208) t_student, t_professor ���̺� join :  �л��̸��� �������� �̸��� ���, ��! ���� �л��� �������� ���� ���� ���, ���������� �������� ���� �л���� ��� ���
select s.name "�л��̸�", p.name "�����̸�"
from SCOTT7.t_student s
full outer join SCOTT7.t_professor p
on s.profno = p.profno;

--���� #6209) t_dept2 ���̺��� �μ��� �� �� �μ��� �����μ����� ����ϼ���
select * from SCOTT7.t_dept2 d1, SCOTT7.t_dept2 d2;
--oracle join
select d1.dname �μ���, d2.dname �����μ���
from SCOTT7.t_dept2 d1, SCOTT7.t_dept2 d2
where d1.pdept = d2.dcode;
--ansi join
select d1.dname �μ���, d2.dname �����μ���
from SCOTT7.t_dept2 d1 join SCOTT7.t_dept2 d2
on d1.pdept = d2.dcode;

--#6210) t_professor ���̺� : ������ȣ, �����̸�, �Ի���, �׸��� �ڽź��� �Ի��� ���� ����� �ο����� ����ϼ���, �� �ڽź��� �Ի����� ���� ������� ������������ ����ϼ���
select * from scott7.t_professor;
select a.profno "������ȣ", a.name "�����̸�", to_char(a.hiredate, 'yyyy-mm-dd') "�Ի���", count(b.hiredate) "�������"
from scott7.t_professor a left outer join scott7.t_professor b
on a.hiredate > b.hiredate group by a.profno, a.name, a.hiredate order by "�������";

SELECT DEPTNO, POSITION, ROUND(AVG(PAY),1) FROM SCOTT7.t_professor GROUP BY DEPTNO, POSITION ORDER BY DEPTNO, POSITION;

select * from scott7.t_emp;
--#7101) t_emp ���̺��� scott ���� �޿��� ���� �޴� ����� �̸��� �޿� ���
select ename, sal from scott7.t_emp where sal > (select sal from scott7.t_emp where ename = 'SCOTT');

--#7102) t_student ���̺��� ���� Ű ū �л��� '�̸�'�� 'Ű'�� ���
select * from scott7.t_student;
--���� Űū �л��� Ű
select max(height) from scott7.t_student;
select name, height from scott7.t_student where height = (select max(height) from scott7.t_student);

--#7103) t_student, t_department ���̺� ����Ͽ� ������ �л��� 1������ ������ �л����� �̸��� 1���� �̸��� ����ϼ���
select * from scott7.t_student,scott7.t_department;

select deptno1 from scott7.t_student where name like '������';

select s.name �л��̸�, d.dname ��1���� 
from scott7.t_student s, scott7.t_department d
where s.deptno1 = d.deptno and s.deptno1 = (select deptno1 from scott7.t_student where name like '������');

--#7104) t_professor, t_department ���̺� : �Ի����� �۵��� �������� ���߿� �Ի��� ����� �̸��� �Ի���, 
--�а����� ����ϼ���

select * from scott7.t_professor;
select * from scott7.t_department;
select to_char(hiredate, 'yyyy-mm-dd') from scott7.t_professor where name like '�۵���'; 

select p.name ������, to_char(p.hiredate,'yyyy-mm-dd') �Ի���, d.dname
from scott7.t_professor p, scott7.t_department d
where p.deptno = d.deptno and p.hiredate > (select hiredate from scott7.t_professor where name like '�۵���'); 


--#7105) t_student ���̺� : 1������ 101���� �а��� ��� �����Ժ��� �����԰� ���� �л����� �̸��� �����Ը� ����ϼ���
select * from scott7.t_student;

select avg(weight) from scott7.t_student where deptno1 = 101;

select name �̸�, weight ������ 
from scott7.t_student
where weight > (select avg(weight) from scott7.t_student where deptno1 = 101);

--#7106) t_professor ���̺��� �ڽɽ� ������ ���� �Ի��ϡڿ� �Ի��� ���� ��, 
--�������� �������� ���ޡ��� ���� �޴� ������ �̸��� �޿�, �Ի����� ����ϼ���
select * from scott7.t_professor;
--�ɽ����� �Ի���
select hiredate from scott7.t_professor where name like '�ɽ�';
--������ ���� ����
select pay from scott7.t_professor where name like '������';
select name �̸�, pay �޿�, to_char(hiredate,'yyyy-mm-dd') �Ի��� 
from scott7.t_professor
where hiredate = (select hiredate from scott7.t_professor where name like '�ɽ�')
and
pay < (select pay from scott7.t_professor where name like '������');


--#7107) t_emp2, t_dept2 ���̺� : �ٹ����� (t_dept2.area) �� ���� ������ ��� ������� 
--                               ���(empno)�� �̸�(name), �μ���ȣ(deptno)�� ����ϼ���
select * from scott7.t_emp2;
select * from scott7.t_dept2;

select dcode from scott7.t_dept2 where area like '��������';

select empno, name, deptno 
from scott7.t_emp2
where deptno in(select dcode from scott7.t_dept2 where area like '��������');

--#7108) t_emp2 ���̺� : ��ü������ �ڰ��� ������ �ּҿ����ڡں��� ������ ���� ����� 
--                        �̸�(name)�� ����(post), ����(pay)�� ����ϼ���.  
--                        ��, ���� ��� ������ õ ���� ���� ��ȣ�� �� ǥ�ø� �ϼ���
select * from scott7.t_emp2;
--���������� �ּҿ�����
select pay from scott7.t_emp2 where post like '����';
select name �̸�, post ����, TO_CHAR(pay, '999,999,999')|| '��' ����
from scott7.t_emp2
where pay >any (select pay from scott7.t_emp2 where post like '����') order by pay desc;

--#7109) t_student ���̺� : ��ü�л��߿��� ü���� ��4�г� �л����� ü�ߡڿ��� 
--                         ���� ���� ������ �л� ���� �����԰� ���� �л� �� �̸��� �г�� �����Ը� ����ϼ��� <ALL

select * from SCOTT7.t_student;
--4�г� �л����� ü�ߡ�
select weight from scott7.t_student where grade = 4;

select name �̸�, grade �г�, weight ������
from SCOTT7.t_student
where weight <all (select weight from scott7.t_student where grade = 4);

---------------------------����Į�� Sub Query---------------------------
--#7201) t_student ���̺��� ��ȸ�Ͽ� �� ���г⺰�� �ִ� Ű�ڸ� ���� �л����� 
--        �г�� �̸��� Ű�� ����ϼ���,�г� ������������ ���

select * from SCOTT7.t_student;
--�г⺰ �ִ� Ű--
select grade, max(height) from SCOTT7.t_student group by grade;

select grade �г�, name �̸�, height Ű
from SCOTT7.t_student
where (grade, height) in(select grade, max(height) from SCOTT7.t_student group by grade) order by "�г�";

--#7202) t_professor , t_department ���̺� :  
--�� ���а����� �Ի����� ���� ������ �������� ������ȣ�� �̸�, �а����� ����ϼ���.  
--�� �а��̸� ������ �������� �����ϼ���
select * from scott7.t_professor;
select * from scott7.t_department;

select deptno, min(hiredate) from scott7.t_professor group by deptno; 
select p.profno ������ȣ, p.name �����̸�, to_char(p.hiredate,'yyyy-mm-dd') �Ի���, d.dname �а���
from SCOTT7.t_professor p, SCOTT7.t_department d
where p.deptno = d.deptno 
and (p.deptno, p.hiredate) in(select deptno, min(hiredate) 
from scott7.t_professor group by deptno) order by "�а���";

--#7203) t_emp2 ���̺� : �����޺��� �ش����޿��� �ִ� �������� �޴� ������ �̸��� ����, ������ ����ϼ���,  
--                      ��, ���������� �������� �����ϼ���
SELECT * from scott7.t_emp2;
--�����޺� �ش������� �ִ뿬����--
select post, max(pay) from scott7.t_emp2 group by post;

select name �����, post ����, to_char(pay,'999,999,999') ||'��' ����
from scott7.t_emp2
where (post, pay) in(select post, max(pay) from scott7.t_emp2 group by post) order by "����";

--#7204) t_emp2, t_dept2 ���̺� : �ڰ� �μ��� ��� �������� ���ϰ� 
--			�� �߿��� ����� ������ ���� ���� �μ����� ��տ������� ���� �޴� 
--			�������� �μ���, ������, ������ ��� �ϼ���

select * from scott7.t_emp2;
select * from scott7.t_dept2;
--�� �μ��� ��տ���
select avg(pay) from scott7.t_emp2 group by deptno;

select d.dname �μ���, e.name ������, e.pay ����
from scott7.t_emp2 e, scott7.t_dept2 d
where e.deptno = d.dcode 
and e.pay <all (select avg(pay) from scott7.t_emp2 group by deptno)
order by "����";
