
drop table if exists course_taken;
drop table if exists results;
drop table if exists schedule;
drop table if exists routine;
drop table if exists passwords;
drop table if exists students;
drop table if exists courses;
drop table if exists department;

create table department(
	dept_id		int(2) NOT NULL,
	department 	varchar(40),
	primary key(dept_id)
);

insert into department(dept_id,department) values (01,'CE'),(03,'EEE'),(05,'ME'),(07,'CSE'),(09,'ECE'),(92,'IEM'),(13,'ESE'),(15,'BME'),(17,'URP'),(19,'LE'),(21,'TE'),(23,'BECM'),(25,'ARCH'),(27,'MSE'),(29,'Chemical'),(31,'Mechat'),(51,'MATH'),(53,'CHEM'),(55,'PHY'),(57,'HUM');

create table courses(
	c_id 		varchar(10) unique,
	c_name 		varchar(30) unique,
	year 		int(1) check(year>0 and year<5),
	term 		int(1) check(term>0 and term<3),	
	credit 		float(4,2) default 3.00,
	primary key (c_id)
);

insert into courses(c_id,c_name,year,term,credit) values('CSE 3101','Theory of Computation','3','1','3.00'),
							('CSE 3100','Web Programming Lab','3','1','1.50'),
							('CSE 3103','Peripheral and Interfacing','3','1','3.00'),
							('CSE 3104','Peripheral and Interfacing Lab','3','1','1.50'),
							('CSE 3109','Database Management System','3','1','3.00'),
							('CSE 3110','Database Management System Lab','3','1','1.50'),
							('CSE 3119','Software Engg','3','1','3.00'),
							('CSE 3120','Software Engg Lab','3','1','1.50'),
							('ECE 3115','Data Communication','3','1','3.00'),
							('ECE 3117','Data Communication Lab','3','1','1.50');

create table students(
	roll 		int(7) NOT NULL,
	name 		varchar(20),
	department 	int(2),
	batch		int(2),
	section		varchar(1),
	primary key (roll),
	foreign key (department) references department(dept_id)
);

insert into students(roll,name,department,batch,section) values 
		(1707092,'ghkghhk',07,17,'A'),
		(1707001,'yjklgnm',07,17,'A'),
		(1707002,'uiolnm,',07,17,'A'),
		(1707003,'ghbnmh',07,17,'A'),
		(1707005,'ertyui',07,17,'A'),
		(1707006,'ertyu',07,17,'A'),
		(1707007,'sdfhghk',07,17,'A');

create table passwords(
	roll 		int(7) NOT NULL UNIQUE,
	password	varchar(20),
	foreign key (roll) references students(roll)
);
insert into passwords(roll,password) values 
		(1707092,'123456'),
		(1707001,'gjmghkl467'),
		(1707002,'abdullah123456'),
		(1707003,'saiful123456'),
		(1707005,'fhhk123456'),
		(1707006,'tyuio23456'),
		(1707007,'asdf123456');

create table schedule(
	department 	int(2),
	batch		int(2),
	time		datetime,
	title		varchar(40),
	description	varchar(300),	
	primary key(department,batch,time),
	foreign key (department) references department(dept_id)
);

insert into schedule(department,batch,time,title,description) values
		(07,17,'2019-06-13 10:40:00','Database Project Show','Database 1st phase project show with Laravel'),
		(07,17,'2019-06-17 10:40:00','Web Project 10:40:00','Web 1st phase project show with ASP.net'),
		(07,17,'2019-06-17 10:40:00','CSE3119 CT','CSE3119 Soft CT'),
		(07,17,'2019-06-18 08:00:00','CSE3103 CT','CSE3103 CT Combined'),
		(07,17,'2019-06-19 10:40:00','CSE 3120 Quiz','CSE 3120 Soft Lab Quiz');

create table routine(
	department 	int(2),
	batch		int(2),
	section		varchar(1),
	day_num		int(1),
	day		varchar(10),
	p1		varchar(30),
	p2		varchar(30),
	p3		varchar(30),
	p4		varchar(30),
	p5		varchar(30),
	p6		varchar(30),
	p7		varchar(30),
	p8		varchar(30),
	p9		varchar(30),
	primary key(department,batch,section,day_num),
	foreign key (department) references department(dept_id)
);

insert into routine (department,batch,section,day_num,day,p1,p2,p3,p4,p5,p6,p7,p8,p9) values
		(07,17,'A',1,'Sunday','CSE 3101','CSE 3119', 'CSE 3103','CSE 3100','Lab','Lab',null,null,null),
		(07,17,'A',2,'Monday','CSE 3103','CSE 3109', 'CSE 3119','CSE 3104/ECE 3117','Lab','Lab',null,null,null),
		(07,17,'A',3,'Tuesday',null,'CSE 3103', 'ECE 3115','CSE 3101','CSE 3109',null,null,null,null),
		(07,17,'A',4,'Wednesday','CSE 3109','CSE 3101', 'ECE 3115','CSE 3120','Lab','Lab',null,null,null),
		(07,17,'A',5,'Thursday',null,'CSE 3119', 'ECE 3115','CSE 3110','Lab','Lab',null,null,null);

create table results(
	roll 		int(7) NOT NULL,
	year 		int(1) check(year>0 and year<5),
	term 		int(1) check(term>0 and term<3),	
	credit 		float(4,2) default 0.00,
	GPA		float(3,2) default 2.00,
	foreign key (roll) references students(roll)
);

insert into results (roll,year,term,credit,GPA) values
		(1707092,3,1,21.00,4.00),
		(1707001,3,1,21.00,4.00),
		(1707002,3,1,21.00,4.00),
		(1707003,3,1,21.00,4.00),
		(1707005,3,1,21.00,4.00),
		(1707006,3,1,21.00,4.00);		

create table course_taken(
	roll int(7),
	c_id varchar(10),
	ssession varchar(10),
	foreign key(roll) references students (roll) on delete cascade,
	foreign key(c_id) references courses (c_id) on delete cascade
);

insert into course_taken(roll,c_id,ssession) values
		(1707092,'CSE 3100','2018-2019'),
		(1707092,'CSE 3101','2018-2019'),
		(1707092,'CSE 3103','2018-2019'),
		(1707092,'CSE 3104','2018-2019'),
		(1707092,'CSE 3109','2018-2019'),
		(1707092,'CSE 3110','2018-2019'),
		(1707092,'CSE 3119','2018-2019'),
		(1707092,'CSE 3120','2018-2019'),
		(1707092,'ECE 3115','2018-2019'),
		(1707092,'ECE 3117','2018-2019'),
		(1707003,'CSE 3100','2018-2019'),
		(1707003,'CSE 3101','2018-2019'),
		(1707003,'CSE 3103','2018-2019'),
		(1707003,'CSE 3104','2018-2019'),
		(1707003,'CSE 3109','2018-2019'),
		(1707003,'CSE 3110','2018-2019'),
		(1707003,'CSE 3119','2018-2019'),
		(1707003,'CSE 3120','2018-2019'),
		(1707003,'ECE 3115','2018-2019'),
		(1707003,'ECE 3117','2018-2019');