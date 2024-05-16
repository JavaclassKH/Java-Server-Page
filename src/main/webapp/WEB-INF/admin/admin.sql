create table board (
idx int not null auto_increment,             /* 게시글의 고유번호*/
mid varchar(30) not null,                    /* 게시글 작성자 아이디 */
nickName varchar(20) not null,               /* 게시글 작성자 닉네임 */
title varchar(100) not null,                 /* 게시글 제목 */
content text not null,                       /* 글 내용 */
readNum int default 0,                       /* 글 조회수 */
hostIp varchar(40) not null,                 /* 글 작성자 IP */
openSw char(6) default 'OK',                 /* 게시글 공개 여부 */
wDate datetime default now(),                /* 글 작성 날짜 */
good int default 0,                          /* 좋아요 수 */
primary key(idx),                            /* 기본 키 : 고유번호 */
foreign key(mid) references member(mid)      /* 외래 키 : 아이디 */ 
); 

-- 신고 테이블
create table complain 
idx int not null auto_increment,             /* 신고테이블 고유번호 */
part varchar(24) not null,                   /* 신고위치분류(게시판:board, 자료실:pds, 방명록: guest) */
partIdx int not null,                        /* 신고위치된곳 글의 고유번호 */               
CpMid varchar(20) not null,                  /* 신고자의 아이디 */
cpContent text not null,                     /* 신고사유 */
cpDate datetime default now(),               /* 신고 날짜 */
primary key(idx)
);

drop table complain;

insert into complain values(default, 'board', 25,'test3','신고용 글입니다',default);

select * from complain;

select c.*, b.title as title , b.nickName, as nickName b.mid as mid from complain c, board b where c.partIdx = b.idx;

select c.*, date_format(c.cpDate, '%Y-%m-%d %H:%i') as cpDate, b.title as title , b.nickName as nickName, b.mid as mid from complain c, board b where c.partIdx = b.idx;