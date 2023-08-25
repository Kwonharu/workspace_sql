--DDL (테이블)

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




select *
from article;

drop table book;

select *
from tab;


/*
- 테이블, 컬럼 명명 규칙
문자로 시작
30자 이내
A-Z, a-z, 0-9, _, $, #
오라클 예약어는 사용할 수 없음
*/




