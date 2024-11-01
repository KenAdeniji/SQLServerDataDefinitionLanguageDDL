USE [master]
GO
/****** Object:  Database [URI]    Script Date: 1/24/2023 6:33:48 PM ******/
CREATE DATABASE [URI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'URI_Data', FILENAME = N'E:\SQLServerDataFiles\URI\URIData.MDF' , SIZE = 11968KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [URI_Image_FileGroup] 
( NAME = N'URI_Image', FILENAME = N'E:\SQLServerDataFiles\URI\URIImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [URI_Index_FileGroup] 
( NAME = N'URI_Index', FILENAME = N'E:\SQLServerDataFiles\URI\URIIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [URI_Text_FileGroup] 
( NAME = N'URI_Text', FILENAME = N'E:\SQLServerDataFiles\URI\URIText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [URI_Xml_FileGroup] 
( NAME = N'URI_Xml', FILENAME = N'E:\SQLServerDataFiles\URI\URIXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'URI_Log', FILENAME = N'E:\SQLServerDataFiles\URI\URILog.LDF' , SIZE = 336832KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [URI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [URI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [URI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [URI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [URI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [URI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [URI] SET ARITHABORT OFF 
GO
ALTER DATABASE [URI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [URI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [URI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [URI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [URI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [URI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [URI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [URI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [URI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [URI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [URI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [URI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [URI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [URI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [URI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [URI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [URI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [URI] SET RECOVERY FULL 
GO
ALTER DATABASE [URI] SET  MULTI_USER 
GO
ALTER DATABASE [URI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [URI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [URI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [URI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [URI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [URI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [URI] SET QUERY_STORE = OFF
GO
USE [URI]
GO
/****** Object:  User [LoginNameSecurity]    Script Date: 1/24/2023 6:33:49 PM ******/
CREATE USER [LoginNameSecurity] FOR LOGIN [LoginNameSecurity] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 1/24/2023 6:33:49 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [LoginNameSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LoginNameSecurity]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [LoginNameSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[URIGoogleNews]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIGoogleNews](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](1000) NULL,
	[URI] [varchar](255) NOT NULL,
	[Keyword] [varchar](1000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIGoogleNews] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIPocket]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIPocket](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIPocket] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIBingNews]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIBingNews](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIBingNews] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIEntertainment]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIEntertainment](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIEntertainment] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIChrist]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIChrist](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIChrist] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIWordEngineering]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIWordEngineering](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIWordEngineering] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[MyUri]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MyUri]
AS
SELECT        *
FROM            dbo.URIBingNews
UNION
SELECT        *
FROM            dbo.URIChrist
UNION
SELECT        *
FROM            dbo.URIEntertainment
UNION
SELECT        *
FROM            dbo.URIGoogleNews
UNION
SELECT        *
FROM            dbo.URIPocket
UNION
SELECT        *
FROM            dbo.URIWordEngineering
GO
/****** Object:  Table [dbo].[URIAdvance]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIAdvance](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[URI] [varchar](900) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIAdvance] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIBenediction]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIBenediction](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[URI] [varchar](900) NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIBenediction] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIBook]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIBook](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIBook] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URICartoon]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URICartoon](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](1000) NULL,
	[URI] [varchar](255) NOT NULL,
	[Keyword] [varchar](1000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URICartoon] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIEconomy]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIEconomy](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIEconomy] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UriExampleDriven]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UriExampleDriven](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](1000) NULL,
	[URI] [varchar](255) NOT NULL,
	[Keyword] [varchar](1000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_UriExampleDriven] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIHealth]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIHealth](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](1000) NULL,
	[URI] [varchar](255) NOT NULL,
	[Keyword] [varchar](1000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIHealth] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URILeadBy]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URILeadBy](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URILeadBy] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIMozilla]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIMozilla](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIMozilla] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIPolitics]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIPolitics](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URIRSSFeed]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URIRSSFeed](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](1000) NULL,
	[URI] [varchar](255) NOT NULL,
	[Keyword] [varchar](1000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URIRSSFeed] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URISiteMap]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URISiteMap](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[URI] [varchar](255) NOT NULL,
	[Title] [varchar](255) NULL,
	[Keyword] [varchar](255) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URISiteMap] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URISport]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URISport](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URISport] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URITechnology]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URITechnology](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[URI] [varchar](900) NOT NULL,
	[Keyword] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](max) NULL,
 CONSTRAINT [PK_URITechnology] PRIMARY KEY NONCLUSTERED 
(
	[URI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[URIAdvance] ADD  CONSTRAINT [DF_URIAdvance_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIBenediction] ADD  CONSTRAINT [DF_URIBenediction_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIBingNews] ADD  CONSTRAINT [DF_URIBingNews_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIBook] ADD  CONSTRAINT [DF_URIBook_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URICartoon] ADD  CONSTRAINT [DF_URICartoon_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIChrist] ADD  CONSTRAINT [DF_URIChrist_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIEconomy] ADD  CONSTRAINT [DF_URIEconomy_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIEntertainment] ADD  CONSTRAINT [DF_URIEntertainment_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[UriExampleDriven] ADD  CONSTRAINT [DF_UriExampleDriven_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIGoogleNews] ADD  CONSTRAINT [DF_URIGoogleNews_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIHealth] ADD  CONSTRAINT [DF_URIHealth_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URILeadBy] ADD  CONSTRAINT [DF_URILeadBy_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIMozilla] ADD  CONSTRAINT [DF_URIMozilla_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIPocket] ADD  CONSTRAINT [DF_URIPocket_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIPolitics] ADD  CONSTRAINT [DF_URIPolitics_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIRSSFeed] ADD  CONSTRAINT [DF_URIRSSFeed_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URISiteMap] ADD  CONSTRAINT [DF_URISiteMap_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URISport] ADD  CONSTRAINT [DF_URISport_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URITechnology] ADD  CONSTRAINT [DF_URITechnology_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[URIWordEngineering] ADD  CONSTRAINT [DF_URIWordEngineering_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
/****** Object:  StoredProcedure [dbo].[PopulateJehovah]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateJehovah]
 @jehovah        varchar(8000)      = null,
 @URI            varchar(255)      = null,
 @jehovahId      uniqueidentifier  = null,
 @dated          datetime          = null
AS
BEGIN

 SET NOCOUNT ON
 SET @jehovah = LTRIM(RTRIM(@jehovah))
 SET @uri     = LTRIM(RTRIM(@uri))

 IF NOT Exists (SELECT Jehovah FROM Jehovah WHERE Jehovah = @jehovah)
 BEGIN --Begin Insert
  INSERT Jehovah (Jehovah, URI) VALUES (@jehovah, @URI)
 END --End Insert

END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[Populatestatus]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Populatestatus]
 @URI            varchar(255)      = 'about:blank'   OUTPUT,
 @Dated          datetime          = null            OUTPUT,
 @status      int               = 404             OUTPUT,
 @Guid           uniqueidentifier  = null            OUTPUT
AS
BEGIN

 SET NOCOUNT ON
 SET @URI  = LTRIM(RTRIM(@uri))
 IF @Dated IS NULL SET @Dated = GETDATE()
 IF @Guid IS NULL SET @Guid = NEWID()
 IF NOT Exists (SELECT URI FROM status WHERE URI = @URI and Dated = @Dated)
  INSERT status ( URI, Dated, status, Guid ) VALUES (  @URI, @Dated, @status, @Guid  )
 ELSE
  UPDATE status SET status = @status WHERE URI = @URI and Dated = @Dated
END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[PopulateURIChrist]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateURIChrist]
 @dated           datetime      = null,
 @keyword         varchar(255)  = null,
 @title           varchar(255)  = null,
 @URI             varchar(255)  = null
AS
BEGIN

 SET NOCOUNT ON
 SET @keyword = LTRIM(RTRIM(@keyword))
 SET @title = LTRIM(RTRIM(@title))
 SET @uri = LTRIM(RTRIM(@uri))

 IF @title = NULL or @title = ''
 BEGIN
  DELETE FROM URIChrist WHERE URI = @uri
  RETURN
 END

 IF exists (SELECT URI FROM URIChrist WHERE URI = @URI)
 BEGIN
  UPDATE URIChrist SET title = @title, keyword = @keyword WHERE URI = @uri
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT URIChrist (dated, title, URI, keyword) VALUES (@dated, @title, @URI, @keyword )
 END --End Insert
END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[PopulateURIChristRelease200304070905]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateURIChristRelease200304070905]
 @keyword         varchar(255)  = null,
 @title           varchar(255)  = null,
 @URI             varchar(255)  = null
AS
BEGIN

 SET NOCOUNT ON
 SET @keyword = LTRIM(RTRIM(@keyword))
 SET @title = LTRIM(RTRIM(@title))
 SET @uri = LTRIM(RTRIM(@uri))

 IF @title = NULL or @title = ''
 BEGIN
  DELETE FROM URIChrist WHERE URI = @uri
  RETURN
 END

 IF exists (SELECT URI FROM URIChrist WHERE URI = @URI)
 BEGIN
  UPDATE URIChrist SET title = @title, keyword = @keyword WHERE URI = @uri
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT URIChrist (title, URI, keyword) VALUES (@title, @URI, @keyword )
 END --End Insert
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateURIStatus]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateURIStatus]
 @URI            varchar(255)      = 'about:blank'   OUTPUT,
 @Dated          datetime          = null            OUTPUT,
 @Status         int               = 404             OUTPUT,
 @Guid           uniqueidentifier  = null            OUTPUT
AS
BEGIN

 SET NOCOUNT ON
 SET @URI  = LTRIM(RTRIM(@uri))
 IF @Dated IS NULL SET @Dated = GETDATE()
 IF @Guid IS NULL SET @Guid = NEWID()
 IF NOT Exists (SELECT URI FROM URIStatus WHERE URI = @URI and Dated = @Dated)
  INSERT URIStatus ( URI, Dated, Status, Guid ) VALUES (  @URI, @Dated, @Status, @Guid  )
 ELSE
  UPDATE URIStatus SET Status = @Status WHERE URI = @URI and Dated = @Dated
END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[PopulateURIWordEngineering]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateURIWordEngineering]
 @dated           datetime      = null,
 @keyword         varchar(255)  = null,
 @title           varchar(255)  = null,
 @URI             varchar(255)  = null
AS
BEGIN

 SET NOCOUNT ON
 SET @keyword = LTRIM(RTRIM(@keyword))
 SET @title = LTRIM(RTRIM(@title))
 SET @uri = LTRIM(RTRIM(@uri))

 IF @title = NULL or @title = ''
 BEGIN
  DELETE FROM URIWordEngineering WHERE URI = @uri
  RETURN
 END

 IF exists (SELECT URI FROM URIWordEngineering WHERE URI = @URI)
 BEGIN
  UPDATE URIWordEngineering SET title = @title, keyword = @keyword WHERE URI = @uri
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT URIWordEngineering (dated, title, URI, keyword) VALUES (@dated, @title, @URI, @keyword )
 END --End Insert

END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[PopulateURIWordEngineeringRelease200304070905]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[PopulateURIWordEngineeringRelease200304070905]
 @keyword         varchar(255)  = null,
 @title           varchar(255)  = null,
 @URI             varchar(255)  = null
AS
BEGIN

 SET NOCOUNT ON
 SET @keyword = LTRIM(RTRIM(@keyword))
 SET @title = LTRIM(RTRIM(@title))
 SET @uri = LTRIM(RTRIM(@uri))

 IF @title = NULL or @title = ''
 BEGIN
  DELETE FROM URIWordEngineering WHERE URI = @uri
  RETURN
 END

 IF exists (SELECT URI FROM URIWordEngineering WHERE URI = @URI)
 BEGIN
  UPDATE URIWordEngineering SET title = @title, keyword = @keyword WHERE URI = @uri
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT URIWordEngineering (title, URI, keyword) VALUES (@title, @URI, @keyword )
 END --End Insert
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[usp_IoannisPanagopoulosRestServicesSelect]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IoannisPanagopoulosRestServicesSelect]
	@uri				AS	sysname				=	'msdn.com'
AS
BEGIN
/*
	2015-01-04	blogs.msdn.com/b/raulga/archive/2007/01/04/dynamic-sql-sql-injection.aspx
	2015-05-16	File created.
*/ 
	DECLARE @sqlSelectStatement AS NVARCHAR(4000)
	declare @CRLF nvarchar(10) = char(13) + char(10)

	IF @URI IS NOT NULL
	BEGIN
		SET @URI = '%' + @URI + '%'
	END

	SET @sqlSelectStatement = 'SELECT MIN(Dated) AS DatedFrom, MAX(Dated) AS DatedUntil '
	+ ' FROM MyUri WHERE  1 = 1 '

	+	' and ( (URI like '
	+	' case '
	+   ' when @URI is null then URI  '
	+	' else @URI '
	+	' end  ' 
	+	' ) '
	+   ' ) ';

	--EXEC xp_logevent 60000, @sqlSelectStatement, informational

	--SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy

	declare @parmDefinition nvarchar(4000)

	set @parmDefinition = '@uri nvarchar(max)'

	PRINT @sqlSelectStatement

	EXEC sp_executesql 
			  @sqlSelectStatement
			, @parmDefinition
			, @uri = @uri
END
GO
/****** Object:  StoredProcedure [dbo].[uspBehaviorQuery]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[uspBehaviorQuery]
 @datedFrom           AS varchar(50)    =  null,
 @datedTo             AS varchar(50)    =  null,
 @keyword             AS varChar(50)    =  null,
 @sequenceOrderFrom   AS integer        =  null,
 @sequenceOrderTo     AS integer        =  null,
 @scriptureReference  AS varchar(8000)  =  null,
 @actor               AS varchar(8000)  =  null,
 @commentary          AS varchar(8000)  =  null
AS
BEGIN

 --uspBehaviorQuery @keyword = 'God Title'
 --uspBehaviorQuery @datedFrom = '20020925', @datedTo = '20020927'
 --uspBehaviorQuery @scriptureReference = 'Genesis 22'
 --uspBehaviorQuery @actor = 'God'
 --uspBehaviorQuery @commentary = 'Jesus Christ'

 DECLARE  @sql        AS nvarchar(4000)
 DECLARE  @and        AS varchar(5)
 DECLARE  @from       AS varchar(4000)
 DECLARE  @select     AS varchar(4000)
 DECLARE  @where      AS varchar(8000)
 DECLARE  @orderBy    AS varchar(8000)

 SET      @select     =  'SELECT  ' +
--                       ' Dated, '
                         ' Keyword, SequenceOrder, ScriptureReference, Actor, Commentary '
 SET      @and        =  ' AND '
 SET      @from       =  ' FROM Behavior '
 SET      @where      =  ' WHERE ' + SPACE(5)
 SET      @orderBy    =  ' ORDER BY Keyword, SequenceOrder '

 IF @datedFrom <> null
 BEGIN
  SET @where = @where + ' Dated >= ''' + @datedFrom + '''' + @and
 END

 IF @datedTo <> null
 BEGIN
  SET @where = @where + ' Dated <= ''' + @datedTo + '''' + @and
 END

 IF @keyword <> null
 BEGIN
  SET @where = @where + ' keyword Like ''%' + @keyword + '%''' + @and
 END

 IF @sequenceOrderFrom <> null
 BEGIN
  SET @where = @where + ' sequenceOrder >= ' + @sequenceOrderFrom + @and
 END

 IF @sequenceOrderTo <> null
 BEGIN
  SET @where = @where + ' sequenceOrder <= ' + @sequenceOrderTo + @and
 END

 IF @scriptureReference <> null
 BEGIN
  SET @where = @where + ' scriptureReference Like ''%' + @scriptureReference + '%''' + @and
 END

 IF @actor <> null
 BEGIN
  SET @where = @where + ' actor Like ''%' + @actor + '%''' + @and
 END

 IF @commentary <> null
 BEGIN
  SET @where = @where + ' commentary Like ''%' + @commentary + '%''' + @and
 END

 SET @where = LEFT( @where, LEN(@where) - LEN(@and) )

 SET @sql = @select + @from + @where + @orderBy

 EXECUTE sp_executesql @sql

 PRINT @sql

END

GO
/****** Object:  StoredProcedure [dbo].[uspScriptureRetrievalVerse]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[uspScriptureRetrievalVerse]
  @scriptureReference varChar(4000)
AS
BEGIN  -- Stored Procedure Begin
  /*
  Exec uspScriptureRetrievalVerse @scriptureReference = 'Genesis 1:1-2:13'
  */
  DECLARE  @scriptureReferenceDelimiter                             AS  char
  DECLARE  @scriptureReferenceSubset                                AS  varChar(4000)
  DECLARE  @scriptureReferenceLength                                AS  integer
  DECLARE  @scriptureReferenceDelimiterLocationEnd                  AS  integer
  DECLARE  @scriptureReferenceDelimiterLocationStart                AS  integer

  DECLARE  @scriptureReferenceChapterVerseSeparator                 AS  char
  DECLARE  @scriptureReferenceVerseSeparator                        AS  char

  DECLARE  @scriptureReferenceSubsetLength                          AS  integer
  DECLARE  @scriptureReferenceSubsetPosition                        AS  integer
  DECLARE  @scriptureReferenceSubsetDelimiterPosition               AS  integer

  DECLARE  @soundexDifference                                       AS  integer
  DECLARE  @soundexBookId                                           AS  integer
  DECLARE  @soundexBookTitle                                        AS  varChar(20)

  DECLARE  @scriptureReferenceSubsetBook                            AS  varChar(20)
  DECLARE  @scriptureReferenceSubsetCurrentCharacter                AS  char
  DECLARE  @scriptureReferenceSubsetChapter                         AS  integer
  DECLARE  @scriptureReferenceSubsetChapterFrom                     AS  integer
  DECLARE  @scriptureReferenceSubsetChapterTo                       AS  integer
  DECLARE  @scriptureReferenceSubsetVerseFrom                       AS  integer
  DECLARE  @scriptureReferenceSubsetVerseTo                         AS  integer

  SET @scriptureReference                       = UPPER( @scriptureReference )
  SET @scriptureReferenceLength                 = LEN( @scriptureReference )
  SET @scriptureReferenceDelimiter              = ','
  SET @scriptureReferenceChapterVerseSeparator  = ':'
  SET @scriptureReferenceVerseSeparator         = '-'

  SET @scriptureReferenceDelimiterLocationEnd   = 1
  SET @scriptureReferenceDelimiterLocationStart = 1

  -- While not the last scripture reference.
  WHILE @scriptureReferenceDelimiterLocationEnd > 0
  BEGIN

    -- Determine the end position for this particular
    -- scripture reference subset.
    SET @scriptureReferenceDelimiterLocationEnd = CHARINDEX
      (
        @scriptureReference,
        @scriptureReferenceDelimiter,
        @scriptureReferenceDelimiterLocationStart
      )

    PRINT  @scriptureReferenceDelimiterLocationEnd

    -- If there is no more scripture reference delimiter,
    -- then process this scripture reference as the
    -- last scripture reference.
    IF  @scriptureReferenceDelimiterLocationEnd = 0
    BEGIN
        SET @scriptureReferenceSubset = RIGHT
            (
              @scriptureReference,
              @scriptureReferenceDelimiterLocationEnd -
              @scriptureReferenceDelimiterLocationStart
            )
    END  -- This is the last scripture reference.
    -- If this is not the last scripture reference delimiter,
    -- then retrieve this particular scripture reference
    -- subset within the entire scripture reference set.
    ELSE
    BEGIN
        SET @scriptureReferenceSubset = SUBSTRING
            (
              @scriptureReference,
              @scriptureReferenceDelimiterLocationStart,
              @scriptureReferenceDelimiterLocationEnd -
              @scriptureReferenceDelimiterLocationStart
            )
    END  -- This is not the last scripture reference.

    -- The Scripture Reference Subset Length
    SET @scriptureReferenceSubsetLength = LEN( @scriptureReferenceSubset )

    -- Parse the Scripture Reference Subset.
    -- Retrieve the book, chapter, and verse.
    SET  @scriptureReferenceSubsetBook         = ''
    SET  @scriptureReferenceSubsetPosition     =  1
    SET  @scriptureReferenceSubsetChapter      =  0
    SET  @scriptureReferenceSubsetChapterFrom  =  0
    SET  @scriptureReferenceSubsetChapterTo    =  0

    WHILE @scriptureReferenceSubsetPosition <= @scriptureReferenceSubsetLength
    BEGIN

      SET  @scriptureReferenceSubsetCurrentCharacter = SUBSTRING
           (
             @scriptureReferenceSubset,
             @scriptureReferenceSubsetPosition,
             1
           )

      IF ( @scriptureReferenceSubsetCurrentCharacter < 'A'   OR
           @scriptureReferenceSubsetCurrentCharacter > 'Z' ) AND
           @scriptureReferenceSubsetBook = ''
      BEGIN
        SET @scriptureReferenceSubsetBook = LEFT
           (
             @scriptureReferenceSubset,
             @scriptureReferenceSubsetPosition - 1
           )
        SET @scriptureReferenceSubsetDelimiterPosition =
            @scriptureReferenceSubsetPosition
      END

      IF ( @scriptureReferenceSubsetCurrentCharacter =
           @scriptureReferenceChapterVerseSeparator )
      BEGIN
        SET @scriptureReferenceSubsetChapter = CONVERT( INT, SUBSTRING
            (
              @scriptureReferenceSubset,
              @scriptureReferenceSubsetDelimiterPosition + 1,
              @scriptureReferenceSubsetPosition -
              @scriptureReferenceSubsetDelimiterPosition
            ) )

        IF  @scriptureReferenceSubsetChapterFrom <= 0
        BEGIN
            SET @scriptureReferenceSubsetChapterFrom =
                @scriptureReferenceSubsetChapter
        END
        ELSE
        BEGIN
            SET @scriptureReferenceSubsetChapterTo =
                @scriptureReferenceSubsetChapter
            SET @scriptureReferenceSubsetVerseTo = CONVERT( INT, RIGHT
            (
              @scriptureReferenceSubset,
              @scriptureReferenceSubsetLength -
              @scriptureReferenceSubsetDelimiterPosition - 1
            ) )

        END

        SET @scriptureReferenceSubsetDelimiterPosition =
            @scriptureReferenceSubsetPosition
      END

      -- Verse Delimiter.
      IF ( @scriptureReferenceSubsetCurrentCharacter =
           @scriptureReferenceVerseSeparator )
      BEGIN
        SET @scriptureReferenceSubsetVerseFrom = CONVERT( INT, SUBSTRING
            (
              @scriptureReferenceSubset,
              @scriptureReferenceSubsetDelimiterPosition + 1,
              @scriptureReferenceSubsetPosition -
              @scriptureReferenceSubsetDelimiterPosition
            ) )

        SET @scriptureReferenceSubsetDelimiterPosition =
            @scriptureReferenceSubsetPosition
      END

      SET  @scriptureReferenceSubsetPosition =
           @scriptureReferenceSubsetPosition + 1

      PRINT @scriptureReferenceSubsetPosition

    END  -- Parse the Scripture Reference Subset.

    -- Determine the book id and title for the current scripture reference.
    SELECT TOP 1
      @soundexDifference = DIFFERENCE( bookTitle, @scriptureReferenceSubset ),
      @soundexBookId     = soundexBookId,
      @soundexBookTitle  = bookTitle
    FROM BibleBook ( NoLock )
    ORDER BY DIFFERENCE( bookTitle, @scriptureReferenceSubset ) DESC

    PRINT 'Book Title:   ' + @soundexBookTitle
    PRINT 'Book IF:      ' + CONVERT( VarChar, @soundexBookId )
    PRINT 'Chapter From: ' + CONVERT( VarChar, @scriptureReferenceSubsetChapterFrom )
    PRINT 'Verse   From: ' + CONVERT( VarChar, @scriptureReferenceSubsetVerseFrom )
    PRINT 'Chapter To:   ' + CONVERT( VarChar, @scriptureReferenceSubsetChapterTo )
    PRINT 'Verse   To:   ' + CONVERT( VarChar, @scriptureReferenceSubsetVerseTo )

  END  -- While not the last scripture reference.

END  -- Stored Procedure End.
GO
/****** Object:  StoredProcedure [dbo].[uspURIChristInsert]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[uspURIChristInsert]
 @sequenceOrderId  INT           =  NULL,
 @dated            DATETIME      =  NULL,
 @uri              VARCHAR(255)  =  NULL,
 @title            VARCHAR(255)  =  NULL,
 @keyword          VARCHAR(255)  =  NULL
AS
BEGIN
 IF @dated IS NULL
 BEGIN
  SET @dated = GETDATE()
 END
 IF @sequenceOrderId IS NOT NULL
 BEGIN
  SET IDENTITY_INSERT URIChrist ON
  INSERT URIChrist
  (
   sequenceOrderId,
   dated,
   uri,
   title,
   keyword
  )
  VALUES
  (
   @sequenceOrderId,
   @dated,
   @uri,
   @title,
   @keyword
  )
  SET IDENTITY_INSERT URIChrist OFF
 END
 ELSE
 BEGIN
  INSERT URIChrist
  (
   dated,
   uri,
   title,
   keyword
  )
  VALUES
  (
   @dated,
   @uri,
   @title,
   @keyword
  )
 END
END
GO
/****** Object:  StoredProcedure [dbo].[uspURIChristUpdate]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[uspURIChristUpdate]
 @dated            DATETIME      =  NULL,
 @uri              VARCHAR(255)  =  NULL,
 @title            VARCHAR(255)  =  NULL,
 @keyword          VARCHAR(255)  =  NULL
AS
BEGIN
 UPDATE URIChrist SET
   dated            =  @dated,
   title            =  @title,
   keyword          =  @keyword
 WHERE uri = @uri
END

GO
/****** Object:  StoredProcedure [dbo].[uspURIDelete]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspURIDelete]
 @tableName       AS VARCHAR(50),
 @sequenceOrderId AS VARCHAR(255)   =  NULL
AS
BEGIN
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @sqlDeleteStatement AS NVARCHAR(1000)
 SET @quote              = ''''
 SET @sqlDeleteStatement = 'DELETE ' + @tableName + ' WHERE '
 --EXEC xp_logevent 60000, @sqlDeleteStatement, informational
 IF @sequenceOrderId IS NOT NULL
 BEGIN
  SET @sqlDeleteStatement = @sqlDeleteStatement + ' sequenceOrderId = ' + CONVERT( VARCHAR, @sequenceOrderId )
 END
 ELSE
 BEGIN
  RETURN
 END
 EXEC sp_executesql @sqlDeleteStatement
END

GO
/****** Object:  StoredProcedure [dbo].[uspURIInsert]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspURIInsert]
 @tableName       AS VARCHAR(255),
 @sequenceOrderId AS INTEGER        =  NULL,
 @dated           AS DATETIME       =  NULL,
 @uri             AS NVARCHAR(MAX)  =  NULL,
 @title           AS NVARCHAR(MAX)  =  NULL,
 @commentary      AS NVARCHAR(MAX)  =  NULL,
 @keyword         AS NVARCHAR(MAX)  =  NULL
AS
BEGIN
/*
 http://support.microsoft.com/default.aspx?scid=KB;EN-US;q262499 INF: Using Output Parameters with sp_executesql
 2021-05-21T12:00:00 SET @uri = REPLACE(@uri, @quote, @quote + @quote)
*/
 DECLARE @bracketOpen        AS VARCHAR(1)
 DECLARE @bracketClose       AS VARCHAR(1)
 DECLARE @clauseAnd          AS VARCHAR(7)
 DECLARE @clauseSet          AS VARCHAR(7)
 DECLARE @clauseValues       AS VARCHAR(8)
 DECLARE @clauseWhere        AS VARCHAR(7)
 DECLARE @quote              AS VARCHAR(1)
 DECLARE @ParmDefinition     AS NVARCHAR(500)
 DECLARE @separatorComma     AS VARCHAR(1)
 DECLARE @sqlInsertValues    AS VARCHAR(8000)
 DECLARE @sqlInsertStatement AS NVARCHAR(4000)
 DECLARE @sqlSelectStatement AS NVARCHAR(4000)
 SET @uri                = LTRIM( RTRIM( @uri ) )
 SET @title              = LTRIM( RTRIM( @title ) )
 SET @keyword            = LTRIM( RTRIM( @keyword ) )
 SET @bracketOpen        = '('
 SET @bracketClose       = ')'
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseSet          = SPACE(2) + 'SET' + SPACE(2)
 SET @clauseValues       = SPACE(1) + 'VALUES' + SPACE(1)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @ParmDefinition     = '@sequenceOrderId INTEGER OUTPUT'
 SET @separatorComma     = ','
 IF @uri IS NULL
 BEGIN
  RETURN
 END

  SET @uri = REPLACE(@uri, @quote, @quote + @quote)
 SET @title = REPLACE(@title, @quote, @quote + @quote)
 SET @commentary = REPLACE(@commentary, @quote, @quote + @quote)
 SET @keyword = REPLACE(@keyword, @quote, @quote + @quote)

 SET @sqlSelectStatement = 'SELECT @sequenceOrderId = sequenceOrderId FROM ' + @tableName + ' WHERE uri = ''' + @uri + @quote
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 EXEC sp_executesql @sqlSelectStatement, @ParmDefinition, @sequenceOrderId OUTPUT
 IF @@ROWCOUNT > 0
 BEGIN
  EXEC uspURIUpdate @tableName, @sequenceOrderId, @dated, @uri, @title, @commentary, @keyword
  RETURN
 END
 SET @sqlInsertStatement = 'INSERT ' + @tableName + @bracketOpen
 SET @sqlInsertValues    = @clauseValues + @bracketOpen
 IF @sequenceOrderId IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' sequenceOrderId ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + CONVERT( NVARCHAR, @sequenceOrderId ) + @quote + @separatorComma
 END
 IF @dated IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' dated ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + CONVERT( NVARCHAR, @dated ) + @quote + @separatorComma
 END
 IF @uri IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' uri ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + @uri + @quote + @separatorComma
 END
 IF @title IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' title ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + @title + @quote + @separatorComma
 END
 IF @commentary IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' commentary ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + @commentary + @quote + @separatorComma
 END
 IF @keyword IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = @sqlInsertStatement + ' keyword ' + @separatorComma
  SET @sqlInsertValues    = @sqlInsertValues + @quote + @keyword + @quote + @separatorComma
 END
 SET @sqlInsertStatement = LEFT( @sqlInsertStatement, LEN( @sqlInsertStatement ) - LEN( @separatorComma ) )
 SET @sqlInsertValues = LEFT( @sqlInsertValues, LEN( @sqlInsertValues ) - LEN( @separatorComma ) )
 SET @sqlInsertStatement  = @sqlInsertStatement + @bracketClose + @sqlInsertValues + @bracketClose
 IF @sequenceOrderId IS NOT NULL
 BEGIN
  SET @sqlInsertStatement = 'SET IDENTITY_INSERT ' + @tableName + ' ON;' + @sqlInsertStatement + 'SET IDENTITY_INSERT ' + @tableName + ' OFF;'
 END
 --EXEC xp_logevent 60000, @sqlInsertStatement, informational
 EXEC sp_executesql @sqlInsertStatement
END

GO
/****** Object:  StoredProcedure [dbo].[uspURISelect]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[uspURISelect]
 @tableName           AS VARCHAR(255)    =  'URIWordEngineering',
 @sequenceOrderIdFrom AS BIGINT		     =  NULL,
 @sequenceOrderIdTo   AS BIGINT	         =  NULL,
 @datedFrom           AS DATETIME        =  NULL,
 @datedTo             AS DATETIME        =  NULL,
 @uri                 AS NVARCHAR(MAX)   =  NULL,
 @title               AS NVARCHAR(MAX)   =  NULL,
 @commentary          AS NVARCHAR(MAX)   =  NULL,
 @keyword             AS NVARCHAR(MAX)   =  NULL,
 @clauseOrderBy       AS NVARCHAR(MAX)   =  ' ORDER BY uri '
AS
BEGIN
 --EXEC uspURISelect @sequenceOrderIdFrom = 2141
 DECLARE @clauseAnd          AS NVARCHAR(7)
 DECLARE @clauseWhere        AS NVARCHAR(7)
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @sqlSelectStatement AS NVARCHAR(4000)
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @sqlSelectStatement = 'SELECT * FROM ' + @tableName + @clauseWhere
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 IF @sequenceOrderIdFrom IS NOT NULL AND @sequenceOrderIdFrom > -1
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' sequenceOrderId >= ' + CONVERT( NVARCHAR, @sequenceOrderIdFrom ) + @clauseAnd
 END
 IF @sequenceOrderIdTo IS NOT NULL AND @sequenceOrderIdFrom < 2147483647
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' sequenceOrderId <= ' + CONVERT( NVARCHAR, @sequenceOrderIdTo ) + @clauseAnd
 END
 IF @datedFrom IS NOT NULL AND @datedFrom > "1/1/1753"
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' dated >= ' + @quote + CONVERT( NVARCHAR, @datedFrom ) + @quote + @clauseAnd
 END
 IF @datedTo IS NOT NULL AND @datedTo < "99991231"
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' dated <= ' + @quote + CONVERT( NVARCHAR, @datedTo ) + @quote + @clauseAnd
 END
 IF @title IS NOT NULL AND @title <> '|'
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' title LIKE ''%' + @title + '%''' + @clauseAnd
 END
 IF @uri IS NOT NULL AND @uri <> '|'
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' uri LIKE ''%' + @uri + '%''' + @clauseAnd
 END
 IF @keyword IS NOT NULL AND @keyword <> '|'
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' keyword LIKE ''%' + @keyword + '%''' + @clauseAnd
 END
 IF @commentary IS NOT NULL AND @commentary <> '|'
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' commentary LIKE ''%' + @commentary + '%''' + @clauseAnd
 END
 IF RIGHT( @sqlSelectStatement, 7 ) = @clauseAnd
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseAnd ) )
 END
 ELSE
 BEGIN
   SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseWhere ) )
 END
 SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy
 EXEC sp_executesql @sqlSelectStatement
 --PRINT @sqlSelectStatement
END
GO
/****** Object:  StoredProcedure [dbo].[uspURIUpdate]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspURIUpdate]
 @tableName       AS VARCHAR(50),
 @sequenceOrderId AS INTEGER          =  NULL,
 @dated           AS DATETIME		  =  NULL,
 @uri             AS NVARCHAR(4000)   =  NULL,
 @title           AS NVARCHAR(4000)   =  NULL,
 @commentary      AS NVARCHAR(4000)   =  NULL,
 @keyword         AS NVARCHAR(4000)   =  NULL
AS
BEGIN
 DECLARE @clauseAnd          AS NVARCHAR(7)
 DECLARE @clauseSet          AS NVARCHAR(7)
 DECLARE @clauseWhere        AS NVARCHAR(7)
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @separatorComma     AS NVARCHAR(7)
 DECLARE @sqlUpdateStatement AS NVARCHAR(MAX)
 SET @uri                = LTRIM( RTRIM( @uri ) )
 SET @title              = LTRIM( RTRIM( @title ) )
 SET @commentary         = LTRIM( RTRIM( @commentary ) )
 SET @keyword            = LTRIM( RTRIM( @keyword ) )
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseSet          = SPACE(2) + 'SET' + SPACE(2)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @separatorComma     = SPACE(3) + ',' + SPACE(3)
  SET @uri = REPLACE(@uri, @quote, @quote + @quote)
 SET @title = REPLACE(@title, @quote, @quote + @quote)
 SET @commentary = REPLACE(@commentary, @quote, @quote + @quote)
 SET @keyword = REPLACE(@keyword, @quote, @quote + @quote)
 SET @sqlUpdateStatement = 'UPDATE ' + @tableName + @clauseSet
 --EXEC xp_logevent 60000, @sqlUpdateStatement, informational
 IF @dated IS NOT NULL
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' dated = ''' + CONVERT( NVARCHAR, @dated ) + @quote + @separatorComma
 END
 IF @uri IS NOT NULL
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' uri = ''' + @uri + @quote + @separatorComma
 END
 IF @title IS NOT NULL
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' title = ''' + @title + @quote + @separatorComma
 END
 ELSE
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' title = null' + @separatorComma
 END
 IF @commentary IS NOT NULL
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' commentary = ''' + @commentary + @quote + @separatorComma
 END
 ELSE
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' commentary = null' + @separatorComma
 END
 IF @keyword IS NOT NULL
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' keyword = ''' + @keyword + @quote + @separatorComma
 END
 ELSE
 BEGIN
  SET @sqlUpdateStatement = @sqlUpdateStatement + ' keyword = null' + @separatorComma
 END
 IF RIGHT( @sqlUpdateStatement, 7 ) = @clauseSet
 BEGIN
  SET @sqlUpdateStatement = LEFT( @sqlUpdateStatement, LEN( @sqlUpdateStatement ) - LEN( @clauseSet ) )
 END
 ELSE
 BEGIN
  SET @sqlUpdateStatement = LEFT( @sqlUpdateStatement, LEN( @sqlUpdateStatement ) - LEN( @separatorComma ) )
 END
 SET @sqlUpdateStatement  = @sqlUpdateStatement + @clauseWhere + ' SequenceOrderId = ' + CONVERT( NVARCHAR, @sequenceOrderId )
 EXEC sp_executesql @sqlUpdateStatement
END

GO
/****** Object:  StoredProcedure [dbo].[uspUtilDatabaseRecoverySimple]    Script Date: 1/24/2023 6:33:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[uspUtilDatabaseRecoverySimple] AS

-- uspUtilDatabaseRecoverySimple.sql



/*

<recovery_options>

Controls database recovery options.

RECOVERY FULL | BULK_LOGGED | SIMPLE

If FULL is specified, complete protection against media failure is provided. If a data file is damaged, media recovery can restore all committed transactions.

If BULK_LOGGED is specified, protection against media failure is combined with the best performance and least amount of log memory usage for certain large scale or bulk operations. These operations include SELECT INTO, bulk load operations (bcp and BULK I
NSERT), CREATE INDEX, and text and image operations (WRITETEXT and UPDATETEXT).

Under the bulk-logged recovery model, logging for the entire class is minimal and cannot be controlled on an operation-by-operation basis.

If SIMPLE is specified, a simple backup strategy that uses minimal log space is provided. Log space can be automatically reused when no longer needed for server failure recovery.

Important  The simple recovery model is easier to manage than the other two models but at the expense of higher data loss exposure if a data file is damaged. All changes since the most recent database or differential database backup are lost and must be r
e-entered manually.

The default recovery model is determined by the recovery model of the model database. To change the default for new databases, use ALTER DATABASE to set the recovery option of the model database.

*/



Alter Database Master                  Set Recovery Simple

Alter Database Model                   Set Recovery Simple

Alter Database Comforter              Set Recovery Simple

Alter Database URI                       Set Recovery Simple

Alter Database WordEngineering  Set Recovery Simple

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MyUri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MyUri'
GO
USE [master]
GO
ALTER DATABASE [URI] SET  READ_WRITE 
GO
