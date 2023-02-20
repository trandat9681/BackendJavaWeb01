DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System;
USE Testing_System;

-- tao Table 1:Department -- định danh của phòng ban

CREATE TABLE `department` (
	id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name`		VARCHAR(50) UNIQUE KEY
);
-- insert into talbe Department
INSERT INTO `department` 	(		id	, 	`name`	)
VALUES				 	 	(		1	,	'Marketing'	),
							(		2	,	'Sale'		),
							(		3	,	'Sercurity'	),
							(		4	,	'Technical'	),
							(		5	,	'Accounting'),
							(		6	,	'Director'	);
                            
-- tao Table 2: Position -- định danh của chức vụ

CREATE TABLE `position` (
id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name`			VARCHAR(50) UNIQUE KEY
);


-- insert into Position
INSERT INTO `position`  (		id	,	`name`)
VALUES				 	(1,		'Sale'			),
                        (2,		'PM'			),
						(3,		'Test'			),
						(4,		'Vice Director'	),
						(5,		'Scrum Master'	),
                        (6,		'Accountant'	),
                        (7,		'HR'			),
						(8,		'Dev'			);

-- tao Table 3: Account -- định danh của user trong hệ thống
 
CREATE TABLE `account` (
id					SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
email				VARCHAR(100) UNIQUE KEY,
username			VARCHAR(50) UNIQUE KEY,
fullname			VARCHAR(50) ,
department_id		TINYINT UNSIGNED,
position_id			TINYINT UNSIGNED,
create_date			DATE
);

-- insert into Account --
INSERT INTO `account`(		id	 	,         email				,	 username 	, 	fullname 			, 	department_id 	, position_id  , 	create_date )
VALUES				(		1		,'tranvandat@gmail.com' 	,	'trandat'	,	'Trần Văn Đạt'		,	1				,	1			,	'2021/06/02'	),	
                    (		2		,'doanthihien@gmail.com' 	, 	'hienhoan97',	'Đoàn Thị Hiền'  	,	3				,	4			,	'2022/03/02'	),
                    (		3		,'ngobakha93@gmail.com' 	,	'khabanh93'	,	'Ngô Bá Khá'		,	5				,	1			,	'2021/03/12'	),
                    (		4		,'nguyensontung@gmail.com' 	,	'sontungmtp', 	'Nguyễn Sơn Tùng'	,	3				,	2			,	'2019/06/02'	),
                    (		5		,'kieuxuanhuan@gmail.com' 	,	'huanhoahong',	'Kiều Xuân Huấn' 	,	2				,	5			,	'2017/06/02'	);


-- tao Table 4: Group -- định danh của nhóm

CREATE TABLE `group` (
id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name`			VARCHAR(50) UNIQUE KEY,
creator_id		SMALLINT UNSIGNED UNIQUE KEY,
created_date	DATE
);

-- insert into Group --

INSERT INTO `group` ( 	`id`	,	`name`				,	`creator_id` ,	`created_date` )
VALUES				(	 1		,	'Marvel'			,		1		,	'2015/03/24'	),
					(	 2		,	'WarnerBros'		,	    2		,	'2018/02/18'	),
					(	 3		,	'Universal'			,		3		,	'2022/06/02'	),
					(	 4		,	'WaltDisney'		,		4		,	'2021/03/07'	),
					(	 5		,	'20thCenturyFox'	,		5		,	'2019/08/14'	);

-- tao Table 5: GroupAccount -- thành viên tham gia vào nhóm nào

CREATE TABLE `group_account` (
group_id			SMALLINT UNSIGNED ,
account_id			SMALLINT UNSIGNED ,
join_date			DATE,
PRIMARY KEY(group_id, account_id)
);
-- insert into table  GroupAccount
INSERT INTO `group_account`	(	`group_id`	,`account_id`	,	`join_date`	 	)
VALUES 						(		1		,		2		,	'2014/05/04'	),
							(		5		,		1		,	'2020/03/02'	),
							(		3		,		2		,	'2018/05/02'	),
							(		4		,		5		,	'2017/07/01'	),
							(		2		,		2		,	'2019/02/03'	);


-- tao Table 6: TypeQuestion -- tên của loại câu hỏi 

CREATE TABLE `type_question` (
id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
`name`		ENUM( 'Essay'	, 'Multiple-Choice' )
);

-- insert into table TypeQuestion
INSERT INTO	`type_question` (	`id`	, `name`		)
VALUES						(	 1		,	'Essay'			),
							(  	 2		, 'Multiple-Choice' );
                            
-- tao Table 7: CategoryQuestion -- tên của chủ đề câu hỏi

CREATE TABLE `category_question` (
id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name`		VARCHAR(100) UNIQUE KEY
);

