USE [master]
GO
/****** Object:  Database [QLSV_V2]    Script Date: 8/6/2020 7:18:16 PM ******/
CREATE DATABASE [QLSV_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EAGLEMSSQL17\MSSQL\DATA\QLSV_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSV_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EAGLEMSSQL17\MSSQL\DATA\QLSV_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLSV_V2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV_V2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [QLSV_V2] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLSV_V2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSV_V2', N'ON'
GO
ALTER DATABASE [QLSV_V2] SET QUERY_STORE = OFF
GO
USE [QLSV_V2]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SPLIT_STRING]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SPLIT_STRING](
	@Str NVARCHAR(MAX),
	@Char NVARCHAR(1)
)
RETURNS @tbl TABLE (
	val nvarchar(MAX)
)
AS
BEGIN
	WHILE CHARINDEX(',', @Str) > 0
	BEGIN
		INSERT INTO @tbl
		SELECT LEFT(@Str, CHARINDEX(',', @Str) - 1)
		SELECT @Str = RIGHT(@Str, LEN(@Str) - CHARINDEX(',', @Str)) 
	END
	INSERT INTO @tbl
	SELECT @Str
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SUBSTRING]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SUBSTRING](
	@Str NVARCHAR(MAX),
	@StartIndex INT,
	@CountChar INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Res NVARCHAR(MAX)
	SELECT @Res = RIGHT(LEFT(@Str, @StartIndex + @CountChar - 1), @CountChar)
	RETURN @Res
END
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MA] [char](4) NULL,
	[TEN] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDK] [int] NOT NULL,
	[TEN] [nvarchar](255) NULL,
	[PHONG] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINH_VIEN]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINH_VIEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDL] [int] NOT NULL,
	[HO] [nvarchar](255) NULL,
	[TEN] [nvarchar](255) NULL,
	[DIA_CHI] [nvarchar](500) NULL,
	[NGAY_SINH] [datetime] NULL,
	[GIOI_TINH] [tinyint] NULL,
	[DTB] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_THONG_TIN_SINH_VIEN]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_THONG_TIN_SINH_VIEN]
WITH SCHEMABINDING
AS
	select TOP 100 percent SV.[ID] AS IDSV
		  ,SV.[HO] AS [HO_SV]
		  ,SV.[TEN] AS [TEN_SV]
		  ,SV.[DIA_CHI]
		  ,SV.[NGAY_SINH]
		  ,SV.[GIOI_TINH]
		  ,SV.[IDL]
		  ,L.TEN AS [TEN_LOP]
		  ,L.PHONG
		  ,L.IDK
		  ,K.TEN AS [TEN_KHOA]
	from [dbo].SINH_VIEN SV
	JOIN [dbo].LOP L ON SV.IDL = L.ID
	JOIN [dbo].KHOA K ON K.ID = L.IDK
	order by SV.[ID]
