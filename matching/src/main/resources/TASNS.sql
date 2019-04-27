CREATE TABLE sns
(
	boardnum number NOT NULL,
	id varchar2(20),
	title varchar2(100),
	content varchar2(4000),
	originalfile varchar2(500),
	savedfile varchar2(500),
	inputdate date default sysdate,
	liked number default 0,
	views number default 0,
	hashtag varchar2(500),
	location varchar2(50),
	PRIMARY KEY (boardnum)
);

create sequence sns_seq;

CREATE TABLE sns_reply
(
	replynum number NOT NULL,
	id varchar2(20),
	content varchar2(2000),
	inputdate date default sysdate,
	boardnum number NOT NULL,
	PRIMARY KEY (replynum)
	constraint sns_reply_fk foreign key(boardnum) 
		references sns(boardnum) on delete cascade
);

create sequence sns_reply_seq start with 1 increment by 1;

create table Travel_info(
boardnum        number primary KEY,
travelid        varchar2(100),
travelPlace     varchar2(500),
content         varchar2(4000),
views           number,
mapx            number,
mapy            number,
sigungucode     number,
address         varchar2(500),
zipcode         varchar2(100),
firstimage      varchar2(1000),
firstimage2     varchar2(1000),
vote            number              default 0,
hashtag         CLOB,
tel             varchar(100)
);

create sequence travel_info_seq;

CREATE TABLE travel_info_reply
(
	replynum number NOT NULL,
	id varchar2(20) UNIQUE,
	content varchar2(2000),
	-- default sysdate
	inputdate date,
	-- create sequence tokoro_seq;
	-- 
	-- tokoro_seq.nextval;
	boardnum number NOT NULL,
	PRIMARY KEY (replynum)
);

create table TA
(
	loginid varchar2(20),
    travelid varchar2(100),
	travelplace varchar2(500),
	firstimage varchar2(1000),
	vote number
);

