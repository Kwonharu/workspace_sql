/*------------------------------------------
 DDL (테이블)
------------------------------------------*/

--테이블 생성
create table book(
    book_id     NUMBER(5),
    title       varchar2(50),
    author      varchar2(10),
    pub_date    date
);

--컬럼 추가
--book 테이블에 pubs 칼럼 추가
alter table book add(
    pubs    varchar2(50)
);

--컬럼 수정
--book 테이블에 title 칼럼에 VARCHAR2(50) --> VARCHAR2(100)
alter table book MODIFY(
    title   VARCHAR2(100)
);

--book 테이블에 title 칼럼 명 --> subject
alter table book RENAME COLUMN title to subject;

--컬럼 삭제
--book 테이블에 author 컬럼 삭제
alter table book drop (author);

--테이블 명 수정
--book --> article
RENAME book to article;

--테이블 삭제
drop table article;



/*-----------------------------------
테이블 만들기
-----------------------------------*/
--author 테이블
create table author(
    author_id       NUMBER(10),
    author_name     varchar2(100)   not null,
    author_desc     varchar2(500),
    PRIMARY KEY(author_id)
);

--book 테이블
create table book(
    book_id     number(10),
    title       varchar2(100)   not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   NUMBER(10),
    primary key(book_id),
    constraint book_fk foreign key (author_id) references author(author_id)
  --   제약      샌즈      FK   (내 테이블 컬럼)  참조   참조할 테이블(칼럼)
);


select *
from book;

select *
from tab;





