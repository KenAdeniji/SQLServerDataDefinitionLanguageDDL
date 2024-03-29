USE [master]
GO
/****** Object:  Database [RobertRouseVizBible]    Script Date: 2/2/2024 8:36:15 AM ******/
CREATE DATABASE [RobertRouseVizBible]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RobertRouseVizBible_Data', FILENAME = N'E:\SQLServerDataFiles\RobertRouseVizBible\RobertRouseVizBibleData.MDF' , SIZE = 8896KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'RobertRouseVizBible_Log', FILENAME = N'E:\SQLServerDataFiles\RobertRouseVizBible\RobertRouseVizBibleLog.LDF' , SIZE = 19840KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RobertRouseVizBible] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobertRouseVizBible].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RobertRouseVizBible] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET ARITHABORT OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RobertRouseVizBible] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RobertRouseVizBible] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RobertRouseVizBible] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RobertRouseVizBible] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET RECOVERY FULL 
GO
ALTER DATABASE [RobertRouseVizBible] SET  MULTI_USER 
GO
ALTER DATABASE [RobertRouseVizBible] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RobertRouseVizBible] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RobertRouseVizBible] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RobertRouseVizBible] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RobertRouseVizBible] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RobertRouseVizBible] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RobertRouseVizBible] SET QUERY_STORE = ON
GO
ALTER DATABASE [RobertRouseVizBible] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RobertRouseVizBible]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/2/2024 8:36:15 AM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[osisName] [nvarchar](50) NOT NULL,
	[bookOrder] [nvarchar](50) NOT NULL,
	[bookName] [nvarchar](50) NOT NULL,
	[bookDiv] [nvarchar](50) NOT NULL,
	[testament] [nvarchar](50) NOT NULL,
	[shortName] [nvarchar](50) NOT NULL,
	[slug] [nvarchar](50) NOT NULL,
	[yearWritten] [nvarchar](50) NULL,
	[placeWritten] [nvarchar](50) NULL,
	[chapters] [nvarchar](950) NOT NULL,
	[chapterCount] [nvarchar](50) NOT NULL,
	[verseCount] [int] NOT NULL,
	[writers] [nvarchar](100) NOT NULL,
	[peopleCount] [int] NOT NULL,
	[placeCount] [nvarchar](50) NOT NULL,
	[modified] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[title] [varchar](max) NOT NULL,
	[ID] [smallint] NOT NULL,
	[startDate] [smallint] NULL,
	[duration] [varchar](max) NOT NULL,
	[rangeFlag] [varchar](max) NULL,
	[predecessor] [varchar](max) NULL,
	[lag] [varchar](max) NULL,
	[Lag_Type] [varchar](max) NULL,
	[partOf] [varchar](max) NULL,
	[verses] [varchar](max) NOT NULL,
	[people_from_verses] [varchar](max) NULL,
	[participants] [varchar](max) NULL,
	[places_from_verses] [varchar](max) NULL,
	[locations] [varchar](max) NULL,
	[groups] [varchar](max) NULL,
	[notes] [varchar](max) NULL,
	[verseSort] [int] NOT NULL,
	[modified] [datetime2](7) NOT NULL,
	[Sort_Key] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[personLookup] [varchar](max) NOT NULL,
	[status] [varchar](max) NOT NULL,
	[personID] [int] NOT NULL,
	[displayTitle] [varchar](max) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[surname] [varchar](max) NULL,
	[alsoCalled] [varchar](max) NULL,
	[isProperName] [varchar](max) NULL,
	[ambiguous] [varchar](max) NULL,
	[Disambiguation_temp] [varchar](max) NULL,
	[gender] [varchar](max) NULL,
	[occupations] [varchar](max) NULL,
	[birthYear] [int] NULL,
	[minYear] [int] NULL,
	[deathYear] [int] NULL,
	[maxYear] [int] NULL,
	[birthPlace] [varchar](max) NULL,
	[deathPlace] [varchar](max) NULL,
	[memberOf] [varchar](max) NULL,
	[eastons] [varchar](max) NULL,
	[dictText] [varchar](max) NULL,
	[events] [varchar](max) NULL,
	[eventGroups] [varchar](max) NULL,
	[verseCount] [int] NULL,
	[verses] [varchar](max) NULL,
	[mother] [varchar](max) NULL,
	[father] [varchar](max) NULL,
	[partners] [varchar](max) NULL,
	[children] [varchar](max) NULL,
	[siblings] [varchar](max) NULL,
	[halfSiblingsSameMother] [varchar](max) NULL,
	[halfSiblingsSameFather] [varchar](max) NULL,
	[chaptersWritten] [varchar](max) NULL,
	[alphaGroup] [varchar](max) NULL,
	[slug] [varchar](max) NOT NULL,
	[modified] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeopleGroups]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleGroups](
	[groupName] [nvarchar](50) NOT NULL,
	[members] [nvarchar](3300) NULL,
	[partOf] [nvarchar](50) NULL,
	[verses] [nvarchar](150) NULL,
	[events] [nvarchar](250) NULL,
	[modified] [datetime2](7) NULL,
	[events_dev] [nvarchar](550) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periods](
	[yearNum] [int] NOT NULL,
	[formattedYear] [nvarchar](50) NOT NULL,
	[era] [nvarchar](1) NULL,
	[isoYear] [int] NOT NULL,
	[BC_AD] [nvarchar](50) NOT NULL,
	[peopleBorn] [nvarchar](50) NULL,
	[peopleDied] [nvarchar](100) NULL,
	[events] [nvarchar](550) NULL,
	[booksWritten] [nvarchar](50) NULL,
	[modified] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 2/2/2024 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[placeLookup] [varchar](max) NULL,
	[status] [varchar](max) NULL,
	[displayTitle] [varchar](max) NULL,
	[ambiguous] [varchar](max) NULL,
	[duplicate_of] [varchar](max) NULL,
	[placeID] [int] NULL,
	[kjvName] [varchar](max) NULL,
	[esvName] [varchar](max) NULL,
	[recogitoComments] [varchar](max) NULL,
	[featureType] [varchar](max) NULL,
	[featureSubType] [varchar](max) NULL,
	[openBibleLat] [real] NULL,
	[openBibleLong] [real] NULL,
	[rootID] [varchar](max) NULL,
	[precision] [varchar](max) NULL,
	[aliases] [varchar](max) NULL,
	[comment] [varchar](max) NULL,
	[verses] [varchar](max) NULL,
	[verseCount] [int] NOT NULL,
	[eastons] [varchar](max) NULL,
	[dictText] [varchar](max) NULL,
	[recogitoUri] [varchar](max) NULL,
	[recogitoLat] [real] NULL,
	[recogitoLon] [real] NULL,
	[peopleBorn] [varchar](max) NULL,
	[peopleDied] [varchar](max) NULL,
	[recogitoStatus] [varchar](max) NULL,
	[recogitoType] [varchar](max) NULL,
	[recogitoLabel] [varchar](max) NULL,
	[recogitoUID] [varchar](max) NULL,
	[booksWritten] [varchar](max) NULL,
	[eventsHere] [varchar](max) NULL,
	[eventGroups] [varchar](max) NULL,
	[hasBeenHere] [varchar](max) NULL,
	[latitude] [real] NULL,
	[longitude] [real] NULL,
	[alphaGroup] [varchar](max) NULL,
	[slug] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2024-01-01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Books'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2024-02-02T04:41:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Events'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2024-02-02T04:23:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeopleGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2024-02-02T04:21:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Periods'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2024-02-02T04:59:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Places'
GO
USE [master]
GO
ALTER DATABASE [RobertRouseVizBible] SET  READ_WRITE 
GO
