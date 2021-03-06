USE [master]
GO
/****** Object:  Database [QuatroOpdracht]    Script Date: 23-1-2021 14:54:09 ******/
CREATE DATABASE [QuatroOpdracht]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuatroOpdracht', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\QuatroOpdracht.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuatroOpdracht_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\QuatroOpdracht_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuatroOpdracht] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuatroOpdracht].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuatroOpdracht] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuatroOpdracht] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuatroOpdracht] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuatroOpdracht] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuatroOpdracht] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET RECOVERY FULL 
GO
ALTER DATABASE [QuatroOpdracht] SET  MULTI_USER 
GO
ALTER DATABASE [QuatroOpdracht] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuatroOpdracht] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuatroOpdracht] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuatroOpdracht] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuatroOpdracht] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuatroOpdracht] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuatroOpdracht', N'ON'
GO
ALTER DATABASE [QuatroOpdracht] SET QUERY_STORE = OFF
GO
USE [QuatroOpdracht]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[Grade] [float] NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentItem]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentItem](
	[ContentItemID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[PublicationDate] [date] NOT NULL,
	[ModuleID] [int] NULL,
	[WebcastID] [int] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Name] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](30) NOT NULL,
	[IntroText] [nvarchar](100) NOT NULL,
	[Level] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterestingToCourse]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestingToCourse](
	[Course] [nvarchar](50) NOT NULL,
	[InterestingCourse] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Interesting_to_course_1] PRIMARY KEY CLUSTERED 
(
	[Course] ASC,
	[InterestingCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Version] [float] NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[FollowUpNumber] [int] NOT NULL,
 CONSTRAINT [PK_Module_1] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[Email] [nvarchar](50) NOT NULL,
	[ContentItemID] [int] NOT NULL,
	[ContentPerc] [int] NOT NULL,
 CONSTRAINT [PK_Progress] PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[ContentItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Signup]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Signup](
	[SignupID] [int] IDENTITY(1,1) NOT NULL,
	[SignupDate] [date] NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[StudentEmail] [nvarchar](50) NOT NULL,
	[CertificateID] [int] NULL,
 CONSTRAINT [PK_Signup] PRIMARY KEY CLUSTERED 
(
	[SignupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[HouseNr] [nvarchar](6) NOT NULL,
	[PostCode] [nvarchar](6) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Webcast]    Script Date: 23-1-2021 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webcast](
	[WebcastID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[SpeakerName] [nvarchar](50) NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Webcast_1] PRIMARY KEY CLUSTERED 
(
	[WebcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Module]    Script Date: 23-1-2021 14:54:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_Module] ON [dbo].[Module]
(
	[Title] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AK2_Module]    Script Date: 23-1-2021 14:54:10 ******/
CREATE NONCLUSTERED INDEX [AK2_Module] ON [dbo].[Module]
(
	[FollowUpNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Signup]    Script Date: 23-1-2021 14:54:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_Signup] ON [dbo].[Signup]
(
	[SignupDate] ASC,
	[Course] ASC,
	[StudentEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Webcast]    Script Date: 23-1-2021 14:54:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_Webcast] ON [dbo].[Webcast]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Progress] ADD  CONSTRAINT [DF_Views_ContentPerc]  DEFAULT ((0)) FOR [ContentPerc]
GO
ALTER TABLE [dbo].[ContentItem]  WITH CHECK ADD  CONSTRAINT [FK_ContentItem_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Module] ([ModuleID])
GO
ALTER TABLE [dbo].[ContentItem] CHECK CONSTRAINT [FK_ContentItem_Module]
GO
ALTER TABLE [dbo].[ContentItem]  WITH CHECK ADD  CONSTRAINT [FK_ContentItem_Webcast] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcast] ([WebcastID])
GO
ALTER TABLE [dbo].[ContentItem] CHECK CONSTRAINT [FK_ContentItem_Webcast]
GO
ALTER TABLE [dbo].[InterestingToCourse]  WITH CHECK ADD  CONSTRAINT [FK_Interesting_to_course_Course] FOREIGN KEY([InterestingCourse])
REFERENCES [dbo].[Course] ([Name])
GO
ALTER TABLE [dbo].[InterestingToCourse] CHECK CONSTRAINT [FK_Interesting_to_course_Course]
GO
ALTER TABLE [dbo].[InterestingToCourse]  WITH CHECK ADD  CONSTRAINT [FK_Interesting_to_course_Course2] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([Name])
GO
ALTER TABLE [dbo].[InterestingToCourse] CHECK CONSTRAINT [FK_Interesting_to_course_Course2]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Course] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([Name])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_Course]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_ContentItem] FOREIGN KEY([ContentItemID])
REFERENCES [dbo].[ContentItem] ([ContentItemID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_ContentItem]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_Student] FOREIGN KEY([Email])
REFERENCES [dbo].[Student] ([Email])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_Student]
GO
ALTER TABLE [dbo].[Signup]  WITH CHECK ADD  CONSTRAINT [FK_Signup_Certificate] FOREIGN KEY([CertificateID])
REFERENCES [dbo].[Certificate] ([CertificateID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Signup] CHECK CONSTRAINT [FK_Signup_Certificate]
GO
ALTER TABLE [dbo].[Signup]  WITH CHECK ADD  CONSTRAINT [FK_Signup_Signup] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Signup] CHECK CONSTRAINT [FK_Signup_Signup]
GO
ALTER TABLE [dbo].[Signup]  WITH CHECK ADD  CONSTRAINT [FK_Signup_Student] FOREIGN KEY([StudentEmail])
REFERENCES [dbo].[Student] ([Email])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Signup] CHECK CONSTRAINT [FK_Signup_Student]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [CK_Certificate] CHECK  (([Grade]<=(10)))
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [CK_Certificate]
GO
ALTER TABLE [dbo].[ContentItem]  WITH CHECK ADD  CONSTRAINT [CK_ContentItem_ContentItemType] CHECK  (([WebcastID] IS NOT NULL AND [ModuleID] IS NULL OR [ModuleID] IS NOT NULL AND [WebcastID] IS NULL))
GO
ALTER TABLE [dbo].[ContentItem] CHECK CONSTRAINT [CK_ContentItem_ContentItemType]
GO
ALTER TABLE [dbo].[ContentItem]  WITH CHECK ADD  CONSTRAINT [CK_ContentItem_Status] CHECK  (([Status]='Concept' OR [Status]='Active' OR [Status]='Archived'))
GO
ALTER TABLE [dbo].[ContentItem] CHECK CONSTRAINT [CK_ContentItem_Status]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [CK_Course_Level] CHECK  (([Level]='beginner' OR [Level]='gevorderd' OR [Level]='expert'))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [CK_Course_Level]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_Gender] CHECK  (([Gender]='M' OR [Gender]='F'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_Gender]
GO
USE [master]
GO
ALTER DATABASE [QuatroOpdracht] SET  READ_WRITE 
GO
