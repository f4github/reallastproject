
-- 게시판 본문 글
create table board (
	boardnum		number	primary key,		--글번호
	id				varchar2(20) not null,	--작성자 ID
	title			varchar2(100) not null,		--글제목
	content			varchar2(2000) not null,	--글내용
	inputdate		date	default sysdate,	--작성날짜,시간
	hits			number 	default 0,		--조회수
	originalfile		varchar2(200),			--첨부파일명 (원래 이름)
	savedfile		varchar2(100)			--첨부파일명 (실제 저장된 이름)
);

-- 게시판 일련번호에 사용할 시퀀스 
create sequence board_seq start with 1 increment by 1;

-- 리플 내용
create table reply (
	replynum		number	primary key,		--리플번호
	boardnum		number not null,			--본문 글번호
	id				varchar2(20) not null,		--작성자 ID
	text			varchar2(200) not null,		--리플내용
	inputdate		date 	default sysdate,	--작성날짜
	constraint reply_fk foreign key(boardnum) 
		references board(boardnum) on delete cascade
);

-- 리플에 사용할 시퀀스
create sequence reply_seq start with 1 increment by 1;

-- 글 저장 예
insert into board (boardnum, id, title, content) values (board_seq.nextval, 'aaa', '글제목', '글내용');
	
-- 리플 저장 예
insert into reply (replynum, boardnum, id, text) values (reply_seq.nextval, 1, 'bbb', '리플의 내용...');
	
-- 검색 예
select * from customer order by custid;
select * from board order by boardnum desc;
select * from reply order by replynum desc;
