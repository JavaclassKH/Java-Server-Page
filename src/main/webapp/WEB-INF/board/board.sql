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

insert into board values (default,'admin','관리자','게시판 서비스 시작','게시판 서비스 시작합니다 - 관리자',default,'192.168.50.64','OK',default,default);

desc board;

drop table board;

select * from board;

-- 시간단위, 23이 나오면 작성한지 23시간이 지났다는 것
select *, timestampdiff(hour, wDate, now()) as hour_diff from board;

-- 0은 오늘, -1은 하루 지남
select *, datediff(wDate, now()) as date_diff from board;

select *, timestampdiff(hour, wDate, now()) as hour_diff from board;


select *, datediff(wDate, now()) as date_diff from board;

select idx as nextIdx ,title as nextTitle from board where idx > 5 order by idx limit 1;  -- 다음글
select idx as NextIdx ,title as behindTitle from board where idx < 5 order by idx desc limit 1;  -- 이전글















