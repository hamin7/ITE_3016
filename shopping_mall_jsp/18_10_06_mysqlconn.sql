show databases;

create table member(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
reg_date datetime not null,
address varchar(100) not null,
tel varchar(20) not null
);

insert into member(id, passwd, name, reg_date, address, tel)
values('Federico@gmail.com','0233','Federico',now(),'Corso Gaetano Scirea, 50, Turin, Italy','010-2482-8229');

insert into member(id, passwd, name, reg_date, address, tel)
values('Mattia@gmail.com','0513','Mattia',now(),'Via Piccolomini 5, 20151, Milan, Italy','010-0513-2011');

desc member;

select * from member;     // 테이블에 저장되어 있는 레코드를 검색 할 때는 select문을 사용한다 // '*'은 모든 필드를 뜻함

/*
select col_name1, col_name2     // 레코드에 표시되는 필드는 select문과 from절 사이에 기술한 필드만 표시된다.
from table_name 
where condition;     // where절은 조건을 기술하는 구문으로, condition 위치에 조건을 기술한다.
*/

select id, name
from member;     // member 테이블의 모든 코드가 검색되는데, 하나의 레코드에 표시되는 필드는 id, password 필드만 표시된다.

select id, passwd from member wher id = 'abc';     // member 테이블에서 id 필드값이 abc인 레코드만 검색된다. 이 때 조건의 비교대상이 되는 필드의 데이터 타입이 문자열 이면 대응되는 조건 값을 ''로 감싸야 한다

select id, passwd from member where id = 'Federico@gmail.com';     // 지정한 아이디를 가진 레코드의 id, passwd필드를 표시

update member set tel = '010-0233-2018' where id='Federico@gmail.com';     // 

select * from member where id = 'Federico@gmail.com';     // id값이 Federico~인 레코드를 모두 확인

update member set passwd='0333' where id = 'Federico@gmail.com';

delete from member where id='Mattia@gmail.com';
delete from member;

drop table member;

show tables;
