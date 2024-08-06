create table webMessage (
idx int not null auto_increment,         /* 메세지 고유번호 */
title varchar(100) not null,             /* 메세지 제목 */ 
content text not null,                   /* 메세지 내용 */
sendId varchar(30) not null,             /* 발신자 아이디 */          
sendSw char(1) not null,                 /* 보낸메세지(s), 휴지통(g), 휴지통삭제(x) 표시  */ 
sendDate datetime default now(),         /* 메시지 발신 일자 */
receiveID varchar(30) not null,          /* 수신자 아이디 */
receiveSw char(1) not null,              /* 받은메세지(n), 읽은메세지(r), 휴지통(g), 휴지통삭제(x) 표시  */ 
receiveDate datetime default now(),      /* 메시지 수신 일자,읽은 날짜 */
primary key(idx),
foreign key(sendId) references member(mid),
foreign key(receiveID) references member(mid)
);


desc webMessage;
select * from webMessage;

insert into webMessage values (default,'첫 메일(더미)','메일서비스 테스트','sona123',default,default,'admin',default,default);
insert into webMessage values (default,'안녕하세요 관리자님','운영자 권한관련 메일 드립니다','sona123',default,default,'admin','r',default);
insert into webMessage values (default,'권한관련 답신','운영자 권한 추가 완료했습니다','admin',default,default,'sona123','r',default);
insert into webMessage values (default,'안녕하세요 관리자님','감사합니다 관리자님','sona123',default,default,'admin','r',default);
insert into webMessage values (default,'문의(일정관리)','운영자님 일정서비스 관련 문의 드립니다','test5',default,default,'sona123',default,default);
insert into webMessage values (default,'첫 만남은 너무 어려워','계획대로 되는게 없어서','test2',default,default,'test4',default,default);
insert into webMessage values (default,'그대여','왜 그렇게 쳐다보나요~','test4',default,default,'test2',default,default);

select *,timestampdiff(hour, sendDate ,now()) as hour_diff from webMessage where receiveId = 'sona123' and (receiveSw = 'n' or receiveSw = 'r') order by idx desc;















