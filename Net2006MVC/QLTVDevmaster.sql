USE [master]
GO
/****** Object:  Database [QuanLyThuVienDevmaster]    Script Date: 8/13/2020 8:07:56 PM ******/
CREATE DATABASE [QuanLyThuVienDevmaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyThuVienDevmaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EAGLEMSSQL17\MSSQL\DATA\QuanLyThuVienDevmaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyThuVienDevmaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EAGLEMSSQL17\MSSQL\DATA\QuanLyThuVienDevmaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyThuVienDevmaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyThuVienDevmaster', N'ON'
GO
USE [QuanLyThuVienDevmaster]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[BookTitleId] [int] NOT NULL,
	[BookLocation] [int] NULL,
	[OriginalState] [tinyint] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK__Book__3214EC0737E641AA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookBorrowReturn]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookBorrowReturn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[ReaderId] [int] NOT NULL,
	[Deposits] [decimal](18, 2) NOT NULL,
	[BorrowFee] [decimal](18, 2) NOT NULL,
	[PenaltyFee] [decimal](18, 2) NULL,
	[IsOnline] [bit] NULL,
	[IsBorrow] [bit] NULL,
	[IsReturn] [bit] NULL,
	[CreatedTime] [datetime] NULL,
	[ReturnTime] [datetime] NULL,
	[BorrowTime] [datetime] NULL,
	[Notes] [ntext] NULL,
 CONSTRAINT [PK__BookBorr__3214EC07AB24C24C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookBorrowReturnDetail]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookBorrowReturnDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookBorrowReturnId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[ReturnState] [tinyint] NULL,
	[Notes] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookLocation]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
	[BookId] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_BookLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTitle]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTitle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[ReleaserId] [int] NOT NULL,
	[Image] [nvarchar](500) NULL,
	[PublishYear] [int] NULL,
	[PageNo] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK__BookTitl__3214EC072E161088] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookType]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[DOB] [datetime] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[DOB] [datetime] NULL,
	[Money] [decimal](18, 2) NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Releaser]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Releaser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Notes] [ntext] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Releaser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReaderId] [int] NOT NULL,
	[BookTitleId] [int] NOT NULL,
	[Point] [tinyint] NULL,
	[CreatedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfigParameter]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfigParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[CreatedTime] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (1, N'DEV01', N'Trịnh Văn', N'Trung', N'trungtv@gmail.com', N'123456', N'09123456789', 0, CAST(N'1979-11-01T00:00:00.000' AS DateTime), CAST(N'2020-03-03T19:34:37.240' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (2, N'DEV02', N'Quốc', N'Việt', N'vietqq@gmail.com', N'123456', N'09123456789', 0, CAST(N'1997-11-01T00:00:00.000' AS DateTime), CAST(N'2020-03-03T19:35:02.250' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (3, N'DEV03', N'Nguyễn Thành', N'Nam', N'namnt@gmail.com', N'123456', N'09123456789', 1, CAST(N'1997-11-20T00:00:00.000' AS DateTime), CAST(N'2020-03-03T19:35:27.557' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (4, N'123', N'a', N'b', N'123@gmail.com', N'123', N'123456789', 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-03-24T21:08:05.080' AS DateTime), NULL, 1, NULL, N'', 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (5, N'123', N'qwe', N'ert', N'abc@gmail.com', N'asjkdh', N'askjdh', 1, CAST(N'2020-03-24T21:26:35.640' AS DateTime), CAST(N'2020-03-24T21:26:38.913' AS DateTime), NULL, 1, NULL, N'', 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (6, N'123', N'qwe', N'ert', N'abc@gmail.com', N'asjkdh', N'askjdh', 1, CAST(N'2020-05-12T19:18:59.227' AS DateTime), CAST(N'2020-05-12T19:19:01.147' AS DateTime), NULL, 1, NULL, N'', 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (7, N'A024', N'Nguyễn Thành', N'Nam', N'que@gmail.com', N'123456', N'0123456789', 0, CAST(N'2020-04-26T00:00:00.000' AS DateTime), CAST(N'2020-05-12T20:19:07.230' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (8, N'A023', N'Nguyễn Thành', N'Trung', N'que@gmail.com', N'123456', N'0123456789', 0, CAST(N'2020-04-26T00:00:00.000' AS DateTime), CAST(N'2020-05-12T20:21:18.417' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (9, N'123', N'qwe', N'ert', N'abc@gmail.com', N'asjkdh', N'askjdh', 1, CAST(N'2020-05-12T21:18:39.273' AS DateTime), CAST(N'2020-05-12T21:18:39.583' AS DateTime), NULL, 1, NULL, N'', 1)
INSERT [dbo].[Employee] ([Id], [Code], [FirstName], [LastName], [Email], [Password], [Phone], [Gender], [DOB], [CreatedTime], [UpdatedTime], [CreatedBy], [UpdatedBy], [Notes], [Status]) VALUES (10, N'123', N'qwe', N'ert', N'abc@gmail.com', N'asjkdh', N'askjdh', 1, CAST(N'2020-05-12T21:18:39.273' AS DateTime), CAST(N'2020-05-12T21:20:01.643' AS DateTime), NULL, 1, NULL, N'', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (2, N'A01', N'ĐHBKHCM', N'Test', 1)
INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (3, N'A02', N'HVBCVT', N'Test2', 1)
INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (4, N'A020', N'ĐHBKHN', N'Test', 1)
INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (5, N'A021', N'ĐHBKHN', N'Test', 1)
INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (6, N'A022', N'ĐHBKHCM', N'Test2', NULL)
INSERT [dbo].[Publisher] ([Id], [Code], [Name], [Notes], [Status]) VALUES (7, N'A024', N'ĐHBKHN', N'Test', NULL)
SET IDENTITY_INSERT [dbo].[Publisher] OFF
ALTER TABLE [dbo].[Author] ADD  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Author] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__OriginalSt__59063A47]  DEFAULT ((100)) FOR [OriginalState]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__CreatedTim__59FA5E80]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__Status__5CD6CB2B]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BookBorrowReturn] ADD  CONSTRAINT [DF__BookBorro__IsOnl__66603565]  DEFAULT ((0)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[BookBorrowReturn] ADD  CONSTRAINT [DF__BookBorro__IsBor__6754599E]  DEFAULT ((0)) FOR [IsBorrow]
GO
ALTER TABLE [dbo].[BookBorrowReturn] ADD  CONSTRAINT [DF__BookBorro__IsRet__68487DD7]  DEFAULT ((0)) FOR [IsReturn]
GO
ALTER TABLE [dbo].[BookBorrowReturn] ADD  CONSTRAINT [DF__BookBorro__Creat__693CA210]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[BookBorrowReturnDetail] ADD  DEFAULT ((100)) FOR [ReturnState]
GO
ALTER TABLE [dbo].[BookTitle] ADD  CONSTRAINT [DF__BookTitle__Creat__52593CB8]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[BookTitle] ADD  CONSTRAINT [DF__BookTitle__Statu__5535A963]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BookType] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Publisher] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Reader] ADD  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Reader] ADD  DEFAULT ((0)) FOR [Money]
GO
ALTER TABLE [dbo].[Reader] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Reader] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[SystemConfigParameter] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[SystemConfigParameter] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__BookTitleI__5812160E] FOREIGN KEY([BookTitleId])
REFERENCES [dbo].[BookTitle] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__BookTitleI__5812160E]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__CreatedBy__5AEE82B9] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__CreatedBy__5AEE82B9]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__UpdatedBy__5BE2A6F2] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__UpdatedBy__5BE2A6F2]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookLocation] FOREIGN KEY([BookLocation])
REFERENCES [dbo].[BookLocation] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookLocation]
GO
ALTER TABLE [dbo].[BookBorrowReturn]  WITH CHECK ADD  CONSTRAINT [FK__BookBorro__Reade__656C112C] FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([Id])
GO
ALTER TABLE [dbo].[BookBorrowReturn] CHECK CONSTRAINT [FK__BookBorro__Reade__656C112C]
GO
ALTER TABLE [dbo].[BookBorrowReturnDetail]  WITH CHECK ADD  CONSTRAINT [FK__BookBorro__BookB__6C190EBB] FOREIGN KEY([BookBorrowReturnId])
REFERENCES [dbo].[BookBorrowReturn] ([Id])
GO
ALTER TABLE [dbo].[BookBorrowReturnDetail] CHECK CONSTRAINT [FK__BookBorro__BookB__6C190EBB]
GO
ALTER TABLE [dbo].[BookBorrowReturnDetail]  WITH CHECK ADD  CONSTRAINT [FK__BookBorro__BookI__6D0D32F4] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[BookBorrowReturnDetail] CHECK CONSTRAINT [FK__BookBorro__BookI__6D0D32F4]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK__BookTitle__Autho__5070F446] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK__BookTitle__Autho__5070F446]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK__BookTitle__BookT__5165187F] FOREIGN KEY([BookTypeId])
REFERENCES [dbo].[BookType] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK__BookTitle__BookT__5165187F]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK__BookTitle__Creat__534D60F1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK__BookTitle__Creat__534D60F1]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK__BookTitle__Publi__4F7CD00D] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK__BookTitle__Publi__4F7CD00D]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK__BookTitle__Updat__5441852A] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK__BookTitle__Updat__5441852A]
GO
ALTER TABLE [dbo].[BookTitle]  WITH CHECK ADD  CONSTRAINT [FK_BookTitle_Releaser] FOREIGN KEY([ReleaserId])
REFERENCES [dbo].[Releaser] ([Id])
GO
ALTER TABLE [dbo].[BookTitle] CHECK CONSTRAINT [FK_BookTitle_Releaser]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__BookTitl__60A75C0F] FOREIGN KEY([BookTitleId])
REFERENCES [dbo].[BookTitle] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__BookTitl__60A75C0F]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[Employee_Add]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employee_Add]
	@Code varchar(20)
	,@FirstName nvarchar(255)
	,@LastName nvarchar(255)
	,@Email varchar(255)
	,@Password varchar(255)
	,@Phone varchar(50)
	,@Gender tinyint
	,@DOB datetime
	,@CreatedBy int
	,@Notes ntext
	,@Status tinyint
as
BEGIN
	INSERT INTO Employee(
		Code
		,FirstName
		,LastName
		,Email
		,Password
		,Phone
		,Gender
		,DOB
		,CreatedTime
		,CreatedBy
		,Notes
		,Status
	) VALUES(
		@Code
		,@FirstName
		,@LastName
		,@Email
		,@Password
		,@Phone
		,@Gender
		,@DOB
		,GETDATE()
		,@CreatedBy
		,@Notes
		,@Status
	)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_GetAll]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Employee_GetAll]
as
BEGIN
	SELECT * FROM Employee
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_GetById]    Script Date: 8/13/2020 8:07:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Employee_GetById]
@Id INT
as
BEGIN
	SELECT TOP 1 * FROM Employee WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyThuVienDevmaster] SET  READ_WRITE 
GO
