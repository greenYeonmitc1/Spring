CREATE DATABASE 05_spring_board_mybatis;

USE 05_spring_board_mybatis;

CREATE TABLE member(
	member_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id VARCHAR(20),
	pw VARCHAR(20),
	email VARCHAR(50)
);

INSERT INTO member (id, pw, email) VALUES('qwer', '1234', 'qwer@naver.com');

CREATE TABLE board(
	board_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	board_type INT,		-- 1(�Ϲ�) 2(����) 3(Q&A) 4(�͸�)
	title VARCHAR(20),
	writer VARCHAR(20),
	content VARCHAR(100),
	ref INT,
	re_step INT,
	re_level INT
);

SELECT * FROM member;

INSERT INTO board (board_type, title, writer , content , ref ,re_step , re_level)
VALUES(1, '[����]1', '[�۰�1]' , '[����1]' , 1, 1, 1);
INSERT INTO board (board_type, title, writer , content , ref ,re_step , re_level)
VALUES(2, '[����]2', '[�۰�2]' , '[����2]' , 2, 1, 1);
INSERT INTO board (board_type, title, writer , content , ref ,re_step , re_level)
VALUES(3, '[����]3', '[�۰�3]' , '[����3]' , 3, 1, 1);
INSERT INTO board (board_type, title, writer , content , ref ,re_step , re_level)
VALUES(4, '[����]4', '[�۰�4]' , '[����4]' , 4, 1, 1);



