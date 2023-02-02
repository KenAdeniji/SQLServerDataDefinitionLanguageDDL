CREATE DATABASE [Gutenberg] ON  PRIMARY 
( NAME = N'GutenbergData', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergData.MDF' , SIZE = 57728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [GutenbergImage] 
( NAME = N'GutenbergImage', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [GutenbergIndex] 
( NAME = N'GutenbergIndex', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [GutenbergText] 
( NAME = N'GutenbergText', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [GutenbergXML] 
( NAME = N'GutenbergXML', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'GutenbergLog', FILENAME = N'D:\SQLServerDataFiles\Gutenberg\GutenbergLog.LDF' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
EXEC dbo.sp_dbcmptlevel @dbname=N'Gutenberg', @new_cmptlevel=80
EXEC [Gutenberg].[dbo].[sp_fulltext_database] @action = 'disable'
ALTER DATABASE [Gutenberg] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [Gutenberg] SET ANSI_NULLS OFF 
ALTER DATABASE [Gutenberg] SET ANSI_PADDING OFF 
ALTER DATABASE [Gutenberg] SET ANSI_WARNINGS OFF 
ALTER DATABASE [Gutenberg] SET ARITHABORT OFF 
ALTER DATABASE [Gutenberg] SET AUTO_CLOSE ON 
ALTER DATABASE [Gutenberg] SET AUTO_CREATE_STATISTICS ON 
ALTER DATABASE [Gutenberg] SET AUTO_SHRINK OFF 
ALTER DATABASE [Gutenberg] SET AUTO_UPDATE_STATISTICS ON 
ALTER DATABASE [Gutenberg] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [Gutenberg] SET CURSOR_DEFAULT  GLOBAL 
ALTER DATABASE [Gutenberg] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [Gutenberg] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [Gutenberg] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [Gutenberg] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [Gutenberg] SET  DISABLE_BROKER 
ALTER DATABASE [Gutenberg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ALTER DATABASE [Gutenberg] SET DATE_CORRELATION_OPTIMIZATION OFF 
ALTER DATABASE [Gutenberg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
ALTER DATABASE [Gutenberg] SET  READ_WRITE 
ALTER DATABASE [Gutenberg] SET RECOVERY SIMPLE 
ALTER DATABASE [Gutenberg] SET  MULTI_USER 
ALTER DATABASE [Gutenberg] SET PAGE_VERIFY TORN_PAGE_DETECTION  
ALTER DATABASE [Gutenberg] SET DB_CHAINING OFF 

/****** Object:  Table [dbo].[KoreanEnglish]    Script Date: 08/24/2005 08:42:22 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[KoreanEnglish](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Korean] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[English] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

/****** Object:  Table [dbo].[RogetThesaurusOfEnglishWordsAndPhrases]    Script Date: 08/24/2005 08:42:26 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RogetThesaurusOfEnglishWordsAndPhrases](
	[DictionaryId] [int] IDENTITY(1,1) NOT NULL,
	[DictionaryWord] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_RogetThesaurusOfEnglishWordsAndPhrases] PRIMARY KEY CLUSTERED 
(
	[DictionaryWord] ASC
) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

/****** Object:  Table [dbo].[RogetThesaurusOfEnglishWordsAndPhrasesReference]    Script Date: 08/24/2005 08:42:30 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RogetThesaurusOfEnglishWordsAndPhrasesReference](
	[DictionaryId] [int] NOT NULL,
	[ThesaurusId] [int] NOT NULL,
	[ReferenceId] [int] NOT NULL
) ON [PRIMARY]

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

/****** Object:  Table [dbo].[WebsterUnabridgedDictionary]    Script Date: 08/24/2005 08:42:32 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[WebsterUnabridgedDictionary](
	[DictionaryId] [int] IDENTITY(1,1) NOT NULL,
	[DictionaryWord] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Commentary] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_WebsterUnabridgedDictionary] PRIMARY KEY CLUSTERED 
(
	[DictionaryId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

