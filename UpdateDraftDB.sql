USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP1')
BEGIN
	ALTER DATABASE SWP1 SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE SWP1 SET ONLINE;
	DROP DATABASE SWP1;
END

GO

CREATE DATABASE SWP1
GO

USE SWP1
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 

---------- CREATE TABLE -----------------------------

CREATE TABLE Roles(
	ID int primary key not null,
	name nvarchar(20)
);

CREATE TABLE Admins (
	ID int identity(1,1) PRIMARY KEY NOT NULL,
	username NVARCHAR(20),
    password NVARCHAR(20) NOT NULL,
    role_ID int,
	fullName NVARCHAR(50),
    gender int,
	address NVARCHAR(20),
	email NVARCHAR(50),
	phone_number NVARCHAR(20),
    birthday DATE,
	img_profile nvarchar(100),
	FOREIGN KEY (Role_ID) REFERENCES Roles(id)

);

CREATE TABLE Students(
	ID int identity(1,1) PRIMARY KEY NOT NULL,
	username NVARCHAR(20),
    password NVARCHAR(100),
    role_ID int,
	fullName NVARCHAR(50),
    gender int,
	address NVARCHAR(20),
	email NVARCHAR(50),
	phone_number NVARCHAR(20),
    birthday nvarchar(50),
	status int,
	img_profile nvarchar(100),
	FOREIGN KEY (Role_ID) REFERENCES Roles(id)
);

CREATE TABLE Manager(
	ID int identity(1,1) PRIMARY KEY NOT NULL,
	username NVARCHAR(20),
    password NVARCHAR(20) NOT NULL,
    role_ID int,
	fullName NVARCHAR(50),
    gender int,
	address NVARCHAR(20),
	email NVARCHAR(50),
	phone_number NVARCHAR(20),
    birthday DATE,
	img_profile nvarchar(100),
	FOREIGN KEY (Role_ID) REFERENCES Roles(id)
);


CREATE TABLE Lecturers (
	ID int PRIMARY KEY NOT NULL,
	username NVARCHAR(20),
    password NVARCHAR(20) NOT NULL,
    role_ID int,
	fullName NVARCHAR(50),
    gender int,
	address NVARCHAR(20),
	email NVARCHAR(50),
	phone_number NVARCHAR(20),
    birthday DATE,
	status int,
	img_certificates nvarchar(50),
	img_profile nvarchar(100),
	description nvarchar(1000),
	FOREIGN KEY (Role_ID) REFERENCES Roles(id)
);

CREATE TABLE CategoryOfCourse (
    id INT PRIMARY KEY,
    name NVARCHAR(50), 
);

CREATE TABLE CategoryOfBlog (
    id INT PRIMARY KEY,
    name NVARCHAR(50), 
);

CREATE TABLE Course(
    id int identity(1,1) PRIMARY KEY NOT NULL,
	name NVARCHAR(200) NOT NULL,
	price FLOAT,
    date Date NOT NULL,
	CategoryOfCourse_ID INT,
	Lecturer_ID INT,
	discount float,
	img nvarchar(100),
	video nvarchar(50),
	document_link nvarchar(50),
	description nvarchar(500),
	time_of_course nvarchar(50),
    FOREIGN KEY (CategoryOfCourse_ID) REFERENCES CategoryOfCourse(id),
	FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(id)
);

CREATE TABLE Lectures(
	Course_ID int,
	Lecturer_ID int,
	title nvarchar(100),
	content_of_title nvarchar(500),
	time_of_content nvarchar(50),
	description_content nvarchar(500),
	homework_references nvarchar(100),
	answer_homework nvarchar(100),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
	FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(id)
);


CREATE TABLE Progress(
	Student_ID int,
	Course_ID int,
	Lecturer_ID int,
	name_of_student nvarchar(100),
	name_of_course nvarchar(200),
	enrollment_date date,
	completion_date date,
	status int,
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
	FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(id)
);

