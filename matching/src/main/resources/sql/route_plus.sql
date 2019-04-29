--경로 추가

create table route_plus (
rpNum			number	primary key,	--경유지 고유번호
routeNum		number,					--루트 번호
id				varchar2(20),			--작성자 ID
title			varchar2(100),		--경로제목
plus			varchar2(300),		--추가한 경유지 제목
mapx			varchar2(100),		--경유지 좌표
mapy			varchar2(100)		--경유지 좌표
);

select * from route_plus;

drop table route_plus;

create sequence rpNum_seq start with 1 increment by 1;

insert into route  values (rpNum_seq.nextval, 'aaa', '글제목', '글내용');





















