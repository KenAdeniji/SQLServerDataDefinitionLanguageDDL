USE [master]
GO
/****** Object:  Database [InternetDictionaryProjectIDP]    Script Date: 2/1/2023 2:43:47 PM ******/
CREATE DATABASE [InternetDictionaryProjectIDP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternetDictionaryProjectIDPData', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPData.MDF' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [InternetDictionaryProjectIDPImage] 
( NAME = N'InternetDictionaryProjectIDPImage', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [InternetDictionaryProjectIDPIndex] 
( NAME = N'InternetDictionaryProjectIDPIndex', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPIndex.NDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [InternetDictionaryProjectIDPText] 
( NAME = N'InternetDictionaryProjectIDPText', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [InternetDictionaryProjectIDPXML] 
( NAME = N'InternetDictionaryProjectIDPXml', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'InternetDictionaryProjectIDPLog', FILENAME = N'E:\SQLServerDataFiles\InternetDictionaryProjectIDP\InternetDictionaryProjectIDPLog.LDF' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternetDictionaryProjectIDP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ARITHABORT OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET  MULTI_USER 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET QUERY_STORE = OFF
GO
USE [InternetDictionaryProjectIDP]
GO
/****** Object:  Table [dbo].[FrenchDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrenchDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[FrenchCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GermanDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GermanDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[GermanCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternetDictionaryProject]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternetDictionaryProject](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[EnglishWord] [varchar](512) NOT NULL,
	[FrenchCommentary] [nvarchar](max) NULL,
	[GermanCommentary] [varchar](max) NULL,
	[ItalianCommentary] [varchar](max) NULL,
	[LatinCommentary] [varchar](max) NULL,
	[PortugueseCommentary] [varchar](max) NULL,
	[SpanishCommentary] [varchar](max) NULL,
 CONSTRAINT [PK_InternetDictionaryProject] PRIMARY KEY NONCLUSTERED 
(
	[EnglishWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItalianDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItalianDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[ItalianCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LatinDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatinDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[LatinCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortugueseDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortugueseDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[PortugueseCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpanishDictionary]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpanishDictionary](
	[EnglishWord] [varchar](512) NOT NULL,
	[SpanishCommentary] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternetDictionaryProject] ADD  CONSTRAINT [DF_InternetDictionaryProject_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
/****** Object:  StoredProcedure [dbo].[usp_insertEnglishWord]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_insertEnglishWord] 
as
--2018-02-27 Created
SET NOCOUNT ON
GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateInternetDictionaryProject]    Script Date: 2/1/2023 2:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PopulateInternetDictionaryProject]
AS
--2018-02-26 Created.
CREATE TABLE [dbo].[InternetDictionaryProject](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL CONSTRAINT [DF_InternetDictionaryProject_Dated]  DEFAULT (getdate()),
	[EnglishWord] [varchar](512) NOT NULL,
	[FrenchCommentary] [nvarchar](max) NULL,
	[GermanCommentary] [varchar](max) NULL,
	[ItalianCommentary] [varchar](max) NULL,
	[LatinCommentary] [varchar](max) NULL,
	[PortugueseCommentary] [varchar](max) NULL,
	[SpanishCommentary] [varchar](max) NULL,
 CONSTRAINT [PK_InternetDictionaryProject] PRIMARY KEY NONCLUSTERED 
(
	[EnglishWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--TRUNCATE TABLE InternetDictionaryProject


CREATE TABLE [dbo].[FrenchDictionary]
(
	[EnglishWord] [varchar](512) NOT NULL,
	[FrenchCommentary] [nvarchar](max) NULL
)




	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT FrenchDictionary.EnglishWord
	FROM FrenchDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON FrenchDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.FrenchCommentary = FrenchDictionary.FrenchCommentary
FROM InternetDictionaryProject JOIN FrenchDictionary
ON InternetDictionaryProject.EnglishWord = FrenchDictionary.EnglishWord



CREATE TABLE [dbo].[GermanDictionary]
(
	[EnglishWord] [varchar](512) NOT NULL,
	[GermanCommentary] [nvarchar](max) NULL
)




	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT GermanDictionary.EnglishWord
	FROM GermanDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON GermanDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.GermanCommentary = GermanDictionary.GermanCommentary
FROM InternetDictionaryProject JOIN GermanDictionary
ON InternetDictionaryProject.EnglishWord = GermanDictionary.EnglishWord



	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT ItalianDictionary.EnglishWord
	FROM ItalianDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON ItalianDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.ItalianCommentary = ItalianDictionary.ItalianCommentary
FROM InternetDictionaryProject JOIN ItalianDictionary
ON InternetDictionaryProject.EnglishWord = ItalianDictionary.EnglishWord



	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT LatinDictionary.EnglishWord
	FROM LatinDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON LatinDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.LatinCommentary = LatinDictionary.LatinCommentary
FROM InternetDictionaryProject JOIN LatinDictionary
ON InternetDictionaryProject.EnglishWord = LatinDictionary.EnglishWord



	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT PortugueseDictionary.EnglishWord
	FROM PortugueseDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON PortugueseDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.PortugueseCommentary = PortugueseDictionary.PortugueseCommentary
FROM InternetDictionaryProject JOIN PortugueseDictionary
ON InternetDictionaryProject.EnglishWord = PortugueseDictionary.EnglishWord



	INSERT INTO InternetDictionaryProject
	(
		EnglishWord
	)
	SELECT DISTINCT SpanishDictionary.EnglishWord
	FROM SpanishDictionary
	LEFT OUTER JOIN InternetDictionaryProject
	ON SpanishDictionary.EnglishWord = InternetDictionaryProject.EnglishWord
	WHERE InternetDictionaryProject.EnglishWord IS NULL



UPDATE InternetDictionaryProject
SET InternetDictionaryProject.SpanishCommentary = SpanishDictionary.SpanishCommentary
FROM InternetDictionaryProject JOIN SpanishDictionary
ON InternetDictionaryProject.EnglishWord = SpanishDictionary.EnglishWord

GO
USE [master]
GO
ALTER DATABASE [InternetDictionaryProjectIDP] SET  READ_WRITE 
GO
