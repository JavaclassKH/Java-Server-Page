create table pds (
idx int not null auto_increment,               /* 자료실 글 고유번호 */
mid varchar(30) not null,                      /* 작성자 아이디 */
nickName varchar(30) not null,                 /* 작성자 닉네임 */
fName varchar(300) not null,                   /* 유저가 업로드한 파일명 */
fsName varchar(300) not null,                  /* 서버에 저장되는 파일명 */ 
fSize int not null,                            /* 업로드되는 파일의 총 사이즈 */
title varchar(100) not null,                   /* 업로드 파일의 간단 제목 */
part varchar(20) not null,                     /* 파일분류(학습/여행/음식 등) */
fDate datetime default now(),                  /* 파일 업로드한 날짜 */
downNum int default 0,                         /* 파일을 다운로드 받은 횟수 */
openSw char(4) default '공개',                  /* 파일 공개여부(공개/비공개) */
pwd varchar(100),                              /* 파일 비공개시 암호설정 (sha256암호화) */
hostIp varchar(30) not null,                   /* 업로드한 클라이언트 IP */
content text,                                  /* 업로드 파일의 상세 설명 */
primary key(idx),
foreign key(mid) references member(mid)
);