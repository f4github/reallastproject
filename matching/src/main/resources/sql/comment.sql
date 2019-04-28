
--리플 저장 테이블
create table ti_comment (
	num		    number primary key,		--일련번호
	id	        varchar2(50) not null,	--작성자
	text	    varchar2(300)not null,	--리플 내용
    contentid   varchar2(200) not null,
    inputdate   date    default sysdate
);

--리플 일련번호 시퀀스
create sequence ti_comment_seq;

--저장 예
insert into ti_comment values (ti_comment_seq.nextval, 'abc', '리플내용');