-- insert into table  CategoryQuestion 
INSERT INTO `category_question` (	   id		, `name`	)
VALUES							(		1		,	'Java'	),
								(		2		,	'NET'	),
								(		3		,	'SQL'	),
								(		4		,	'Postman'),
								(		5		,	'Ruby'	);
								
-- tao Table 8: Question -- định danh của câu hỏi

CREATE TABLE  `question` (
id						SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content					VARCHAR(500) UNIQUE KEY,
type_question_id		TINYINT UNSIGNED , 
-- tên loại câu hỏi thay bằng enum được không
category_id				TINYINT UNSIGNED UNIQUE KEY,
creator_id				TINYINT UNSIGNED,
created_date			DATE
);

-- insert into table  Question
INSERT INTO `Question` (	`id`			,	`content`	,	`type_question_id`	,	`category_id`	,	`creator_id`	,	`created_date`	)
VALUES					(		1			,	'Content1'	,			1			,		1			,		1			,	'2023/01/01'	),
						(		2			,	'Content2'	,			2			,		3			,		2			,	'2023/02/02'	),
						(		3			,	'Content3'	,			2			,		4			,		4			,	'2023/06/06'	),
						(		4			,	'Content4'	,			2			,		5			,		3			,	'2023/06/05'	),
						(		5			,	'Content5'	,			1			,		2			,		5			,	'2023/06/08'	);

-- tao Table 9: Answer -- định danh của câu trả lời
CREATE TABLE `answer` (
    id 					TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content 			VARCHAR(500),
    question_id 		TINYINT UNSIGNED ,
    -- có thể thay bằng enum ( essay , mutil ) được không?
    is_correct 			ENUM('True', 'False')
);

-- insert into table Answer
INSERT INTO `answer`		(     `id`		,	`content`		,	`question_id`	,	`is_correct`	)
VALUES						(		1		,	'Content1'		,		1			,	'True'		),
							(		2		,	'Content2'		,		2			,	'False'		),
							(		3		,	'Content3'		,		2			,	'False'		),
							(		4		,	'Content4'		,		1			,	'True'		), 
                            (		5		,	'Content5'		,		2			,	'False'		);

-- tao Table 10: Exam --định danh của đề thi

CREATE TABLE `exam` (
exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`code`			VARCHAR(50) UNIQUE KEY,
title			VARCHAR(50) UNIQUE KEY,
category_id		TINYINT UNSIGNED UNIQUE KEY,
duration		TIME,
creator_id		TINYINT UNSIGNED,
created_date	DATE
);

-- insert into table Exam
INSERT INTO `exam`		(`exam_id`	,	`code`	,	`title`		,	`category_id`	,	`duration`	,	`creator_id`	,	`created_date`	)
VALUES					(	1		,	'VN001'	,	'Title1'	,			1		,	'01:00:00'	,			1		,	'2018/06/15'	),
						(	2		,	'VN002'	,	'Title2'	,			2		,	'01:30:00'	,			3		,	'2022/06/30'	),
						(	3		,	'VN003'	,	'Title3'	,			3		,	'01:15:00'	,			4		,	'2022/06/01'	),
						(	4		,	'TEST4'	,	'Title4'	,			4		,	'00:45:00'	,			2		,	'2016/06/04'	),
						(	5		,	'CODE5'	,	'Title5'	,			5		,	'01:10:00'	,			5		,	'2022/06/13'	);
-- tao Table 11: ExamQuestion 

CREATE TABLE `exam_question` (
exam_id			TINYINT UNSIGNED,
question_id		TINYINT UNSIGNED,
PRIMARY KEY (exam_id, question_id)
);
-- insert into table ExamQuestion
INSERT INTO `exam_question` (	`exam_id`	,	`question_id`	)
VALUES 						(		1		,		4		),
							(		4		,		3		),
							(		3		,		2		),
							(		2		,		5		),
							(		5		,		1		);