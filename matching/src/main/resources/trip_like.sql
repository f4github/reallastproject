create table trip_like (
likenum	number	primary key,
id	varchar2(20),
title	varchar2(500),
contentid	varchar2(200),
contenttypeid	varchar2(200)
};


drop table trip_like;

select * from trip_like;




--리플 일련번호 시퀀스
create sequence likenum_seq;

likenum_seq.nextval









