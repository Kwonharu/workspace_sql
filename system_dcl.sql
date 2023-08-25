--DCL (계정)

--계정 삭제
drop user webdb cascade;

--계정 생성
create user webdb IDENTIFIED by 1234;

--계정 권한 부여
grant resource, connect to webdb;

--계정 PW 수정
alter user webdb IDENTIFIED BY webdb;



/*
--해당 계정의 tab 조회
select *
from tab;
*/





























