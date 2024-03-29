USE [master]
GO
/****** Object:  Database [ComparingYourWordAsYourDeed]    Script Date: 11/20/2021 8:39:33 AM ******/
CREATE DATABASE [ComparingYourWordAsYourDeed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComparingYourWordAsYourDeed_Data', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedData.MDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ComparingYourWordAsYourDeed_Index_FileGroup] 
( NAME = N'ComparingYourWordAsYourDeed_Index', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedIndex.NDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'ComparingYourWordAsYourDeed_Log', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedLog.LDF' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComparingYourWordAsYourDeed].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET RECOVERY FULL 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  MULTI_USER 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET QUERY_STORE = OFF
GO
USE [ComparingYourWordAsYourDeed]
GO
/****** Object:  User [LoginNameSecurity]    Script Date: 11/20/2021 8:39:34 AM ******/
CREATE USER [LoginNameSecurity] FOR LOGIN [LoginNameSecurity] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 11/20/2021 8:39:34 AM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[WhoWhatWhenWhereWhy]    Script Date: 11/20/2021 8:39:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WhoWhatWhenWhereWhy](
	[WhoWhatWhenWhereWhyID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[Commentary] [varchar](max) NULL,
	[Who] [varchar](max) NULL,
	[What] [varchar](max) NULL,
	[When] [varchar](max) NULL,
	[Where] [varchar](max) NULL,
	[Why] [varchar](max) NULL,
	[URI] [nvarchar](max) NULL,
	[ContactID] [int] NULL,
	[HisWordID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[WhoWhatWhenWhereWhy_View]    Script Date: 11/20/2021 8:39:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WhoWhatWhenWhereWhy_View] AS
-- 2021-11-20T07:16:00 https://stackoverflow.com/questions/28153610/using-sql-is-not-null-in-a-select-statement
SELECT
	WhoWhatWhenWhereWhyID,
	Dated,
	ScriptureReference,
	Commentary,
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Who] + CHAR(13)+CHAR(10), '' ) + 
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[What] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[When] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Where] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Why] + CHAR(13)+CHAR(10), '' )
	AS Combined,
	URI,
	ContactID,
	HisWordID
FROM WhoWhatWhenWhereWhy


GO
SET IDENTITY_INSERT [dbo].[WhoWhatWhenWhereWhy] ON 

INSERT [dbo].[WhoWhatWhenWhereWhy] ([WhoWhatWhenWhereWhyID], [Dated], [ScriptureReference], [Commentary], [Who], [What], [When], [Where], [Why], [URI], [ContactID], [HisWordID]) VALUES (1, CAST(N'2021-11-15T13:19:40.937' AS DateTime), N'Daniel 1:5', N'Diet', NULL, N'King''s meat and wine', N'3 years', NULL, NULL, NULL, 11365, 144344)
SET IDENTITY_INSERT [dbo].[WhoWhatWhenWhereWhy] OFF
GO
/****** Object:  Index [PK_RealizeDone]    Script Date: 11/20/2021 8:39:44 AM ******/
ALTER TABLE [dbo].[WhoWhatWhenWhereWhy] ADD  CONSTRAINT [PK_RealizeDone] PRIMARY KEY NONCLUSTERED 
(
	[WhoWhatWhenWhereWhyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WhoWhatWhenWhereWhy] ADD  CONSTRAINT [DF_RealizeDoneSimplyIHaveProvidedSufficientNeedForReUsingYouILetTheLightOpenToAdmireMine_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'The RealizeDoneID column is an identity column, maintained by SQL Server, which automatically generates a sequential next identity. The goodness of this technique is that it is a candidate primary key, data loss is trackable, and it provides a sort key. The RealizeDoneID column may serve as the primary and/or foreign key, the backbone of the Referential Integrity Constraint. It is debatable, the need for this identity column, when there is a dated column, which does similar work, and offers almost identical benefit; we discuss the dated column, next. One benefit of the identity column, is that it is unique, and it offers performance gain when querying based on where condition, and sorting.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WhoWhatWhenWhereWhy', @level2type=N'COLUMN',@level2name=N'WhoWhatWhenWhereWhyID'
GO
EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'The Dated column, as the name implies, is of the DateTime type. If an insert statement does not explicitly specify a value for the dated column, then it defaults to the current date and time of the (UTC-08:00) Pacific Time (US & Canada) time zone. There is a preference for the Coordinated Universal Time (UTC) format. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WhoWhatWhenWhereWhy', @level2type=N'COLUMN',@level2name=N'Dated'
GO
EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'As the name of the table denotes, the RealizeDone table, is what the author heard from the source. The entries in the RealizeDone table is exact, and representable in alphanumeric format (Numbers 12:6-8). In following, the Bible''s New Testament convention, where there is translation of Hebrew words to English, which is being interpreted, (Matthew 1:23, Mark 5:41, Mark 15:22, Mark 15:34, John 1:38, John 1:41, Acts 4:36); so also, there is translation of Yoruba words to English.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WhoWhatWhenWhereWhy'
GO
USE [master]
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  READ_WRITE 
GO
