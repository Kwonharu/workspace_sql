drop table book;

drop table author;

drop SEQUENCE seq_author_id;


--table
create table book(
    book_id     NUMBER(5),
    title       varchar2(100),
    pubs        varchar2(100),
    pub_date    date,
    author_id   NUMBER(5),
    PRIMARY key(book_id)
);

create table author(
    author_id     NUMBER(5),
    author_name   varchar2(100),
    author_desc   varchar2(100),
    PRIMARY key(author_id)
);

--아 맞다
ALTER TABLE book add(
    constraint book_fk foreign key(author_id) references author(author_id)
);

--drop table book;


--sequence
create SEQUENCE seq_book_id
INCREMENT by 1
start with 1
nocache;

create SEQUENCE seq_author_id
INCREMENT by 1
start with 1
nocache;

--drop SEQUENCE seq_book_id;


--insert book
insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '할로우 나이트', '플레이스테이션', '2017-02-25', 1);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '다키스트 던전', '스위치', '2016-01-19', 2);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '하프라이프', '스팀', '1998-11-19', 3);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '테라리아', '앱스토어', '2011-05-16', 4);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '철권 7', '플레이스테이션', '2017-06-01', 5);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '스카이림', 'x-box', '2011-11-11', 6);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '포탈', '스팀', '2007-10-09', 3);

insert into book(book_id, title, pubs, pub_date, author_id)
values(seq_book_id.nextVal, '다키스트 던전 2', '에픽스토어', '2023-05-08', 2);

--update book
--set pubs = '에픽스토어'
--where book_id = 8;

--update book
--set author_id = 1
--where book_id = 1;


--insert author
insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, 'Team Cherry', '인디 메트로바이나의 신');

insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '레드훅', '한글화 이슈');

insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '벨브', '이제 게임 안 만듭니다');

insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, 'Re-Logic', '아는 사람만 아는 맛집');

insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '반다이 남코', '8에 요시 나오는 거 맞죠?');

insert into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '베데스다', '그들은 신이야');

/*
시퀀스 적용 안 됨 젠장

--INSERT ALL
insert all into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '캡콤', '하이하이 로크만')
insert all into author(author_id, author_name, author_desc)
values(seq_author_id.nextVal, '토비폭스', '박수칠 때 못 떠남')
select *
from dual;

--UNION ALL 
insert into author(author_id, author_name, author_desc)
select seq_author_id.nextVal, '캡콤', '하이하이 로크만'
from dual union all
select seq_author_id.nextVal, '토비폭스', '박수칠 때 못 떠남'
from dual;
*/



--출력
select  book_id, 
        title, 
        pubs, 
        pub_date,
        b.author_id, 
        author_name, 
        author_desc
from book b, author a
where b.author_id = a.author_id;


--반다이 남코의 author_desc 정보를 ‘하라다 열선비’ 로 변경해 보세요
update author
set author_desc = '하라다 열선비'
where author_name = '반다이 남코';

--author 테이블에서 Re-Logic 데이터를 삭제해 보세요 -> 삭제 안됨
delete from author
where author_name = 'Re-Logic';



select * 
from book;

select * 
from author;


insert into author
values(seq_author_id.nextVal, 'Team Cherry', '인디 메트로바이나의 신');


delete from author
where author_id = 7;

update author
set author_name = 'Dennaton Games',
    author_desc = '뜨거운선 우리엄마'
where author_name = 'Ubisoft'
and author_desc = '유니티로 먹고삼';

select  author_id,
        author_name,
        author_desc
from author;

ROLLBACK;


select  b.book_id,
        b.title,
        b.pubs,
        b.pub_date,
        b.author_id,
        a.author_name
from book b, (select  author_id,
                      author_name
              from author) a
where b.author_id = a.author_id;


select  b.book_id,          b.title,          b.pubs,          b.pub_date,          b.author_id,          a.author_name  from book b, (select  author_id,                        author_name                from author) a  where b.author_id = a.author_id; 


insert into book
values(seq_book_id.nextVal, 'Gta5', 'X-box', '2013-09-17', 13);

delete from book
where book_id = 10;

update book
set title = 'asdf',
    pubs = 'asdf',
    pub_date = '2000-01-01',
    author_id = 10
where book_id = '10';


