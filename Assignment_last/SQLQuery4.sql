create database lastprj
DROP DATABASE lastprj;
use lastprj
CREATE TABLE Account (
    id INT identity(1,1) PRIMARY KEY NOT NULL,
    username NVARCHAR(20),
    password NVARCHAR(20) NOT NULL,
	role int
    CONSTRAINT IDnew UNIQUE (username, password)
);

CREATE TABLE InfoDetail (
    aid INT,
    gender int,
	email NVARCHAR(50),
    firstName NVARCHAR(20),
    lastName NVARCHAR(20),
    address NVARCHAR(20),
    birthday DATE,
    FOREIGN KEY (aid) REFERENCES Account(id)
);


CREATE TABLE Category (
    id  INT identity(1,1) PRIMARY KEY,
    name NVARCHAR(50), 


);

CREATE TABLE Product (
    id int identity(1,1) PRIMARY KEY NOT NULL,
	name NVARCHAR(50) NOT NULL,
	price FLOAT,
    type NVARCHAR(50),
    date nvarchar(50) NOT NULL,
    amount INT,
	cid  INT,
	discount float,
	img nvarchar(100),
	alt nvarchar(50),
	description nvarchar(500),
    FOREIGN KEY (cid ) REFERENCES Category(id)
);

CREATE TABLE Orders(
	id int identity(1,1) PRIMARY KEY,
	aid int,
	date varchar(40),
	total float,
	numberOfItem int,
	status int,
	FOREIGN KEY (aid) REFERENCES Account(id)
);


CREATE TABLE Payment(
	id int identity(1,1) PRIMARY KEY,
	pid int,
	oid int,
	quantity int,
	FOREIGN KEY (pid) REFERENCES Product(id),
	FOREIGN KEY (oid) REFERENCES Orders(id),
	
);


--them data vao bang Account
drop table Account
select* from Account
INSERT INTO Account VALUES ('nghia','123','1')
INSERT INTO Account VALUES ('hai','123','1')
INSERT INTO Account VALUES ('anh','123','1')
INSERT INTO Account VALUES ('hoang','123','2')
INSERT INTO Account VALUES ('nhat','123','2')

--them data vao bang infodetail
select*from InfoDetail
drop table InfoDetail
ALTER TABLE Infodetail

INSERT INTO Infodetail(aid,gender,email, firstName, lastName, address, birthday) VALUES (1, 1, 'nghianvhe176638@fpt.edu.vn', 'Nguyen Van', 'Nghia', 'Tuyen Quang', '2003-10-23'),
																						  (2, 1, 'hainvhe172343@fpt.edu.vn', 'Nguyen Van', 'Hai', 'Hung Yen', '2003-11-20'),
																						  (3, 1, 'anhpdhe170032@fpt.edu.vn', 'Pham Duc', 'Anh', 'Hung Yen', '2003-03-11'),
																						  (4, 1, 'hoanghy981@gmail.com', 'Nguyen Thai Luong', 'Hoang', 'Hung Yen', '2003-10-11'),
																						  (5, 1, 'nhat123@fpt.edu.vn', 'Nguyen Duy', 'Nhat', 'Hung Yen', '2003-09-23');
--them data vao bang categoty
select* from Category
drop table Category
insert into Category  ( name) values('pokemon'),
									('strawberry teddy'),
									('totoro teddy'),
									('orther teddy')
												
											
											
												



-- them data vao bang product
select * from Product
drop table Product


