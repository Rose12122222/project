USE [master]
GO
/****** Object:  Database [lastprj]    Script Date: 4/23/2024 9:47:08 AM ******/
CREATE DATABASE [lastprj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lastprj', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\lastprj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lastprj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\lastprj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [lastprj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lastprj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lastprj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lastprj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lastprj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lastprj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lastprj] SET ARITHABORT OFF 
GO
ALTER DATABASE [lastprj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lastprj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lastprj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lastprj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lastprj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lastprj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lastprj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lastprj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lastprj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lastprj] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lastprj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lastprj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lastprj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lastprj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lastprj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lastprj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lastprj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lastprj] SET RECOVERY FULL 
GO
ALTER DATABASE [lastprj] SET  MULTI_USER 
GO
ALTER DATABASE [lastprj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lastprj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lastprj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lastprj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lastprj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lastprj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'lastprj', N'ON'
GO
ALTER DATABASE [lastprj] SET QUERY_STORE = OFF
GO
USE [lastprj]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NULL,
	[password] [nvarchar](20) NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoDetail]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoDetail](
	[aid] [int] NULL,
	[gender] [int] NULL,
	[email] [nvarchar](50) NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[address] [nvarchar](20) NULL,
	[birthday] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NULL,
	[date] [varchar](40) NULL,
	[total] [float] NULL,
	[numberOfItem] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[oid] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/23/2024 9:47:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NULL,
	[type] [nvarchar](50) NULL,
	[date] [nvarchar](50) NOT NULL,
	[amount] [int] NULL,
	[cid] [int] NULL,
	[discount] [float] NULL,
	[img] [nvarchar](100) NULL,
	[alt] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (1, N'nghia', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (2, N'hai', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (3, N'anh', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (4, N'hoang', N'123', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (5, N'nhat', N'123', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (6, N'anhh', N'123', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (7, N'admin', N'123', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (8, N'tien', N'123', 3)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (9, N'yennhi', N'123', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (10, N'lui', N'0503', 2)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (11, N'utnhi', N'123', 3)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (12, N'nhiham', N'    ', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'pokemon')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'strawberry teddy')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'totoro teddy')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'orther teddy')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[InfoDetail] ([aid], [gender], [email], [firstName], [lastName], [address], [birthday]) VALUES (1, 1, N'nghianvhe176638@fpt.edu.vn', N'Nguyen Van', N'Nghia', N'Tuyen Quang', CAST(N'2003-10-23' AS Date))
INSERT [dbo].[InfoDetail] ([aid], [gender], [email], [firstName], [lastName], [address], [birthday]) VALUES (2, 1, N'hainvhe172343@fpt.edu.vn', N'Nguyen Van', N'Hai', N'Hung Yen', CAST(N'2003-11-20' AS Date))
INSERT [dbo].[InfoDetail] ([aid], [gender], [email], [firstName], [lastName], [address], [birthday]) VALUES (3, 1, N'anhpdhe170032@fpt.edu.vn', N'Pham Duc', N'Anh', N'Hung Yen', CAST(N'2003-03-11' AS Date))
INSERT [dbo].[InfoDetail] ([aid], [gender], [email], [firstName], [lastName], [address], [birthday]) VALUES (4, 1, N'hoanghy981@gmail.com', N'Nguyen Thai Luong', N'Hoang', N'Hung Yen', CAST(N'2003-10-11' AS Date))
INSERT [dbo].[InfoDetail] ([aid], [gender], [email], [firstName], [lastName], [address], [birthday]) VALUES (5, 1, N'nhat123@fpt.edu.vn', N'Nguyen Duy', N'Nhat', N'Hung Yen', CAST(N'2003-09-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (1, 1, N'2024-03-03', 299000, 3, 1)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (2, 2, N'2024-03-04', 399000, 2, 1)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (3, 8, N'Mar 08, 2024', 69300, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (4, 8, N'Mar 10, 2024', 123000, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (5, 8, N'Mar 12, 2024', 69300, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (6, 8, N'Mar 12, 2024', 109000, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (7, 8, N'Mar 12, 2024', 6600, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (8, 3, N'Mar 12, 2024', 360000, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (9, 6, N'Mar 12, 2024', 138600, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (10, 6, N'Mar 12, 2024', 109000, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (11, 5, N'Apr 23, 2024', 44500, 1, 0)
INSERT [dbo].[Orders] ([id], [aid], [date], [total], [numberOfItem], [status]) VALUES (12, 11, N'Apr 23, 2024', 44500, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [pid], [oid], [quantity]) VALUES (13, 11, 11, 1)
INSERT [dbo].[Payment] ([id], [pid], [oid], [quantity]) VALUES (14, 11, 12, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (7, N'Totoro teddy', 209000, N'Gray', N'2024-01-01', 100, 3, 0, N'assets\img\product\product3a.jpg', N'totoro', N'gấu bông totoro đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (8, N'Totoro lazy bear', 299000, N'Gray', N'2024-01-01', 100, 3, 0.5, N'assets\img\product\product3b.jpg', N'totoro lazy', N'gấu bông totoro lazy đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (9, N'Totoro smile', 199000, N'Gray', N'2024-01-01', 100, 3, 0, N'assets\img\product\product3c.jpg', N'totoro smile', N'gấu bông totoro smile đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (10, N'Cat king ', 59000, N'Gray', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4a.jpg', N'cat king', N'gấu bông cat king đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (11, N'Cat lazy ', 89000, N'Gray', N'2024-01-01', 99, 4, 0.5, N'assets\img\product\product4b.jpg', N'cat lazy ', N'gấu bông cat lazy đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (12, N'Cat cute ', 100000, N'Gray', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4c.jpg', N'cat cute', N'gấu bông cat cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (13, N'Minion 30cm ', 100000, N'Yellow', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4d.jpg', N'minion1', N'gấu bông  cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (14, N'Minion2 35cm', 150000, N'Yellow', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4e.jpg', N'minion2', N'gấu bông  cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (15, N'Gấu bông bạch tuộc ', 199000, N'Pink', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4f.jpg', N'gấu bạch tuộc', N'gấu bông  cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (16, N'Gấu nâu ', 109000, N'Brown', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4g.jpg', N'gấu nâu', N'gấu bông cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (17, N'Pokemon ', 100000, N'Black', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4h.jpg', N'true love', N'gấu bông cute đáng iu')
INSERT [dbo].[Product] ([id], [name], [price], [type], [date], [amount], [cid], [discount], [img], [alt], [description]) VALUES (18, N'Pig', 100000, N'Pink', N'2024-01-01', 100, 4, 0.5, N'assets\img\product\product4i.jpg', N'Pig', N'gấu bông cute đáng iu')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDnew]    Script Date: 4/23/2024 9:47:08 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IDnew] UNIQUE NONCLUSTERED 
(
	[username] ASC,
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InfoDetail]  WITH CHECK ADD FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([oid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [lastprj] SET  READ_WRITE 
GO
