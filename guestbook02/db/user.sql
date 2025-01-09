select * from user;

select * from guestbook;

-- login
select id, name from user where email = 'cadsfsfs@sdfsdf' and password = password('1234');

select * from user;

-- CREATE TABLE IF NOT EXISTS `webdb`.`board` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `title` VARCHAR(200) NOT NULL,
--   `contents` TEXT NOT NULL,
--   `hit` INT NOT NULL,
--   `reg_date` DATETIME NOT NULL,
--   `g_no` INT NOT NULL,
--   `o_no` INT NOT NULL,
--   `depth` INT NOT NULL,
--   `user_id` INT NOT NULL,
--   PRIMARY KEY (`id`),
--   CONSTRAINT `fk_board_user1`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `webdb`.`user` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;

desc board;

insert into board values(null, ?, ?, 0, now(), (select ifnull(max(g_no), 0)+1 from board), 1, 0, ?);
select ifnull(max(g_no), 0)+1 from board;


select * from board;

select id, title, contents, user_id, hit, date_format(reg_date, '%Y-%m-%d %h:%i:%s'), g_no, o_no, depth from board order by g_no desc, o_no asc;

select a.id, a.title, a.contents, a.user_id, a.hit, date_format(a.reg_date, '%Y-%m-%d %h:%i:%s'), a.g_no, a.o_no, a.depth, b.name
from board a join user b on a.user_id = b.id
order by g_no desc, o_no asc limit 3, 3;

update board set hit = (select hit from board where id = 1)+1 where id = 1;

select ceil(count(*)/3) from board;

select * from board;
select max(o_no) from board where g_no = 2;


-- test
select a.id, a.title, a.contents, a.user_id, a.hit, date_format(a.reg_date, '%Y-%m-%d %h:%i:%s'), a.g_no, a.o_no, a.depth, b.name
from board a join user b on a.user_id = b.id
order by g_no desc, o_no asc;

update board set o_no=o_no+1 where g_no=16 and o_no>=2;
insert into board values(null, "??", "??", 0, now(), 16, 2, 1, 10);

insert into board values(null, "?? ??", "??", 0, now(), 20, 2, 1, 10);

insert into board values(null, "?? ??", "??", 0, now(), 20, 2, 2, 10);

select * from board;

SELECT 
    a.id, 
    a.title, 
    a.hit, 
    DATE_FORMAT(a.reg_date, '%Y-%m-%d %h:%i:%s') AS reg_date, 
    a.g_no, 
    a.o_no, 
    a.depth, 
    b.name, 
    a.user_id,
    ROW_NUMBER() OVER (ORDER BY a.g_no ASC, a.o_no DESC) AS reverse_rank
FROM 
    board a 
JOIN 
    user b 
ON 
    a.user_id = b.id
ORDER BY 
    a.g_no DESC, 
    a.o_no ASC;