insert into Product(name,price,type,date,amount,cid,discount,img,alt,description) values('Pikachu teddy',13200,'Yellow','2024-01-01',100,1,0.5,'assets\img\product\product1a.jpg','picachu',N'gấu bông picachu đáng iu'),
																						('Lizardon teddy',55000,'Red','2024-01-01',100,1,0.5,'assets\img\product\product1b.jpg','lizardon',N'Rồng lizardon đáng iu'),
																						('Pichu teddy',123000,'Yellow','2024-01-01',100,1,0,'assets\img\product\product1c.jpg','pichu',N'gấu bông pica cấp 1'),
																						('Losto teddy',120000,'Red','2024-01-01',100,2,0,'assets\img\product\product2a.jpg','losto',N'gấu bông losto đáng iu'),
																						('Strawberry teddy',99000,'Red','2024-01-01',100,2,0.3,'assets\img\product\product2b.jpg','strawberry',N'gấu bông strawberry đáng iu'),
																						('Brown teddy',109000,'Brown','2024-01-01',100,2,0,'assets\img\product\product2c.jpg','brown',N'gấu bông brown đáng iu'),
																						('Totoro teddy',209000,'Gray','2024-01-01',100,3,0,'assets\img\product\product3a.jpg','totoro',N'gấu bông totoro đáng iu'),
																						('Totoro lazy bear',299000,'Gray','2024-01-01',100,3,0.5,'assets\img\product\product3b.jpg','totoro lazy',N'gấu bông totoro lazy đáng iu'),
																						('Totoro smile',199000,'Gray','2024-01-01',100,3,0,'assets\img\product\product3c.jpg','totoro smile',N'gấu bông totoro smile đáng iu'),
																						('Cat king ',59000,'Gray','2024-01-01',100,4,0.5,'assets\img\product\product4a.jpg','cat king',N'gấu bông cat king đáng iu'),
																						('Cat lazy ',89000,'Gray','2024-01-01',100,4,0.5,'assets\img\product\product4b.jpg','cat lazy ',N'gấu bông cat lazy đáng iu'),
																						('Cat cute ',100000,'Gray','2024-01-01',100,4,0.5,'assets\img\product\product4c.jpg','cat cute',N'gấu bông cat cute đáng iu'),
																						('Minion 30cm ',100000,'Yellow','2024-01-01',100,4,0.5,'assets\img\product\product4d.jpg','minion1',N'gấu bông  cute đáng iu'),
																						('Minion2 35cm',150000,'Yellow','2024-01-01',100,4,0.5,'assets\img\product\product4e.jpg','minion2',N'gấu bông  cute đáng iu'),
																						(N'Gấu bông bạch tuộc ',199000,'Pink','2024-01-01',100,4,0.5,'assets\img\product\product4f.jpg',N'gấu bạch tuộc',N'gấu bông  cute đáng iu'),
																						(N'Gấu nâu ',109000,'Brown','2024-01-01',100,4,0.5,'assets\img\product\product4g.jpg',N'gấu nâu',N'gấu bông cute đáng iu'),
																						('Pokemon ',100000,'Black','2024-01-01',100,4,0.5,'assets\img\product\product4h.jpg',N'true love',N'gấu bông cute đáng iu'),
																						('Pig',100000,'Pink','2024-01-01',100,4,0.5,'assets\img\product\product4i.jpg','Pig',N'gấu bông cute đáng iu')



--them data vao payment
select*from[dbo].[Payment]

CREATE TABLE Payment(
	id int identity(1,1) PRIMARY KEY,
	pid int,
	oid int,
	quantity int,
	FOREIGN KEY (pid) REFERENCES Product(id),
	FOREIGN KEY (oid) REFERENCES Orders(id),
	
);


INSERT INTO Payment (pid, oid, quantity) 
VALUES 
(3, 1, 5),
(3, 2, 5);


drop table [dbo].[InfoDetail]
drop table [dbo].[Payment]
drop table [dbo].[Orders]
go

--them data vao order
select*from [dbo].[Orders]

CREATE TABLE Orders(
	id int identity(1,1) PRIMARY KEY,
	aid int,
	date varchar(40),
	total float,
	numberOfItem int,
	status int,
	FOREIGN KEY (aid) REFERENCES Account(id)
);
insert into [dbo].[Orders] (aid,date, total, [numberOfItem],[status]) values(1, '2024-03-03', 299000, 3, 1),
																			(2, '2024-03-04', 399000, 2, 0);

select top 1 [id] from [dbo].[Orders] order by [id] desc
