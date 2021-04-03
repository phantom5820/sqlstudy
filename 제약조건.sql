--��������(Constraint)
--#9001)   ���� ������ �����ϴ� t_emp3 ���̺� ����
--���������� ������� �ʴ� ���
grant RESOURCE, create view, create PROCEDURE, references CONNECT to scott7;
CREATE TABLE t_emp4(
    no number(4) primary key,
    name varchar2(10) not null,
    jumin varchar2(13) not null unique, --���������� ������ ��������
    area number(1) check(area < 5),
    deptno varchar2(6) REFERENCES scott7.t_dept2(dcode) -- t_dept2 ���̺��� dcode �÷��� ����
);
select * from t_emp4;

drop table t_emp4 CASCADE CONSTRAINTS;

-- �� ���� ������ ������ ���� ���� �׸����ε� ���� ����.
CREATE TABLE t_emp4(
    no number(4),
    name varchar2(10) not null,
    jumin varchar2(13) not null, --���������� ������ ��������
    area number(1),
    deptno varchar2(6), -- t_dept2 ���̺��� dcode �÷��� ����
    primary key(no), -- �������� ���� ���� ����
    unique(jumin),
    check(area < 5),
    FOREIGN key (deptno) REFERENCES scott7.t_dept2(dcode)
);
-- #9002
--�������Ǹ��� ����Ͽ� �ۼ�
create table t_emp3(
     no number(4) CONSTRAINT emp3_no_pk primary key,
    name varchar2(10) CONSTRAINT emp3_name_nn not null,
    jumin varchar2(13) 
        CONSTRAINT emp3_jumin_nn not null 
        CONSTRAINT emp3_jumin_uk unique,
    area number(1) CONSTRAINT emp3_area_ck check(area < 5),
    deptno varchar2(6) CONSTRAINT emp3_deptno_fk REFERENCES scott7.t_dept2(dcode)
);
drop table t_emp3 CASCADE CONSTRAINTS;

CREATE TABLE t_emp3(
    no number(4),
    name varchar2(10) not null,
    jumin varchar2(13) not null, --���������� ������ ��������
    area number(1),
    deptno varchar2(6), -- t_dept2 ���̺��� dcode �÷��� ����
    CONSTRAINT emp3_no_pk primary key(no), -- �������� ���� ���� ����
    CONSTRAINT emp3_jumin_uk unique(jumin),
    CONSTRAINT emp3_area_ck check(area < 5),
    CONSTRAINT emp3_deptno_fk FOREIGN key (deptno) REFERENCES scott7.t_dept2(dcode)
);

--#9003)  t_emp4, t_emp3 �� �����Ǿ� �ִ� �������� ��ȸ�ϱ�(�������� �̸� �ָ�!)
select * from u;
drop table emp3;
create table emp3(
    no number(4),
    name varchar2(10) constraint emp3_name_nn not null,
    jumin varchar2(13) constraint emp3_jumin_nn not null, --���������� ������ ��������
    area number(1),
    deptno varchar2(6), -- t_dept2 ���̺��� dcode �÷��� ����
    CONSTRAINT emp3_no_pk primary key(no), -- �������� ���� ���� ����
    CONSTRAINT emp3_jumin_uk unique(jumin),
    CONSTRAINT emp3_area_ck check(area < 5)
);

select owner, constraint_name, constraint_type, status from user_constraints where table_name = 'EMP3';

--#9005)  emp3 �� �������ǿ� �´� / ����Ǵ� DML �ۼ��غ���, �����޼��� Ȯ���غ���
insert into emp3 values(1,'����Ŭ','1234561234567', 4, 1000);
--�ι� �����ϸ� ���� pk ���� ����
insert into emp3 values(2,'����Ŭ','1234561234567', 4, 1000);
--jumin unique ���� ������ ����
insert into emp3 values(2,'����Ŭ','22222222222222222', 4, 1000);
-- number(13) �ڸ��� �ʰ� ����
insert into emp3 values(2,'tiger','2222222222222', 10, 1000);
-- check (area < 5) ����
select * from scott7.t_dept2;
select * from emp3;
insert into emp3 values(2,'tiger','2222222222222', 3, 2000);
delete from emp3 where name like 'tiger';
insert into emp3 (no, jumin, area, deptno) values(2, '3333333333333', 4, 1001);
--not null ����
--insert �Ӹ� �ƴ϶� ��� DML�� ���ؼ� ���������� ������ �Ѵ�
update emp3 set area = 10 where no = 1;

-------------------------------------------------------------------------
-- ���̺� ������ �������� �߰��ϱ�
--#9005)   ALTER ��� ����Ͽ� ���̺� �� �������� �߰�����
--          ������ ������ emp3 ���̺��� name �÷��� UNIQUE �������� �߰��ϱ�
-- alter ��� ����ؼ� ���̺��� �������� �߰�/���� ����
alter table emp3 add constraint emp3_name_uk unique(name);

--#9006) emp3 ���̺��� area �÷��� NOT NULL �������� �߰��غ�����
--(���� ADD CONSTRAINT �� �ɱ�?)
alter table emp3 add constraint emp3_area_nn not null(area);
alter table emp3 modify (area constraint emp3_area_nn not null);

--#9007)    �ܷ�Ű �߰�
--t_emp4 ���̺��� name �÷��� t_emp2 ���̺��� name �÷��� ���� �����ϵ��� ����Ű ���������� �����ϼ���
--(�ܷ�Ű���� �� ���  t_emp2 �� ���θ�(parent)���̺� �̶� �ϰ� t_emp4 �� ���ڽ�(child)���̺� �̶� �մϴ�)
--���� �ɱ�?
-- �Ʒ� ���� ó������ ����!
alter table t_emp4 
add constraint emp4_name_fk foreign key(name) 
references t_emp2(name);
-- ������ : �����Ǵ� �θ����̺��� �÷��� pk �̰ų� uk �̾���Ѵ�. 
--�׷��� ���� �� �θ����̺� ���������� uk �� pk�� �ɾ��ְ�
alter table t_emp2 add constraint t_emp2_name_uk unique(name);
-- �鹮���� �������ָ� �ȴ�.
alter table t_emp4 
add constraint emp4_name_fk foreign key(name) 
references t_emp2(name);

create table patient (
    id varchar2(20) primary key,
    name char(10),
    sex char(1), 
    phone char(20),
    constraint sex_ck check(sex = 'f' or sex = 'm'),
    constraint id_fk foreign key(id) references t_emp2(name)
);