create table tbl_member(
userId varchar2(50) primary key,
userPass varchar2(100) not null,
userName varchar2(30) not null,
userPhon varchar2(20) not null,
userAddr1 varchar2(20) not null,
userAddr2 varchar2(50) not null,
userAddr3 varchar2(50) not null,
regidate date default sysdate,
verify number default 0
);

--alter table tbl_member
--rename column refidate to regidate;

create table tbl_goods(
gdsNum number primary key,
gdsName varchar2(50) not null,
cateCode varchar2(30) not null,
gdsPrice number not null,
gdsStock number,
gdsDes varchar2(500) null,
gdsImg varchar2(200) null,
gdsDate date default sysdate
);

create table goods_category(
cateName varchar2(20) not null,
cateCode varchar2(30) not null,
cateCodeRef varchar2(30) null,
primary key(cateCode),
foreign key(cateCodeRef) REFERENCES goods_category(cateCode)
);

alter table tbl_goods add
    constraint fk_goods_category
    foreign key(cateCode)
    references goods_category(cateCode);
    
create sequence tbl_goods_seq;

insert into
tbl_member
(
userId,
userPass,
userName,
userPhon,
userAddr1,
userAddr2,
userAddr3
)
values(
'aaa',
'aaa',
'aaa',
'aaa',
'aaa',
'aaa',
'aaa'
);

insert into goods_category(cateName, cateCode) values('남성옷','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('아우터','101','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('긴팔상의','102','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('반팔','103','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('바지','104','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('반바지','105','100');
insert into goods_category(cateName, cateCode, cateCodeRef) values('신발','106','100');

insert into goods_category(cateName, cateCode) values('여성옷','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('아우터','201','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('긴팔상의','202','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('반팔','203','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('바지','204','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('반바지','205','200');
insert into goods_category(cateName, cateCode, cateCodeRef) values('신발','206','200');

insert into goods_category(cateName, cateCode) values('신발','300');
insert into goods_category(cateName, cateCode, cateCodeRef) values('운동화','301','300');
insert into goods_category(cateName, cateCode, cateCodeRef) values('등산화','302','300');
insert into goods_category(cateName, cateCode, cateCodeRef) values('구두','303','300');




select*from goods_category;
commit;

select level, cateName, cateCode, cateCodeRef from goods_category
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;
    
insert into tbl_goods
(
gdsNum
, gdsName
, cateCode
, gdsPrice
, gdsStock
, gdsDes
)
values
(
tbl_goods_seq.nextval
, '상품 이름'
, 100
, 1000
, 30
, '상품 설명'
);
select*from tbl_goods;

select gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes, gdsImg, gdsDate
from tbl_goods
order by gdsNum desc;

select*from  tbl_goods;

alter table tbl_goods add (gdsThumbImg varchar(200));
alter table tbl_goods add (gdsOriginalfile varchar(200));
alter table tbl_goods add (gdsSavedfile varchar(200));
alter table tbl_goods add (userId varchar2(50));

select
    g.gdsNum, g.gdsName, g.cateCode, c.cateCodeRef, c.cateName, gdsPrice, gdsStock, gdsDes, gdsSavedfile, gdsDate, g.gdsSavedfile
        from tbl_goods g
            inner join goods_category c
                on g.cateCode = c.cateCode           
            where g.cateCode = 100;
            
            
create table tbl_cart (
    cartNum     number          not null,
    userId      varchar2(50)    not null,
    gdsNum      number          not null,
    cartStock   number          not null,
    addDate     date            default sysdate,
    primary key(cartNum, userId) 
);

create sequence tbl_cart_seq;


alter table tbl_cart
    add constraint tbl_cart_userId foreign key(userId)
    references tbl_member(userId);

alter table tbl_cart
    add constraint tbl_cart_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
select*from tbl_cart;

insert into tbl_cart(cartNum, userId, gdsNum, cartStock)
values (tbl_cart_seq.nextval, 'bbb',27,1);

commit;



 select
     row_number() over(order by c.cartNum desc) as num,
     c.cartNum, c.userId, c.gdsNum, c.cartStock, c.addDate,
     g.gdsName, g.gdsPrice, g.gdsSavedfile
 from tbl_cart c
     inner join tbl_goods g
         on c.gdsNum = g.gdsNum   
     where c.userId = 'bbb';
     
     select *from tbl_cart;

 delete tbl_cart
     where cartNum = 9.
         and userId = 'bbb';

commit;

create table tbl_reply(
gdsNum number not null,
userId varchar2(50) not null,
repNum number primary key,
repCon varchar2(2000) not null,
repDate date default sysdate
);

create sequence tbl_reply_seq;

alter table tbl_reply
    add constraint tbl_reply_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
alter table tbl_reply
    add constraint tbl_reply_userId foreign key(userId)
    references tbl_member(userId);
    
    commit;