desc guestbook;

-- insert
insert into guestbook values(null, '둘리', '123', 'ㅎㅇ!', now());

-- select
select id, name, contents, date_format(reg_date, '%Y-%m-%d %h:%i:%s') from guestbook order by reg_date desc;

-- delete
delete from guestbook where id=1 and password='1234';
select * from guestbook;
