--경로 테이블

create table route (
routeNum		number	primary key,	--경로번호
id				varchar2(20) not null,	--작성자 ID
title			varchar2(100),		--경로제목
startDate		date,				--출발일
endDate			date,				--도착일
startPlace		varchar2(100),	--출발지(주소지 좌표)
tripArea		varchar2(20),	--여행 지역
male			number,
female			number
);

select * from route;

drop table route;

create sequence routeNum_seq start with 1 increment by 1;

insert into route  values (routeNum_seq.nextval, 'aaa', '글제목', '글내용');





















