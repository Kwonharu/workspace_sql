
drop table users;
drop SEQUENCE seq_users_no;

--users 테이블 생성
create table users(
    no          number,
    id          varchar2(20)    UNIQUE not null,
    password    varchar2(20)    not null,
    name        varchar2(20),
    gender      varchar2(10),
    primary key(no)
);

--sequence 생성
create SEQUENCE seq_users_no
INCREMENT by 1
start with 1
nocache;


--insert
insert into users
values(seq_users_no.nextval, 'sua', '0314', '수아', 'female');


--select
select  no,
        name
from users
where no = 1
and password = '0314';

select  no,
        id,
        password,
        name,
        gender
from users
where no = 1;


--update
update users
set  password = '0314',
     name = '수아',
     gender = 'female'
where no = 1; 

update users
set  no = no + 1
where no = 9; 


--delete
delete users
where no = 33;


select *
from users;




SELECT *
FROM user_tab_columns -- 해당 계정에 속한 테이블 
   --  dba_tab_columns 전체 테이블의 경우 
WHERE TABLE_NAME = 'USERS';   -- 조회 할 테이블 명



commit;




---------------------------------------------------------------------------------
-- board table


drop table board;
drop SEQUENCE seq_board_no;

--board 테이블 생성
create table board(
    no          number,
    title       varchar2(500)    not null,
    content     varchar2(4000),
    hit         number           DEFAULT 0,
    reg_date    date             not null,
    user_no     number           not null,
    primary key(no),
    constraint board_fk foreign key (user_no) references users(no)
  --   제약      샌즈     FK  (내 테이블 컬럼)  참조   참조할 테이블(칼럼)
);

--sequence 생성
create SEQUENCE seq_board_no
INCREMENT by 1
start with 1
nocache;


--insert
insert into board
values (seq_board_no.nextval, 
        '여우의 꿈', 
        '청명한 달빛 그득한 죽림 어딘가
오색 빛 나비 안내한 오솔길 따라
나는 가만히 침소에 든 그댈 보아요
꿈결에 아득한 꿈결에
이른 서리 아침에 잠에서 깨어
문득 목 놓아 울고 말았죠
사무치게 보고 싶은 그대 그리며

계속 모른척할 건가요
결국 난 못 참고 토라져
소녀는 원래 복잡 한 거죠
수줍어도 대담할 땐 꺄~~~?!

부디 이 마음 알아채지 말아 주세요
진짜 진짜 정말 정말 보고팠어요
밝은 달 아래서 정화수 떠 놓고 빌었다죠
그댈 감쪽같이 속여요 전부
여우처럼 숨길 거예요
욕심 많고 거짓뿐인 소녀의 꿈은
다 그런 법이죠
모른 체해줘요', 
        0, 
        SYSDATE, 
        1);

insert into board
values (seq_board_no.nextval, 
        '설야', 
        '눈이 내리던 그날의 하늘
기억하느냐고 너에게 물어봤어
안개 속으로 숨긴 마음을
눈송이 위에 실어 보네

별이 가득한 그날의 하늘
한 줌에 쥐어서 너에게 내밀었어
별 무리 속에 감춘 그리움
유성이 되어 떨어졌지

소복 소복 밟혀 녹아내리고
하늘 멀리 스러져도
함박눈 세상을 덮고 은하수 차오를테니
애타게 내민 손이 부디 닿기를

눈은 쌓여가고 별은 돌아와서
끝없는 환상을 반복하며 울어도
다시 하루 눈을 뜨면
내 눈앞엔 네 웃음이 돌아와
하얀 눈송이가 밝은 은하수가
모두 흘러내려 울어도
해매이는 여우는 저 하늘 아래
별자리를 보며 그저 노래 할 테니', 
        0, 
        SYSDATE, 
        4);



--boardListSelect
select  b.no,
        b.title,
        u.name,
        b.hit,
        b.reg_date
from board b, users u
where b.user_no = u.no;


SELECT  BO.no,
        BO.title,
        BO.content,
        US.name,
        BO.hit,
        TO_CHAR(BO.reg_date, 'YYYY-MM-DD HH:MI') regDate,
        US.no userNo
FROM board BO, users US
WHERE BO.user_no = US.no				 
order by reg_date desc;



--boardSelect
select  u.name,
        b.hit,
        to_char(b.reg_date, 'YYYY-MM-DD HH:MI') regDate,
        b.title,
        b.content,
        b.no,
        b.user_no userNo
from board b, users u
where b.user_no = u.no
and b.no = 9;



--boardHitUpdate
update board
set  hit = hit + 1
where no = 1; 


--update board
--set no = 10
--where no = 14;

update board
set title = 'asd',
    content = 'asd'
where no = 10;

--delete
delete board
where no = 5;





select *
from board;


commit;

rollback;




