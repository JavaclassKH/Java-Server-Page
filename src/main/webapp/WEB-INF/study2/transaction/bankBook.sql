
-- 입출금정보 테이블
create table bankBook (
  idx   int  not null  auto_increment,      /* 입출금 고유번호 */
  mid  varchar(20)  not null,               /* 입출금 고객 아이디 */
  balance int,                              /* 입,출금 금액 */
  primary key(idx)
);

-- 입출금 내역 테이블
create table bankBookHistory (
  idx   int  not null  auto_increment,           /* 입출금 내역 고유번호 */
  bankBookIdx int not null,                      /* 입,출금액 사용자의 고유번호 */
  content varchar(50) not null,                  /* 입출금 내역서 */
  primary key(idx)
  /*foreign key(bankBookIdx) references bankBook(idx)*/
);


desc bankBook;
desc bankBookHistory;

select * from bankBook;
select * from bankBookHistory;

insert into bankBook values (default,'sona123',1000000000);

drop table bankBook;
drop table bankBookHistory;













