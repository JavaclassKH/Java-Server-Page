

create table schedule (
idx int not null auto_increment,               /* 스케줄 고유번호 */
mid varchar(30) not null,                      /* 회원 아이디(일정검색용) */
sDate datetime not null,                       /* 일정등록날짜 */
part varchar(10) not null,                     /* 일정분류(1.모임, 2.업무, 3.학습, 4.여행, 5.기타) */
content text not null,                         /* 일정내용 */
primary key(idx),
foreign key(mid) references member(mid) 
);

desc schedule;


insert into schedule values (default,'sona123','2024-05-1','기타','상담일자 예약함');
insert into schedule values (default,'admin','2024-05-2','업무','관리자 정기교육');
insert into schedule values (default,'test3','2024-05-3','여행','부산여행');
insert into schedule values (default,'sona123','2024-05-4','기타','상담일자 예약함');
insert into schedule values (default,'test1','2024-06-14','기타','생일');
insert into schedule values (default,'sona123','2024-05-5','기타','상담일자 예약함');
insert into schedule values (default,'test5','2024-06-1','여행','목포여행');
insert into schedule values (default,'sona123','2024-05-6','기타','상담일자 예약함');
insert into schedule values (default,'sona123','2024-05-8','업무','관리자 정기교육');
insert into schedule values (default,'test6','2024-06-2','여행','여수여행');
insert into schedule values (default,'sona123','2024-05-9','기타','상담일자 예약함');
insert into schedule values (default,'admin','2024-05-10','모임','핑계고 계모임');
insert into schedule values (default,'test3','2024-06-4','여행','인천 청라국제도시');
insert into schedule values (default,'test6','2024-06-5','여행','여수여행');
insert into schedule values (default,'sona123','2024-05-11','기타','상담일자 예약함');
insert into schedule values (default,'admin','2024-05-12','모임','핑계고 계모임');
insert into schedule values (default,'sona123','2024-07-22','업무','테이블 설계');
insert into schedule values (default,'test6','2024-06-13','여행','여수여행');
insert into schedule values (default,'sona123','2024-05-13','기타','상담일자 예약함');
insert into schedule values (default,'admin','2024-05-20','모임','핑계고 계모임');
insert into schedule values (default,'sona123','2024-06-13','업무','관할구역 순찰');
insert into schedule values (default,'sona123','2024-05-14','업무','서버 정기점검');
insert into schedule values (default,'sona123','2024-05-15','업무','서버 임시점검');
insert into schedule values (default,'sona123','2024-05-16','업무','서버 긴급점검');
insert into schedule values (default,'sona123','2024-05-17','업무','서버 연장점검');
insert into schedule values (default,'admin','2024-05-21','업무','관리자 정기교육');
insert into schedule values (default,'test3','2024-05-24','여행','부산여행');
insert into schedule values (default,'test3','2024-06-12','여행','인천국제공항');

select * from schedule where mid = 'sona123' and substring(sDate, 1, 10) = '2024-05-06' order by sDate;
select * from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m-%d') = '2024-05-11' order by sDate;
select * from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-06' order by sDate, part;
select *,count(*) as cnt from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-06' order by sDate, part;

select * from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-06' order by sDate, part;

select *,count(*) as cnt from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-05' order by sDate, part;
select *,count(*) as cnt from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m-%d') = '2024-06-14' order by sDate, part;

select *,count(*) as cnt from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-06' group by part order by sDate, part;

select * from schedule where mid = 'sona123' and date_format(sDate, '%Y-%m') = '2024-05' group by sDate,part order by sDate, part;