CREATE TABLE Carts(
	ID int identity(1,1) PRIMARY KEY,
	Student_ID int,
	Course_ID int,
	quantity int,
	total float,
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id)
);

CREATE TABLE Orders(
	ID int identity(1,1) PRIMARY KEY,
	Student_ID int,
	name_of_student nvarchar(100),
	date varchar(40),
	notes nvarchar(100),
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
);

CREATE TABLE OrderDetails(
	Order_ID int,
	Student_ID int,
	Course_ID int,
	name_of_course nvarchar(100),
	price float,
	quantity int,
	amount float,
	total float,
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Order_ID) REFERENCES Orders(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
);


CREATE TABLE Payments(
	ID int identity(1,1) PRIMARY KEY,
	Course_ID int,
	Order_ID int,
	content_Payment nvarchar(50),
	quantity int,
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
	FOREIGN KEY (Order_ID) REFERENCES Orders(id),
);

CREATE TABLE Transactions(
	ID int PRIMARY KEY,
	day_of_transaction date,
	Student_ID int,
	Course_ID int,
	quantity int,
	unit_price float,
	total float,
	status int,
	Notes nvarchar(100),
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
);	

CREATE TABLE Feedback(
	rate int,
	content nvarchar(300),
	daycomment date,
	Student_ID int,
	Course_ID int,
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
	FOREIGN KEY (Student_ID) REFERENCES Students(id)
);

CREATE TABLE Questions(
	id int primary key not null,
	Lecturer_ID int,
	Student_ID int,
	Course_ID int,
	content_of_question nvarchar(500),
	day_ask date
	FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(id),
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id)
);

CREATE TABLE AnswerQuestion(
	Question_ID int,
	Lecturer_ID int,
	Student_ID int,
	Course_ID int,
	content_of_answer nvarchar(500),
	day_answer date,
	FOREIGN KEY (Question_ID) REFERENCES Questions(id),
	FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(id),
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id)
);

