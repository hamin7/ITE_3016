show databases;

drop table member;

create table member(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
reg_date datetime not null
);

create table test(
num_id int not null primary key auto_increment,
title varchar(50) not null,
content text not null
);

show tables;
drop table test;

insert into member(id, passwd, name, reg_date)
values('Federico@gmail.com','1234', 'Federico',now());

insert into member(id, passwd, name, reg_date)
values('Mattia@gmail.com','1111','Mattia',now());

select * from member;

select id, passwd from member;

select id, passwd from member where id='hongkd@aaa.com';

update member set passwd='3579' where id='hongkd@aaa.com';

select * from member where id='hongkd@aaa.com';

delete from member where id='hongkd@aaa.com';

delete from member;

create table board(
num int not null primary key auto_increment,
writer varchar(10) not null,
email varchar(30),
subject varchar(50) not null,
passwd varchar(12) not null,
reg_date datetime not null,
readcount int default 0,
ref int not null,
re_step smallint not null,
re_level smallint not null,
content text not null,
ip varchar(20) not null
);

alter table member
add address varchar(100) not null;

alter table member
add tel varchar(20) not null;

update member
set address = 'Holloway, London, N5, England', tel='010-1886-0601'
where id='Federico@gmail.com';

update member
set address='Corso Gaetano Scirea, 50, Turin, Italy', tel='010-2482-8229'
where id='Mattia@gmail.com';


insert into member(id, passwd, name, reg_date, address, tel)
values('Gonzalo@gmail.com', '1109', 'Gonzalo', now(), 'Via Piccolomini 5, 20151, Milan, Italy', '010-0513-2011');

create table manager(
managerId varchar(50) not null primary key,
managerPasswd varchar(16) not null
);

insert into manager(managerid, managerPasswd)
values('bookmaster@shop.com', '123456');


