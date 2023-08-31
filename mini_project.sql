drop table person;

create table person(
    no          NUMBER(4),
    name        varchar2(50),
    phone_num   varchar2(50),
    company_num varchar2(50),
    PRIMARY key(no)
);

create SEQUENCE seq_person_no
INCREMENT by 1
start with 1
nocache;

--DROP SEQUENCE seq_person_no;

insert into person
values(seq_person_no.nextVal, '수아', '010-0314-0314', '02-2017-1106');

insert into person
values(seq_person_no.nextVal, '미미르', '010-0222-0222', '02-2017-1106');

insert into person
values(seq_person_no.nextVal, '아린', '010-0501-0501', '02-2017-1106');

insert into person
values(seq_person_no.nextVal, '유화', '010-0925-0925', '02-2019-0429');

insert into person
values(seq_person_no.nextVal, '연화', '010-0925-0926', '02-2019-0429');




select *
from person;





