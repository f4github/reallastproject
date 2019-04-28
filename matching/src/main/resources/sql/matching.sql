-----------------매칭
drop table mcboard;
drop table mcreply;
drop sequence mcreply_seq;
drop sequence mcboard_seq;

-- 게시판 본문 글
create table mcboard (
	boardnum		number	primary key,		--글번호
	id				varchar2(20) not null,	--작성자 ID
	title			varchar2(100) not null,		--글제목
	content			varchar2(2000) not null,	--글내용
	inputdate		date	default sysdate,	--작성날짜,시간
	hits			number 	default 0,		--조회수
	originalfile		varchar2(200),			--첨부파일명 (원래 이름)
	savedfile		varchar2(100),			--첨부파일명 (실제 저장된 이름)
	
	routeNum		number,				--경로 번호
	startDate		date,				--출발일
	endDate			date,				--도착일
	startPlace		varchar2(100),	--출발지(주소지 좌표)
	tripArea		varchar2(20),	--여행 지역
	male			number,
	female			number
);

-- 게시판 일련번호에 사용할 시퀀스 
create sequence mcboard_seq start with 1 increment by 1;

-- 리플 내용
create table mcreply (
	replynum		number	primary key,		--리플번호
	boardnum		number not null,			--본문 글번호
	id				varchar2(20) not null,		--작성자 ID
	text			varchar2(200) not null,		--리플내용
	inputdate		date 	default sysdate,	--작성날짜
	constraint reply_fk foreign key(boardnum) 
		references mcboard(boardnum) on delete cascade
);

-- 리플에 사용할 시퀀스
create sequence mcreply_seq start with 1 increment by 1;


-- 글 저장 예
insert into mcboard (boardnum, id, title, content) values (mcboard_seq.nextval, 'aaa', '글제목', '글내용');
	
-- 리플 저장 예
insert into mcreply (replynum, boardnum, id, text) values (mcreply_seq.nextval, 1, 'bbb', '리플의 내용...');