CREATE TABLE Blog(
	ID int identity(1,1) PRIMARY KEY NOT NULL,
	Manager_ID int,
	Course_ID int,
	CategoryOfBlog_ID int,
	title nvarchar(100),
	content nvarchar(500),
	img_of_blog nvarchar(100),
	daypost date,
	tag nvarchar(100),
	number_of_like int
	FOREIGN KEY (Manager_ID) REFERENCES Manager(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
	FOREIGN KEY (CategoryOfBlog_ID) REFERENCES CategoryOfBlog(id)
);

CREATE TABLE Comments(
	content nvarchar(500),
	Blog_ID int,
	Student_ID int,
	day_comment date,
	number_of_like int,
	FOREIGN KEY (Blog_ID) REFERENCES Blog(id),
	FOREIGN KEY (Student_ID) REFERENCES Students(id)
);

CREATE TABLE Certificates(
	Student_ID int,
	Course_ID int,
	img_certificate nvarchar(50),
	date_of_certificate date,
	FOREIGN KEY (Student_ID) REFERENCES Students(id),
	FOREIGN KEY (Course_ID) REFERENCES Course(id),
);



------------------------------- INSERT TABLE --------------------------------------

INSERT INTO Roles
Values(1,'admin'),
	(2,'manager'),
	(3,'lecture'),
	(4,'teaching assistant'),
	(5,'student');



INSERT INTO Admins
VALUES
('hai', '12345', 1, 'nguyen van hai', 1, 'Hung Yen', 'hainvhe172343@fpt.edu.vn', '0977423805', '2003-11-20', ''),
('bach', '12345', 1, 'le quang bach', 1, 'Thai Binh', 'bachlqhe171251@fpt.edu.vn', '0982457158', '2003-02-12', ''),
('duy', '12345', 1, 'le van duy', 1, 'Ha Noi', 'duylvhe172177@fpt.edu.vn', '0977423805', '2003-07-17', ''),
('duyanh', '12345', 1, 'nguyen duy anh', 1, 'Ha Noi', 'anhndhe171346@fpt.edu.vn', '0977423805', '2003-05-11', ''),
('ducanh', '12345', 1, 'pham duc anh', 1, 'Hung Yen', 'anhpdhe170032@fpt.edu.vn', '0366453985', '2003-03-11', '');


INSERT INTO Manager
VALUES
('quang', '12345', 2, 'dao van quang', 1, 'Hung Yen', 'quang123@gmail.com', '0123456789', '2003-11-22', ''),
('hung', '12345', 2, 'le van hung', 1, 'Thai Binh', 'hung123@gmail.com', '0123456789', '2003-02-11', ''),
('thao', '12345', 2, 'nguyen thi thao',0,'Quang Tri', 'thao123@gmail.com', '0123456789', '2003-07-10', ''),
('ha', '12345', 2, 'le manh ha', 1, 'Hue', 'ha123@gmail.com', '0123456789', '2003-05-09', ''),
('tung', '12345', 2, 'tran thanh tung', 1, 'Nghe An', 'tung123@gmail.com', '0123456789', '2002-03-22', '');


INSERT INTO Students
VALUES
('hoa', '12345', 5, 'le thi hoa',0, 'Hai Duong', 'hoa123@gmail.com', '0123456789', '2003-03-22',0,'not yet'),
('hoang', '12345', 5, 'tran viet hoang', 1, 'Hai Phong', 'hoang123@gmail.com', '0123456789', '2003-05-11',0, 'not yet'),
('tho', '12345', 5, 'nguyen thi tho', 0, 'Ha Noi', 'tho123@gmail.com', '0123456789', '2003-02-10',0, 'not yet');


INSERT INTO Lecturers
VALUES
(1,'Jose', '12345', 3, 'Jose Portilla', 1, 'United States', 'jmportilla1@gmail.com', '702-857-3185', '1994-06-04',1,'','', 'Jose Marcial Portilla has a BS and MS in Mechanical Engineering from Santa Clara University and years of experience as a professional instructor and trainer for Data Science, Machine Learning and Python Programming. He has publications and patents in various fields such as microfluidics, materials science, and data science. Over the course of his career he has developed a skill set in analyzing data and he hopes to use his experience in teaching and data science to help other people learn the power of programming, the ability to analyze data, and the skills needed to present the data in clear and beautiful visualizations. Currently he works as the Head of Data Science for Pierian Training and provides in-person data science and python programming training courses to employees working at top companies, including General Electric, Cigna, SalesForce, Starbucks, McKinsey and many more. Feel free to check out the website link to find out more information about training offerings.'),
(2,'Yu', '12345', 3, 'Dr. Angela Yu', 0, 'China', 'Yu123@gmail.com', '0123456789', '1992-12-09',1,'','', 'Dr. Angela Yu is a prominent figure in the tech education space, best known for her role as a developer and lead instructor at the London App Brewery, Londons leading Programming Bootcamp'),
(3,'MARCO', '12345', 3, 'YASSIN MARCO', 1, 'Canada', 'Marco123@gmail.com', '0123456789', '1993-04-11',1,'','', 'Yassin Marco, based in Montréal, Quebec, Canada, is currently a Online Instructor Chez Udemy at Udemy Cg-Techs Indépendant, bringing experience from previous roles at Udemy, Cg-Techs and Indépendant. Yassin Marco holds a 2018 - 2020 CFA Institute. With a robust skill set that includes Microsoft Excel, Management, Finance and more, Yassin Marco contributes valuable insights to the industry.'),
(4,'Tim', '12345', 3, 'Tim Buchalka', 1, 'TAU', 'tim@learnprogramming.academy', '0123456789', '1994-02-02',1,'','', 'he has been a professional software developer for over 40 years. During his career, he has worked for major companies such as Fujitsu, Mitsubishi, and Saab'),
(5,'Jean', '12345', 3, 'Jean-Paul Roberts', 1, 'Liverpool', 'jean-paul_roberts@scee.net', '0123456789', '1990-04-10',1,'','', 'I am now self employed developing apps for Android; programming in a range of languages including Java, Javascript and Python; and helping the next generation of programmers gain the skills that I have acquired over the years.'),
(6,'Ivan', '12345', 3, 'Ivan Lourenço Gomes', 1, 'Portugal', 'ivan77diamonds.com', '0123456789', '1999-11-22',1,'','', 'Renowned for a dynamic teaching style that mixes project-based learning with incremental challenges, his courses are the right fit for you, whether you are just starting your learning journey or looking to deepen existing skills.'),
(7,'Ardit', '12345', 3, 'Ardit Sulce', 1, 'Germany', 'ardit@hotmail.com', '0123456789', '1991-06-24',1,'','', 'Ardits professional career in Python programming is highlighted by his collaborations with various international entities. His notable projects include working with the Center for Conservation Geography to map and analyze Australian ecosystems, engaging in image processing projects with the Swiss company in-Terra, and applying Python data mining techniques with Rapid Intelligence, the Australian data science company that helps businesses make decisions using data.'),
(8,'Kyle', '12345', 3, 'Kyle Pew', 1, 'United States', 'kyle@learnit.com', '0123456789', '1989-07-10',1,'','', 'Kyle is a Microsoft Certified Trainer (MCT) and a certified Microsoft Office Master Instructor and has been teaching and consulting for the past 20+ years on various computer applications'),
(9,'Jonas', '12345', 3, 'Jonas Schmedtmann', 1, 'Portugal', 'Jonas123@gmail.com', '0123456789', '1998-09-09',1,'','', 'Jonas Schmedtmann is full-stack web developer and designer with a passion for building beautiful web interfaces from scratch. I have been building websites and apps since 2010 and also have a Masters degree in Engineering.'),
(10,'Anthony', '12345', 3, 'Anthony Alicea', 1, 'New York', 'anthony@greystonemonticello.com', '0123456789', '1988-03-22',1, '','','Tony has been programming since he was 12 years old, and got into web sites and web application development at 16. After graduating with a Computer Science degree from Case Western Reserve University, Tony continued with that interest as a Microsoft certified software application developer and architect, database designer, and user interface designer.'),
(11,'Febin', '12345', 4, 'Febin George', 1, 'India', 'Febin@gmail.com', '0123456789', '2003-07-10',0,'','', 'Udemy helps me do that by connecting us together through the world of online education.'),
(12,'Ahmed', '12345', 4, 'Ahmed El Mohandes', 1, 'India', 'Ahmed123@gmail.com', '0123456789', '2003-11-22',0, '','', 'Ahmed El Mohandes has a strong background in software development and data science instruction, most recent role was at EC-Council, where they served as a Training Content Instructor/Engineer for software development and data science. Prior to that, they held similar positions at almentor, Reed.co.uk, Udemy, Tutorialspoint, and BitDegree. Ahmed has extensive experience developing and instructing courses in software engineering and data science.'),
(13,'Hemanth', '12345', 4, 'Hemanth Kumar', 1, 'India', 'Hemanth@gmail.com', '0123456789', '2003-02-11',0, '','', 'Hemanth Kumar has years of experience as a professional instructor and trainer for Data Science and programming. Over the course of his career he has developed a skill set in analyzing data and Design data modeling processes to create algorithms and predictive models and perform custom analysis and he hopes to use his experience in teaching data science and programming to help other people learn the power of programming the ability to analyze data, as well as present the data in clear and beautiful visualizations'),
(14,'Kirill', '12345', 4, 'Kirill Eremenko', 1, 'USA', 'Kirill@gmail.com', '0123456789', '2003-05-09',0, '','', 'From my courses you will straight away notice how I combine my real-life experience and academic background in Physics and Mathematics to deliver professional step-by-step coaching in the space of Data Science. One of the strongest sides of my teaching style is that I focus on intuitive explanations, so you can be sure that you will truly understand even the most complex topics.'),
(15,'Juan', '12345', 4, 'Juan E. Galvan', 1, 'Canada', 'Juan@gmail.com', '0123456789', '2002-03-22',0, '','', 'My background is in the tech space from Digital Marketing, E-commerce, Web Development to Programming. I believe in continuous education with the best of a University Degree without all the downsides of burdensome costs and inefficient methods. I look forward to helping you expand your skillsets.');

INSERT INTO CategoryOfCourse
Values(1,'Software Engineer'),
	(2,'Language'),
	(3,'Marketing'),
	(4,'Design');

INSERT INTO CategoryOfBlog
Values(1,'Software Engineer'),
	(2,'Language'),
	(3,'Marketing'),
	(4,'Design');

INSERT INTO Course 
VALUES
('100 Days of Code: The Complete Python Pro Bootcamp', 1899000, '2024-05-15', 1, 1, 0.87, '', '', '', 'At 60+ hours, this Python course is without a doubt the most comprehensive Python course available anywhere online. We will take you step-by-step through engaging video tutorials and teach you everything you need to know to succeed as a Python developer.',''),
('The Complete 2024 Web Development Bootcamp', 1599000, '2024-05-15', 1, 1, 0.88, '', '', '', 'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps',''),
('The Complete Python Bootcamp From Zero to Hero in Python', 1399000, '2024-05-15', 4, 2, 0.86, '', '', '', 'Learn Python like a Professional Start from the basics and go all the way to creating your own applications and games',''),
('The Complete SQL Bootcamp: Go from Zero to Hero', 2199000, '2024-05-15', 1, 2, 0.86, '', '', '', 'Become an expert at SQL!',''),
('The Complete JavaScript Course 2024: From Zero to Expert!', 2499000, '2024-05-15', 4, 3, 0.88, '', '', '', 'The modern JavaScript course for everyone! Master JavaScript with projects, challenges, and theory. Many courses in one!',''),
('The Ultimate React Course 2024: React, Redux & More', 1699000, '2024-05-15', 3, 3, 0.88, '', '', '', 'Master modern React from beginner to advanced! Context API, React Query, Redux Toolkit, Tailwind, advanced patterns',''),
('Python Mega Course: Learn Python in 60 Days, Build 20 Apps', 2499000, '2024-05-15', 1, 4, 0.68, '', '', '', 'Learn Python completely in 60 days or less by building 20 real-world applications from web development to data science.',''),
('Interactive Data Visualization with Python and Bokeh', 399000, '2024-05-15', 3, 4, 0.5, '', '', '', 'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps',''),
('Complete Web Design: HTML, CSS, Javascript, jQuery, Vue, Git', 1149000, '2024-05-15', 4, 5, 0.83, '', '', '', 'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps',''),
('Vue JS 3: Développement Web Moderne avec Vuex et Vue Router', 399000, '2024-05-15', 2, 5, 0.1, '', '', '', 'Apprenez rapidement le développement Web Vue3 depuis le début absolu. Exercices et défis inclus + 5 projets',''),
('Become a Product Manager | Learn the Skills & Get the Job', 2199000, '2024-05-15', 3, 6, 0.89, '', '', '', 'The most complete course available on Product Management. 13+ hours of videos, activities, interviews, & more',''),
('Instagram Marketing 2024: Hashtags, Live, Stories, Ads &more', 1249000, '2024-05-15', 3, 7, 0.84, '', '', '', 'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps',''),
('User Experience (UX): The Ultimate Guide to Usability and UX', 999000, '2024-05-15', 4, 1, 0, '', '', '', 'Get a job in UX and build your user research and UX design skills with this hands-on user experience training course.',''),
('How to Draw Cute Cartoon Characters', 899000, '2024-05-15', 4, 9, 0.78, '', '', '', 'Learn the secrets to drawing cute cartoons quickly and easily',''),
('How to Learn and Memorize the Vocabulary of Any Language', 1099000, '2024-05-15', 2, 10, 0.82, '', '', '', 'Using the Magnetic Memory Method','');