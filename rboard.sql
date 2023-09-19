
DROP table rboard;
drop SEQUENCE seq_rboard_no;

--테이블 생성
create table rboard(
    no          NUMBER,
    user_no     number          not null,
    title       varchar2(500),
    content     varchar2(4000),
    hit         number,
    reg_date    date,
    group_no    number,
    order_no    number,
    depth       number,
    PRIMARY key(no),
    constraint rboard_fk foreign key (user_no) references users(no)
  --   제약      샌즈     FK  (내 테이블 컬럼)   참조   참조할 테이블(칼럼)
);


--sequence 생성
create SEQUENCE seq_rboard_no
INCREMENT by 1
start with 1
nocache;


--insert
insert into rboard
values(SEQ_RBOARD_NO.nextval, 1, '여우', '도련님', 0, sysdate, 1, 1, 0);

insert into rboard
values(SEQ_RBOARD_NO.nextval, 2, '용', '밤이슬', 0, sysdate, 2, 1, 0);

insert into rboard
values(SEQ_RBOARD_NO.nextval, 3, '뱀', '사슴벌레 칩', 0, sysdate, 3, 1, 0);

insert into rboard
values(SEQ_RBOARD_NO.nextval, 10, 'Their', 'Deep Dark Fantasies ♂', 0, sysdate, 4, 1, 0);


select * 
from rboard 
order by group_no DESC, order_no ASC;







select *
from rboard;




