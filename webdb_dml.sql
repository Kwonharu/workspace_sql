/*------------------------------------------
 DML (테이블의 데이터)
     등록 (Create)
     조회 (Read)
     수정 (Update)
     삭제 (Delete)
------------------------------------------*/
--insert 문
insert into author 
values(1, '쏘가리', '위험하다');

insert into author(author_id, author_name)
values(2, '블루길');


/*
--다중 insert 문

--INSERT ALL
insert all into author(author_id, author_name, author_desc)
values(3, '영인', '미래 여친')
into author(author_id, author_name, author_desc)
values (4, '아키', '용님과 희생양')
select *
from dual;

--UNION ALL 
insert into author(author_id, author_name, author_desc)
select 5, '영인', '미래 여친'
from dual union all
select 6, '아키', '용님과 희생양'
from dual;
*/


--update 문
update author
set author_name = '지나가던개',
    author_desc = '여우털 알레르기';

--특정 컬럼만 수정할 때
update author
set author_name = '지나가던개',
    author_desc = '여우털 알레르기'
where author_id = 1;

update author
set author_name = '감다뒤개'
where author_id = 1;

update author
set author_desc = '인?기 작가'
where author_id = 3 
or author_id = 4;

update author
set author_desc = '인?기 작가'
where author_id between 3 and 4;

update author
set author_desc = '인?기 작가'
where author_id in (3, 4);


--delete 문
DELETE FROM author
where author_id in (5, 6, 8);



select *
from author;



/*
-- commit / rollback

 git의 그것과 유사하다. commit 후 가상 복사본이 만들어지고 거기서 작업한다.
 commit : 가상의 복사본을 만든다. 
 commit 이후 재commit 시 : 작업물을 덮어씌운다. 덮어씌우면 rollback 불가능.
 rollback : 가상 작업물을 버리고 commit 시점으로 돌아간다.

 !!! 이 명령은 DML만 적용된다. DCL, DDL은 commit을 무시하고 즉시 적용된다. !!!
*/
commit;
rollback;


insert into author
values(5, '북극여우', '털갈이');

insert into author
values(6, '페넥', '귀큰놈');

















