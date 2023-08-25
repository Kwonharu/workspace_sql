--SEQUENCE

--시퀀스 생성
create SEQUENCE seq_author_id
INCREMENT by 1
start with 7
nocache;
--nocache : 미리 뭉탱이 준비하지 않고 하나하나 처리하겠다.
--          default는 cache.

--시퀀스 사용
insert into author
values(seq_author_id.nextVal, '모래고양이', '귀엽다');

--시퀀스 조회
select *
from user_sequences;

--작가 시퀸스 현재 값
select seq_author_id.currval
from dual;
-- 문법상 from절이 필요한데 select에서 요청한 값이 존재하는 테이블이 없을 때 dual 사용

--시퀀스 삭제
drop SEQUENCE seq_author_id;



select *
from author;










