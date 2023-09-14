drop table person;


create table person(
    no          NUMBER(4),
    name        varchar2(50),
    phone_num   varchar2(50),
    company_num varchar2(50),
    PRIMARY key(no)
);

alter table person 
rename COLUMN no to person_id;

alter table person
MODIFY name not NULL;

alter table person 
rename COLUMN phone_num to hp;

alter table person 
rename COLUMN company_num to company;



create SEQUENCE seq_person_id
INCREMENT by 1
start with 1
nocache;

DROP SEQUENCE seq_person_id;

insert into person
values(seq_person_id.nextVal, '수아', '010-0314-0314', '02-2017-1106');

insert into person
values(seq_person_id.nextVal, '미미르', '010-0222-0222', '02-2017-1106');

insert into person
values(seq_person_id.nextVal, '아린', '010-0501-0501', '02-2017-1106');

insert into person
values(seq_person_id.nextVal, '유화', '010-0925-0925', '02-2019-0429');

insert into person
values(seq_person_id.nextVal, '연화', '010-0925-0926', '02-2019-0429');


select  person_id,
        name,
        hp,
        company
from person
where name like '%아%';


delete from person
where person_id = 30;


update person
set  name = '심재설',
     hp = '010-1910-0903',
     company = '02-1971-0724'
where person_id = 7; 



select *
from person
order by person_id;


select *
from all_tab_columns
where table_name = 'PERSON';


commit;



