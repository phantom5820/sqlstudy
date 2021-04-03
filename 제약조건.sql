--제약조건(Constraint)
--#9001)   다음 조건을 만족하는 t_emp3 테이블 생성
--제약조건을 명시하지 않는 방법
grant RESOURCE, create view, create PROCEDURE, references CONNECT to scott7;
CREATE TABLE t_emp4(
    no number(4) primary key,
    name varchar2(10) not null,
    jumin varchar2(13) not null unique, --제약조건은 여러개 설정가능
    area number(1) check(area < 5),
    deptno varchar2(6) REFERENCES scott7.t_dept2(dcode) -- t_dept2 테이블의 dcode 컬럼을 참조
);
select * from t_emp4;

drop table t_emp4 CASCADE CONSTRAINTS;

-- 위 생성 쿼리를 다음과 같이 별도 항목으로도 정의 가능.
CREATE TABLE t_emp4(
    no number(4),
    name varchar2(10) not null,
    jumin varchar2(13) not null, --제약조건은 여러개 설정가능
    area number(1),
    deptno varchar2(6), -- t_dept2 테이블의 dcode 컬럼을 참조
    primary key(no), -- 제약조건 따로 지정 가능
    unique(jumin),
    check(area < 5),
    FOREIGN key (deptno) REFERENCES scott7.t_dept2(dcode)
);
-- #9002
--제약조건명을 명시하여 작성
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
    jumin varchar2(13) not null, --제약조건은 여러개 설정가능
    area number(1),
    deptno varchar2(6), -- t_dept2 테이블의 dcode 컬럼을 참조
    CONSTRAINT emp3_no_pk primary key(no), -- 제약조건 따로 지정 가능
    CONSTRAINT emp3_jumin_uk unique(jumin),
    CONSTRAINT emp3_area_ck check(area < 5),
    CONSTRAINT emp3_deptno_fk FOREIGN key (deptno) REFERENCES scott7.t_dept2(dcode)
);

--#9003)  t_emp4, t_emp3 에 설정되어 있는 제약조건 조회하기(제약조건 이름 주목!)
select * from u;
drop table emp3;
create table emp3(
    no number(4),
    name varchar2(10) constraint emp3_name_nn not null,
    jumin varchar2(13) constraint emp3_jumin_nn not null, --제약조건은 여러개 설정가능
    area number(1),
    deptno varchar2(6), -- t_dept2 테이블의 dcode 컬럼을 참조
    CONSTRAINT emp3_no_pk primary key(no), -- 제약조건 따로 지정 가능
    CONSTRAINT emp3_jumin_uk unique(jumin),
    CONSTRAINT emp3_area_ck check(area < 5)
);

select owner, constraint_name, constraint_type, status from user_constraints where table_name = 'EMP3';

--#9005)  emp3 에 제약조건에 맞는 / 위배되는 DML 작성해보고, 에러메세지 확인해보자
insert into emp3 values(1,'오라클','1234561234567', 4, 1000);
--두번 실행하면 오류 pk 문제 때문
insert into emp3 values(2,'오라클','1234561234567', 4, 1000);
--jumin unique 오류 때문에 에러
insert into emp3 values(2,'오라클','22222222222222222', 4, 1000);
-- number(13) 자릿수 초과 오류
insert into emp3 values(2,'tiger','2222222222222', 10, 1000);
-- check (area < 5) 오류
select * from scott7.t_dept2;
select * from emp3;
insert into emp3 values(2,'tiger','2222222222222', 3, 2000);
delete from emp3 where name like 'tiger';
insert into emp3 (no, jumin, area, deptno) values(2, '3333333333333', 4, 1001);
--not null 오류
--insert 뿐만 아니라 모든 DML에 대해서 제약조건은 동작을 한다
update emp3 set area = 10 where no = 1;

-------------------------------------------------------------------------
-- 테이블 생성후 제약조건 추가하기
--#9005)   ALTER 명령 사용하여 테이블 에 제약조건 추가가능
--          위에서 생성한 emp3 테이블의 name 컬럼에 UNIQUE 제약조건 추가하기
-- alter 명령 사용해서 테이블의 제약조건 추가/수정 가능
alter table emp3 add constraint emp3_name_uk unique(name);

--#9006) emp3 테이블의 area 컬럼에 NOT NULL 제약조건 추가해보세요
--(과연 ADD CONSTRAINT 로 될까?)
alter table emp3 add constraint emp3_area_nn not null(area);
alter table emp3 modify (area constraint emp3_area_nn not null);

--#9007)    외래키 추가
--t_emp4 테이블의 name 컬럼이 t_emp2 테이블의 name 컬럼의 값을 참조하도록 참조키 제약조건을 설정하세요
--(외래키에서 이 경우  t_emp2 를 ‘부모(parent)테이블’ 이라 하고 t_emp4 를 ‘자식(child)테이블’ 이라 합니다)
--과연 될까?
-- 아래 문장 처음에는 에러!
alter table t_emp4 
add constraint emp4_name_fk foreign key(name) 
references t_emp2(name);
-- 이유는 : 참조되는 부모테이블의 컬럼은 pk 이거나 uk 이어야한다. 
--그래서 먼저 ↓ 부모테이블에 제약조건을 uk 나 pk로 걸어주고
alter table t_emp2 add constraint t_emp2_name_uk unique(name);
-- ↓문장을 실행해주면 된다.
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