GO
/****** Object:  Table [dbo].[HOC_BONG]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOC_BONG](
	[IDHB] [int] IDENTITY(1,1) NOT NULL,
	[TEN] [nvarchar](255) NOT NULL,
	[DIEM_HB_CAN_DUOI] [float] NOT NULL,
	[DIEM_HB_CAN_TREN] [float] NOT NULL,
	[MUC_TIEN] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_HOC_BONG] PRIMARY KEY CLUSTERED 
(
	[IDHB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KET_QUA]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KET_QUA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSV] [int] NOT NULL,
	[IDMH] [int] NOT NULL,
	[DIEM] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MON_HOC]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MON_HOC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TEN] [nvarchar](255) NULL,
	[TIN_CHI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TO_CHUC]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TO_CHUC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_CHA] [int] NOT NULL,
	[TEN] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HOC_BONG] ON 

INSERT [dbo].[HOC_BONG] ([IDHB], [TEN], [DIEM_HB_CAN_DUOI], [DIEM_HB_CAN_TREN], [MUC_TIEN]) VALUES (1, N'Khá', 7, 8.4, CAST(250000 AS Decimal(18, 0)))
INSERT [dbo].[HOC_BONG] ([IDHB], [TEN], [DIEM_HB_CAN_DUOI], [DIEM_HB_CAN_TREN], [MUC_TIEN]) VALUES (2, N'Giỏi', 8.5, 9.4, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[HOC_BONG] ([IDHB], [TEN], [DIEM_HB_CAN_DUOI], [DIEM_HB_CAN_TREN], [MUC_TIEN]) VALUES (4, N'Xuất sắc', 9.5, 10, CAST(5000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[HOC_BONG] OFF
SET IDENTITY_INSERT [dbo].[KET_QUA] ON 

INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (1, 1, 1, 6.9)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (2, 1, 2, 8.4)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (3, 2, 1, 4)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (4, 2, 2, 5.4)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (5, 3, 1, 4.9)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (6, 3, 2, 6.9)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (7, 4, 1, 8.5)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (8, 4, 2, 6.9)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (9, 5, 1, 8.3)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (10, 5, 2, 6)
INSERT [dbo].[KET_QUA] ([ID], [IDSV], [IDMH], [DIEM]) VALUES (14, 7, 1, 9)
SET IDENTITY_INSERT [dbo].[KET_QUA] OFF
SET IDENTITY_INSERT [dbo].[KHOA] ON 

INSERT [dbo].[KHOA] ([ID], [MA], [TEN]) VALUES (1, N'K01 ', N'Công Nghệ Thông Tin')
INSERT [dbo].[KHOA] ([ID], [MA], [TEN]) VALUES (2, N'K01 ', N'Điện - Điện tử')
INSERT [dbo].[KHOA] ([ID], [MA], [TEN]) VALUES (3, N'K01 ', N'Hệ Thống Thông Tin')
INSERT [dbo].[KHOA] ([ID], [MA], [TEN]) VALUES (4, N'K01 ', N'Cơ khí')
INSERT [dbo].[KHOA] ([ID], [MA], [TEN]) VALUES (5, N'K01 ', N'Công trình')
SET IDENTITY_INSERT [dbo].[KHOA] OFF
SET IDENTITY_INSERT [dbo].[LOP] ON 

INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (1, 1, N'Khoa Học Máy Tính', N'A101')
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (2, 1, N'Hệ Thống Thông Tin Quản Lý', N'A102')
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (3, 1, N'An Toàn Thông Tin', N'A103')
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (4, 1, N'Công Nghệ Phần Mềm', N'A104')
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (5, 2, N'Điện Tử Viễn Thông', NULL)
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (6, 2, N'Tự Động Hóa', NULL)
INSERT [dbo].[LOP] ([ID], [IDK], [TEN], [PHONG]) VALUES (7, 2, N'Tin Học Công Nghiệp', NULL)
SET IDENTITY_INSERT [dbo].[LOP] OFF
SET IDENTITY_INSERT [dbo].[MON_HOC] ON 

INSERT [dbo].[MON_HOC] ([ID], [TEN], [TIN_CHI]) VALUES (1, N'Cấu trúc máy tính', 4)
INSERT [dbo].[MON_HOC] ([ID], [TEN], [TIN_CHI]) VALUES (2, N'Cơ sở dữ liệu', 4)
INSERT [dbo].[MON_HOC] ([ID], [TEN], [TIN_CHI]) VALUES (3, N'Giáo dục thể chất', 2)
SET IDENTITY_INSERT [dbo].[MON_HOC] OFF
SET IDENTITY_INSERT [dbo].[SINH_VIEN] ON 

INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (1, 2, N'Nguyễn Quang', N'Hải', NULL, CAST(N'1997-01-12T00:00:00.000' AS DateTime), 1, 7.65)
INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (2, 2, N'Đoàn Văn', N'Hậu', NULL, CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 4.7)
INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (3, 3, N'Nguyễn Văn', N'Toản', NULL, CAST(N'1999-10-09T00:00:00.000' AS DateTime), 1, 5.9)
INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (4, 3, N'Hà Đức', N'Chinh', NULL, CAST(N'1997-02-15T00:00:00.000' AS DateTime), 1, 7.7)
INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (5, 1, N'Nguyễn Tiến', N'Linh', NULL, CAST(N'1997-03-26T00:00:00.000' AS DateTime), 1, 7.15)
INSERT [dbo].[SINH_VIEN] ([ID], [IDL], [HO], [TEN], [DIA_CHI], [NGAY_SINH], [GIOI_TINH], [DTB]) VALUES (7, 1, N'Nguyễn Hương', N'Linh', NULL, CAST(N'2000-01-15T00:00:00.000' AS DateTime), 0, 9)
SET IDENTITY_INSERT [dbo].[SINH_VIEN] OFF
SET IDENTITY_INSERT [dbo].[TO_CHUC] ON 

INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (1, 0, N'Tập đoàn A')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (2, 0, N'Tập đoàn B')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (3, 1, N'Tổng công ty A.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (4, 2, N'Tổng công ty B.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (5, 1, N'Tổng công ty A.2')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (6, 2, N'Tổng công ty B.2')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (7, 3, N'Công ty A.1.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (8, 3, N'Công ty A.1.2')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (9, 4, N'Công ty B.1.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (10, 4, N'Công ty B.1.2')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (11, 7, N'Chi nhánh A.1.1.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (12, 8, N'Chi nhánh A.1.2.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (13, 9, N'Chi nhánh B.1.1.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (14, 10, N'Chi nhánh B.1.2.1')
INSERT [dbo].[TO_CHUC] ([ID], [ID_CHA], [TEN]) VALUES (15, 12, N'Phòng A.1.2.1.1')
SET IDENTITY_INSERT [dbo].[TO_CHUC] OFF
ALTER TABLE [dbo].[KET_QUA]  WITH CHECK ADD FOREIGN KEY([IDMH])
REFERENCES [dbo].[MON_HOC] ([ID])
GO
ALTER TABLE [dbo].[KET_QUA]  WITH CHECK ADD FOREIGN KEY([IDSV])
REFERENCES [dbo].[SINH_VIEN] ([ID])
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD FOREIGN KEY([IDK])
REFERENCES [dbo].[KHOA] ([ID])
GO
ALTER TABLE [dbo].[SINH_VIEN]  WITH CHECK ADD FOREIGN KEY([IDL])
REFERENCES [dbo].[LOP] ([ID])
GO
ALTER TABLE [dbo].[KET_QUA]  WITH CHECK ADD CHECK  (([DIEM]>=(0) AND [DIEM]<=(10)))
GO
/****** Object:  StoredProcedure [dbo].[spud_SINH_VIEN_GET_BY_ID]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_SINH_VIEN_GET_BY_ID]
@ID_SV INT
AS
BEGIN
	SELECT [ID]
	, [IDL]
	, [HO] + ' ' + [TEN] AS [HO_TEN]
	, [DIA_CHI]
	, [NGAY_SINH]
	, CASE 
		WHEN [GIOI_TINH] = 0 THEN N'Nữ'
		WHEN [GIOI_TINH] = 1 THEN N'Nam'
		ELSE N'Khác'
	END AS [GIOI_TINH]
	FROM SINH_VIEN
	WHERE ID = @ID_SV
END
GO
/****** Object:  StoredProcedure [dbo].[spud_SINH_VIEN_GET_PAGING]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_SINH_VIEN_GET_PAGING]
@PageSize INT
,@PageNumber INT
,@TotalRecord INT OUTPUT
AS
BEGIN
	DECLARE @offset INT = (@PageNumber - 1) * @PageSize
	SELECT [ID]
	, [IDL]
	, [HO] + ' ' + [TEN] AS [HO_TEN]
	, [DIA_CHI]
	, [NGAY_SINH]
	, CASE 
		WHEN [GIOI_TINH] = 0 THEN N'Nữ'
		WHEN [GIOI_TINH] = 1 THEN N'Nam'
		ELSE N'Khác'
	END AS [GIOI_TINH]
	FROM SINH_VIEN
	ORDER BY ID
	OFFSET @offset -- (@PageNumber - 1) * @PageSize
	ROWS 
	FETCH NEXT @PageSize -- @PageSize
	ROWS ONLY

	-- SET @TotalRecord = (SELECT COUNT(1) FROM SINH_VIEN)
	
	SELECT @TotalRecord = COUNT(1) FROM SINH_VIEN
END
GO
/****** Object:  StoredProcedure [dbo].[spud_TO_CHUC_GET_PARENT_BY_ID]    Script Date: 8/6/2020 7:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spud_TO_CHUC_GET_PARENT_BY_ID]
@ID INT
AS 
BEGIN
	;WITH TO_CHUC_CTE AS (
		SELECT ID, ID_CHA, TEN FROM TO_CHUC WHERE ID = @ID
		UNION ALL
		SELECT TC.ID, TC.ID_CHA, TC.TEN
		FROM TO_CHUC TC
		JOIN TO_CHUC_CTE TCTE ON TC.ID = TCTE.ID_CHA
	)
	SELECT * FROM TO_CHUC_CTE
END
GO
USE [master]
GO
ALTER DATABASE [QLSV_V2] SET  READ_WRITE 
GO
