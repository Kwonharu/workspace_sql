select  person_id,
        name,
        hp,
        company
from person
order by person_id asc;


delete from person
where person_id = 2222;



insert into person
values(seq_person_id.nextVal, '샌즈', 'sucction', 'bondage');


select  person_id,
        name,
        hp,
        company
from person
where person_id = 1;


select *
from person;


commit;






