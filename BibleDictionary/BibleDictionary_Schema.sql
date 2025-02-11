USE [master]
GO
/****** Object:  Database [BibleDictionary]    Script Date: 2/1/2023 2:23:56 PM ******/
CREATE DATABASE [BibleDictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BibleDictionaryData', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryData.MDF' , SIZE = 24960KB , MAXSIZE = 51200KB , FILEGROWTH = 5%), 
 FILEGROUP [FileGroupImage] 
( NAME = N'BibleDictionaryImage', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryImage.NDF' , SIZE = 1024KB , MAXSIZE = 51200KB , FILEGROWTH = 5%), 
 FILEGROUP [FileGroupIndex] 
( NAME = N'BibleDictionaryIndex', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryIndex.NDF' , SIZE = 1216KB , MAXSIZE = 51200KB , FILEGROWTH = 5%), 
 FILEGROUP [FileGroupText] 
( NAME = N'BibleDictionaryText', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryText.NDF' , SIZE = 11712KB , MAXSIZE = 51200KB , FILEGROWTH = 5%), 
 FILEGROUP [FileGroupXml] 
( NAME = N'BibleDictionaryXml', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryXml.NDF' , SIZE = 1024KB , MAXSIZE = 51200KB , FILEGROWTH = 5%)
 LOG ON 
( NAME = N'BibleDictionaryLog', FILENAME = N'E:\SQLServerDataFiles\BibleDictionary\BibleDictionaryLog.LDF' , SIZE = 17600KB , MAXSIZE = 51200KB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BibleDictionary] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BibleDictionary].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [BibleDictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BibleDictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BibleDictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BibleDictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BibleDictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [BibleDictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BibleDictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BibleDictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BibleDictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BibleDictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BibleDictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BibleDictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BibleDictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BibleDictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BibleDictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BibleDictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BibleDictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BibleDictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BibleDictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BibleDictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BibleDictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BibleDictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BibleDictionary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BibleDictionary] SET  MULTI_USER 
GO
ALTER DATABASE [BibleDictionary] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [BibleDictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BibleDictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BibleDictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BibleDictionary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BibleDictionary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BibleDictionary] SET QUERY_STORE = OFF
GO
USE [BibleDictionary]
GO
/****** Object:  User [WordEngineering]    Script Date: 2/1/2023 2:23:57 PM ******/
CREATE USER [WordEngineering] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[WordEngineering]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/1/2023 2:23:57 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Schema [WordEngineering]    Script Date: 2/1/2023 2:23:57 PM ******/
CREATE SCHEMA [WordEngineering]
GO
/****** Object:  Table [dbo].[BibleDatabaseMatthewHenryCommentary]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDatabaseMatthewHenryCommentary](
	[DictionaryId] [int] NOT NULL,
	[BibleBookId] [int] NOT NULL,
	[BibleChapterId] [int] NOT NULL,
	[BibleVerseId] [int] NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [IX_BibleDatabaseMatthewHenryCommentary] UNIQUE NONCLUSTERED 
(
	[DictionaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BibleDatabasePeoplesNewTestament]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDatabasePeoplesNewTestament](
	[DictionaryId] [smallint] NOT NULL,
	[BibleBookId] [smallint] NOT NULL,
	[BibleChapterId] [smallint] NOT NULL,
	[BibleVerseId] [smallint] NOT NULL,
	[commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleDatabasePeoplesNewTestament] PRIMARY KEY CLUSTERED 
(
	[BibleBookId] ASC,
	[BibleChapterId] ASC,
	[BibleVerseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BibleDatabasePeoplesNewTestament] UNIQUE NONCLUSTERED 
(
	[DictionaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BibleDatabaseJohnWesleyBibleNotes]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDatabaseJohnWesleyBibleNotes](
	[DictionaryId] [int] NOT NULL,
	[BibleBookId] [int] NOT NULL,
	[BibleChapterId] [int] NOT NULL,
	[BibleVerseId] [int] NOT NULL,
	[Commentary] [varchar](max) NOT NULL,
 CONSTRAINT [IX_BibleDatabaseJohnWesleyBibleNotes] UNIQUE NONCLUSTERED 
(
	[DictionaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[BibleCommentary_View]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BibleCommentary_View] AS
--2015-11-07 Create BibleCommentary_View
SELECT
	BibleDatabaseJohnWesleyBibleNotes.BibleBookID	AS	BibleBookID,
	BibleDatabaseJohnWesleyBibleNotes.BibleChapterID	AS	BibleChapterID,
	BibleDatabaseJohnWesleyBibleNotes.BibleVerseID	AS	BibleVerseID,
	BibleDatabaseJohnWesleyBibleNotes.Commentary	AS	JohnWesleyBibleNotesCommentary,
	BibleDatabaseMatthewHenryCommentary.Commentary	AS	MatthewHenryCommentary,
	BibleDatabasePeoplesNewTestament.Commentary		AS	PeoplesNewTestamentCommentary
FROM
	BibleDictionary..BibleDatabaseJohnWesleyBibleNotes
FULL OUTER JOIN
	BibleDictionary..BibleDatabaseMatthewHenryCommentary
ON
	BibleDatabaseJohnWesleyBibleNotes.BibleBookID = BibleDatabaseMatthewHenryCommentary.BibleBookID
AND
	BibleDatabaseJohnWesleyBibleNotes.BibleChapterID = BibleDatabaseMatthewHenryCommentary.BibleChapterID
AND
	BibleDatabaseJohnWesleyBibleNotes.BibleVerseID = BibleDatabaseMatthewHenryCommentary.BibleVerseID
FULL OUTER JOIN
	BibleDictionary..BibleDatabasePeoplesNewTestament	
ON
	BibleDatabaseJohnWesleyBibleNotes.BibleBookID = BibleDatabasePeoplesNewTestament.BibleBookID
AND
	BibleDatabaseJohnWesleyBibleNotes.BibleChapterID = BibleDatabasePeoplesNewTestament.BibleChapterID
AND
	BibleDatabaseJohnWesleyBibleNotes.BibleVerseID = BibleDatabasePeoplesNewTestament.BibleVerseID
GO
/****** Object:  Table [dbo].[BibleFoundationRATorreyTheNewTopicalTextbook]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleFoundationRATorreyTheNewTopicalTextbook](
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](50) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleFoundationRATorreyTheNewTopicalTextbook] PRIMARY KEY NONCLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]
GO
/****** Object:  Table [dbo].[BibleFoundationNaveTopicalBible]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleFoundationNaveTopicalBible](
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](50) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleFoundationNaveTopicalBible] PRIMARY KEY NONCLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]
GO
/****** Object:  Table [dbo].[BibleDatabaseEaston]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDatabaseEaston](
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](50) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleDatabaseEastons] PRIMARY KEY CLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BibleDatabaseEastons] UNIQUE NONCLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BibleDatabaseHitchcockBiblicalName]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDatabaseHitchcockBiblicalName](
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](50) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleDatabaseBiblicalName] PRIMARY KEY CLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BibleDatabaseBiblicalName] UNIQUE NONCLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[BibleDictionary_View]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BibleDictionary_View]
AS
SELECT      dbo.BibleDatabaseEaston.DictionaryWord AS BibleDictionaryWord,
            dbo.BibleDatabaseEaston.Commentary AS BibleDatabaseEastonCommentary, 
			dbo.BibleDatabaseHitchcockBiblicalName.Commentary AS BibleDatabaseHitchcockBiblicalNameCommentary, 
            dbo.BibleFoundationNaveTopicalBible.Commentary AS BibleFoundationNaveTopicalBibleCommentary, 
            dbo.BibleFoundationRATorreyTheNewTopicalTextbook.Commentary AS BibleFoundationRATorreyTheNewTopicalTextBookCommentary
FROM        dbo.BibleDatabaseEaston WITH (NOLOCK)
            FULL OUTER JOIN dbo.BibleDatabaseHitchcockBiblicalName WITH (NOLOCK) ON dbo.BibleDatabaseEaston.DictionaryWord = dbo.BibleDatabaseHitchcockBiblicalName.DictionaryWord 
			FULL OUTER JOIN dbo.BibleFoundationNaveTopicalBible WITH (NOLOCK) ON 
            dbo.BibleDatabaseEaston.DictionaryWord = dbo.BibleFoundationNaveTopicalBible.DictionaryWord 
			FULL OUTER JOIN
            dbo.BibleFoundationRATorreyTheNewTopicalTextbook WITH (NOLOCK) ON 
            dbo.BibleFoundationNaveTopicalBible.DictionaryWord = dbo.BibleFoundationRATorreyTheNewTopicalTextbook.DictionaryWord
GO
/****** Object:  Table [dbo].[BibleDictionary]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleDictionary](
	[BibleWord] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PopulateDictionaryWord] PRIMARY KEY NONCLUSTERED 
(
	[BibleWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BibleFoundationEaston]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleFoundationEaston](
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](50) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleFoundationEastons] PRIMARY KEY CLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BibleFoundationEaston_DictionaryWord] UNIQUE NONCLUSTERED 
(
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FileGroupIndex]
) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]
GO
/****** Object:  Table [dbo].[BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWords]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWords](
	[LanguageGreekHebrew] [char](1) NOT NULL,
	[DictionaryId] [int] NOT NULL,
	[DictionaryWord] [varchar](255) NOT NULL,
	[Pronounce] [varchar](255) NOT NULL,
	[Commentary] [text] NOT NULL,
 CONSTRAINT [PK_BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords] PRIMARY KEY CLUSTERED 
(
	[LanguageGreekHebrew] ASC,
	[DictionaryWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]
GO
/****** Object:  Table [dbo].[WordEngineeringKeyword]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordEngineeringKeyword](
	[Keyword] [varchar](50) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](255) NULL,
	[ScriptureReferenceURIHtml] [varchar](1024) NULL,
	[ScriptureReferenceURIXml] [varchar](1024) NULL,
	[Commentary] [varchar](1024) NULL,
	[AlphabetSequence] [int] NULL,
	[AlphabetSequenceScriptureReference] [varchar](255) NULL,
	[AlphabetSequenceScriptureReferenceURIHtml] [varchar](1024) NULL,
	[AlphabetSequenceScriptureReferenceURIXml] [varchar](1024) NULL,
	[AlphabetSequenceScriptureText] [varchar](1024) NULL,
 CONSTRAINT [PK_WordEngineeringKeyword] PRIMARY KEY CLUSTERED 
(
	[Keyword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WordEngineeringKeyword] ADD  CONSTRAINT [DF_WordEngineeringKeyword_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
/****** Object:  StoredProcedure [dbo].[DatabaseTransactionLogHouseKeeping200301170922]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DatabaseTransactionLogHouseKeeping200301170922] AS

--- 200301170922
   BACKUP LOG BibleDictionary WITH NO_LOG
   BACKUP LOG BibleDictionary WITH TRUNCATE_ONLY
GO
/****** Object:  StoredProcedure [dbo].[DatabaseTransactionLogHouseKeeping200301170928]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[DatabaseTransactionLogHouseKeeping200301170928] AS

-- Between 200301170928 and 200301170931.
   DBCC SHRINKFILE ( BibleDictionaryLog, TRUNCATEONLY )

GO
/****** Object:  StoredProcedure [dbo].[HouseKeeping]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[HouseKeeping] AS

--- 200301170922
   BACKUP LOG BibleDictionary WITH NO_LOG
   BACKUP LOG BibleDictionary WITH TRUNCATE_ONLY

GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleDatabaseBiblicalName]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PopulateBibleDatabaseBiblicalName]
 @dictionaryId    int           = null,
 @dictionaryWord  varchar(255)  = null,
 @commentary      text          = null
AS
BEGIN

 /* 
  TRUNCATE TABLE BibleDatabaseBiblicalName
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON
 IF exists (select * from BibleDatabaseBiblicalName where DictionaryWord = @DictionaryWord)
 BEGIN --Begin Update
  UPDATE
  BibleDatabaseBiblicalName
   SET
     DictionaryId = @dictionaryId,
     Commentary   = @commentary
   WHERE
     dictionaryWord = @dictionaryWord
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT
  BibleDatabaseBiblicalName
   (
     DictionaryId,
     DictionaryWord,
     Commentary
   )
   VALUES
   (
     @dictionaryId,
     @dictionaryWord,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure


GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleDatabaseEastons]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PopulateBibleDatabaseEastons]
 @dictionaryId    int           = null,
 @dictionaryWord  varchar(255)  = null,
 @commentary      text          = null
AS
BEGIN

 /* 
  TRUNCATE TABLE BibleDatabaseEastons
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON
 SELECT TOP 1
  DictionaryId
 FROM
  BibleDatabaseEastons
 WHERE
  dictionaryWord = @dictionaryWord
 
 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN --Begin Update
  UPDATE
  BibleDatabaseEastons
   SET
     DictionaryId = @dictionaryId,
     Commentary   = @commentary
   WHERE
     dictionaryWord = @dictionaryWord
 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT
  BibleDatabaseEastons
   (
     DictionaryId,
     DictionaryWord,
     Commentary
   )
   VALUES
   (
     @dictionaryId,
     @dictionaryWord,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleDatabaseMatthewHenryCommentary]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PopulateBibleDatabaseMatthewHenryCommentary]
 @dictionaryId    int           = null,
 @bibleBookId     int           = null,
 @bibleChapterId  int           = null,
 @bibleVerseId    int           = null,
 @commentary      text          = null
AS
BEGIN

 /* 
  TRUNCATE TABLE BibleDatabaseMatthewHenryCommentary
 */

 /*
  SELECT
    DictionaryId,
    Count(*) AS CountUnique
  FROM
    BibleDatabaseMatthewHenryCommentary (NOLOCK)
  GROUP BY
    DictionaryId
  HAVING 
    Count(*) > 1
  ORDER BY
    DictionaryId
*/

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON
 SELECT TOP 1
  DictionaryId
 FROM
  BibleDatabaseMatthewHenryCommentary
 WHERE
  BibleBookId     =  @bibleBookId     AND
  BibleChapterId  =  @bibleChapterId  AND
  BibleVerseId    =  @bibleVerseId

 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN --Begin Update
  UPDATE
  BibleDatabaseMatthewHenryCommentary
   SET
     --DictionaryId = @dictionaryId,
     Commentary   = @commentary
   WHERE
     BibleBookId     =  @bibleBookId     AND
     BibleChapterId  =  @bibleChapterId  AND
     BibleVerseId    =  @bibleVerseId

 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT
  BibleDatabaseMatthewHenryCommentary
   (
     DictionaryId,
     BibleBookId,
     BibleChapterId,
     BibleVerseId,
     Commentary
   )
   VALUES
   (
     @dictionaryId,
     @bibleBookId,
     @bibleChapterId,
     @bibleVerseId,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleDatabasePeoplesNewTestament]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PopulateBibleDatabasePeoplesNewTestament]
 @dictionaryId    int           = null,
 @bibleBookId     int           = null,
 @bibleChapterId  int           = null,
 @bibleVerseId    int           = null,
 @commentary      text          = null
AS
BEGIN

 /* 
  TRUNCATE TABLE BibleDatabasePeoplesNewTestament
 */

 /* 
SELECT
  DictionaryId,
  Count(*) AS CountUnique
FROM
  BibleDatabasePeoplesNewTestament (NOLOCK)
GROUP BY
  DictionaryId
HAVING 
  Count(*) > 1
ORDER BY
  DictionaryId
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON
 SELECT TOP 1
  DictionaryId
 FROM
  BibleDatabasePeoplesNewTestament
 WHERE
  BibleBookId     =  @bibleBookId     AND
  BibleChapterId  =  @bibleChapterId  AND
  BibleVerseId    =  @bibleVerseId

 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN --Begin Update
  UPDATE
  BibleDatabasePeoplesNewTestament
   SET
     --DictionaryId = @dictionaryId,
     Commentary   = @commentary
   WHERE
     BibleBookId     =  @bibleBookId     AND
     BibleChapterId  =  @bibleChapterId  AND
     BibleVerseId    =  @bibleVerseId

 END --End Update
 ELSE
 BEGIN --Begin Insert
  INSERT
  BibleDatabasePeoplesNewTestament
   (
     DictionaryId,
     BibleBookId,
     BibleChapterId,
     BibleVerseId,
     Commentary
   )
   VALUES
   (
     @dictionaryId,
     @bibleBookId,
     @bibleChapterId,
     @bibleVerseId,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleDictionary]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[PopulateBibleDictionary]
AS
BEGIN

 -- Exec PopulateBibleDictionary

 /*
 CREATE TABLE [dbo].[BibleDictionary] (
	[BibleWord] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
 ) ON [PRIMARY]

 ALTER TABLE [dbo].[BibleDictionary] ADD 
	CONSTRAINT [PK_PopulateDictionaryWord] PRIMARY KEY  NONCLUSTERED 
	(
		[BibleWord]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
 */

 /*
 TRUNCATE TABLE BibleDictionary
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */

 SET NOCOUNT ON

 INSERT INTO BibleDictionary
 (
  BibleWord
 )
 SELECT  DISTINCT 
         DictionaryWord FROM BibleDatabaseBiblicalName                    (NOLOCK) 
 UNION SELECT 
         DictionaryWord FROM BibleDatabaseEaston                         (NOLOCK) 
 UNION SELECT 
         DictionaryWord FROM BibleFoundationEaston                       (NOLOCK) 
 UNION SELECT 
         DictionaryWord FROM BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWords              (NOLOCK) 
 UNION SELECT 
         DictionaryWord FROM BibleFoundationNaveTopicalBible              (NOLOCK) 
 UNION SELECT 
         DictionaryWord FROM BibleFoundationRATorreyTheNewTopicalTextBook (NOLOCK) 
 WHERE
         DictionaryWord NOT IN ( SELECT BibleWord FROM BibleDictionary )

END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleFoundationEastons]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PopulateBibleFoundationEastons]
 @dictionaryId        int           = null,
 @dictionaryWord      varchar(50)   = null,
 @commentary          varchar(8000) = null
AS
BEGIN

 /*
 CREATE TABLE [dbo].[BibleFoundationEastons] 
 (
	[DictionaryId] [int] NOT NULL ,
	[DictionaryWord] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Commentary] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
 ) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]

 ALTER TABLE [dbo].[BibleFoundationEastons] WITH NOCHECK ADD 
	CONSTRAINT [PK_BibleFoundationEastons] PRIMARY KEY  CLUSTERED 
	(
		[DictionaryWordd]
	)  ON [PRIMARY] 
 */
 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON

 SELECT TOP 1
  dictionaryId
 FROM
  BibleFoundationEaston
 WHERE
  DictionaryWord = @dictionaryWord
 
 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN
  UPDATE
  BibleFoundationEaston
   SET
     DictionaryId = @dictionaryId,
     Commentary     = @commentary
   WHERE
     DictionaryWord   = @dictionaryWord
 END --End Insert
 ELSE
 BEGIN
  INSERT
  BibleFoundationEaston
   (
     DictionaryId,
     DictionaryWord,
     Commentary
   )
   VALUES
   (
     @DictionaryId,
     @DictionaryWord,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PopulateBibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords]
 @languageGreekHebrew char(1)       = null,
 @dictionaryId        int           = null,
 @dictionaryWord      varchar(255)  = null,
 @pronounce           varchar(255)  = null,
 @commentary          varchar(8000) = null
AS
BEGIN

  /*
  CREATE TABLE [dbo].[BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords] (
	[LanguageGreekHebrew] [char] (1)      NOT NULL,
	[DictionaryId]        [int]           NOT NULL,
	[DictionaryWord]      [varchar] (255) NOT NULL,
	[Pronounce]           [varchar] (255) NOT NULL,
	[Commentary]          [text]          NOT NULL 
  ) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]

  ALTER TABLE [dbo].[BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords] WITH NOCHECK ADD 
	CONSTRAINT [PK_BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords] PRIMARY KEY NONCLUSTERED 
	(
		[LanguageGreekHebrew],
		[DictionaryWord]
	)  ON [PRIMARY] 
  */

 /*
  Select
   languageGreekHebrew,
   Count( languageGreekHebrew ) As countLanguageGreekHebrew,
   Max( dictionaryId )          As maxdictionaryId,
   Max(dictionaryWord )         As maxdictionaryWord
  From
   BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords (NoLock)
   Group By
     languageGreekHebrew
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */
 SET NOCOUNT ON
 SELECT TOP 1
  dictionaryWord
 FROM
  BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords
 WHERE
  LanguageGreekHebrew = @languageGreekHebrew AND
  dictionaryWord      = @dictionaryWord
 
 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN
  UPDATE
  BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords
   SET
     dictionaryId = @dictionaryId,
     Pronounce    = @pronounce,
     Commentary   = @commentary
   WHERE
     LanguageGreekHebrew = @LanguageGreekHebrew AND
     dictionaryWord      = @dictionaryWord
 END --End Insert
 ELSE
 BEGIN
  INSERT
  BibleFoundationJamesStrongExhaustiveConcordanceOfHebrewAndGreekWords
   (
     LanguageGreekHebrew,
     dictionaryId,
     dictionaryWord,
     Pronounce,
     Commentary
   )
   VALUES
   (
     @LanguageGreekHebrew,
     @dictionaryId,
     @dictionaryWord,
     @Pronounce,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleFoundationNaveTopicalBible]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


-- BibleFoundationPopulateNaveTopicalBible.sql

CREATE PROCEDURE [dbo].[PopulateBibleFoundationNaveTopicalBible]
 @dictionaryId        int           = null,
 @dictionaryWord      varchar(50)   = null,
 @commentary          text          = null
AS
BEGIN

 /*
 CREATE TABLE [dbo].[BibleFoundationNaveTopicalBible] (
	[DictionaryId] [int]             NOT NULL,
	[DictionaryWord] [varchar] (50)  NOT NULL,
	[Commentary] [text]              NOT NULL 
 ) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]

 ALTER TABLE [dbo].[BibleFoundationNaveTopicalBible] WITH NOCHECK ADD 
	CONSTRAINT [PK_BibleFoundationNaveTopicalBible] PRIMARY KEY NONCLUSTERED  
	(
		[DictionaryWord]
	)  ON [PRIMARY] 
 */
 /* 
  SELECT
    DictionaryWord,
    COUNT ( DictionaryWord ) As DictionaryWordCount
  FROM
    BibleFoundationNaveTopicalBible
  GROUP BY
    DictionaryWord
  HAVING
    COUNT ( DictionaryWord ) > 1
  ORDER BY
    DictionaryWord
*/

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */

 SET NOCOUNT ON

 SELECT TOP 1
  dictionaryId
 FROM
  BibleFoundationNaveTopicalBible
 WHERE
  DictionaryWord = @dictionaryWord
 
 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN
  UPDATE
  BibleFoundationNaveTopicalBible
   SET
     DictionaryId      = @dictionaryId,
     Commentary     = @commentary
   WHERE
     DictionaryWord   = @dictionaryWord
 END --End Insert
 ELSE
 BEGIN
  INSERT
  BibleFoundationNaveTopicalBible
   (
     DictionaryId,
     DictionaryWord,
     Commentary
   )
   VALUES
   (
     @DictionaryId,
     @DictionaryWord,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure
GO
/****** Object:  StoredProcedure [dbo].[PopulateBibleFoundationRATorreyTheNewTopicalTextbook]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[PopulateBibleFoundationRATorreyTheNewTopicalTextbook]
 @dictionaryId        int           = null,
 @dictionaryWord      varchar(50)   = null,
 @commentary          text          = null
AS
BEGIN

 /*
 CREATE TABLE [dbo].[BibleFoundationRATorreyTheNewTopicalTextbook] (
	[DictionaryId] [int]             NOT NULL,
	[DictionaryWord] [varchar] (50)  NOT NULL,
	[Commentary] [text]              NOT NULL 
 ) ON [PRIMARY] TEXTIMAGE_ON [FileGroupText]

 ALTER TABLE [dbo].[BibleFoundationRATorreyTheNewTopicalTextbook] WITH NOCHECK ADD 
	CONSTRAINT [PK_BibleFoundationRATorreyTheNewTopicalTextbook] PRIMARY KEY NONCLUSTERED  
	(
		[DictionaryWord]
	)  ON [PRIMARY] 
 */
 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */

 /* 
  SELECT
    DictionaryWord,
    COUNT ( DictionaryWord ) As DictionaryWordCount
  FROM
    BibleFoundationRATorreyTheNewTopicalTextbook
  GROUP BY
    DictionaryWord
  HAVING
    COUNT ( DictionaryWord ) > 1
  ORDER BY
    DictionaryWord
*/

 SET NOCOUNT ON

 SELECT TOP 1
  dictionaryId
 FROM
  BibleFoundationRATorreyTheNewTopicalTextbook
 WHERE
  DictionaryWord = @dictionaryWord
 
 --If Found then update the record, else insert the record
 IF @@ROWCOUNT > 0
 BEGIN
  UPDATE
  BibleFoundationRATorreyTheNewTopicalTextbook
   SET
     DictionaryId = @dictionaryId,
     Commentary   = @commentary
   WHERE
     DictionaryWord   = @dictionaryWord
 END --End Insert
 ELSE
 BEGIN
  INSERT
  BibleFoundationRATorreyTheNewTopicalTextbook
   (
     DictionaryId,
     DictionaryWord,
     Commentary
   )
   VALUES
   (
     @DictionaryId,
     @DictionaryWord,
     @Commentary
   )
 END --End Insert
 --RETURN @@ROWCOUNT
END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[QueryBibleWord]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[QueryBibleWord]
 @bibleWord           varchar(50)   = null,
 @scriptureReference  varchar(255)  = null
AS
BEGIN

 /*
  Exec QueryBibleWord @bibleWord = 'Armageddon'
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */

 SET NOCOUNT ON

 SELECT
  @bibleWord          = LTRIM( RTRIM( @bibleWord ) ),
  @scriptureReference = LTRIM( RTRIM( @scriptureReference ) )

 IF @bibleWord = '' RETURN

 IF exists (select * from master.dbo.sysdatabases where name = 'WordEngineering')
 BEGIN
  IF not exists (select * from WordEngineering..bibleWord where bibleWord = @bibleWord)
  BEGIN
   INSERT WordEngineering..bibleWord ( bibleWord, scriptureReference ) VALUES ( @bibleWord, @scriptureReference )
  END --IF not exists (select * from WordEngineering..bibleWord where bibleWord = @bibleWord)
 END --IF exists (select * from master.dbo.sysdatabases where name = 'WordEngineering')

 SELECT
  BibleDictionary.BibleWord                                                                         AS  BibleWord,
  IsNull(BibleDatabaseBiblicalName.Commentary, '')                                                  AS  BibleDatabaseBiblicalNameCommentary,
  IsNull(BibleDatabaseEaston.Commentary,'')                                                         AS  BibleDatabaseEastonCommentary,
  IsNull(BibleFoundationEaston.Commentary,'')                                                       AS  BibleFoundationEastonCommentary,
  IsNull(BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsGreek.Commentary,'')   AS  BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsGreekCommentary,
  IsNull(BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsHebrew.Commentary,'')  AS  BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsHebrewCommentary,
  IsNull(BibleFoundationNaveTopicalBible.Commentary,'')                                             AS  BibleFoundationNaveTopicalBibleCommentary,
  IsNull(BibleFoundationRATorreyTheNewTopicalTextBook.Commentary,'')                                AS  BibleFoundationRATorreyTheNewTopicalTextBookCommentary
 FROM 
  BibleDictionary (NOLOCK)
 FULL OUTER JOIN BibleDatabaseBiblicalName                     (NOLOCK) ON BibleDictionary.BibleWord = BibleDatabaseBiblicalName.DictionaryWord
 FULL OUTER JOIN BibleDatabaseEaston                           (NOLOCK) ON BibleDictionary.BibleWord = BibleDatabaseEaston.DictionaryWord
 FULL OUTER JOIN BibleFoundationEaston                         (NOLOCK) ON BibleDictionary.BibleWord = BibleFoundationEaston.DictionaryWord
 FULL OUTER JOIN BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWords AS BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsGreek (NOLOCK) ON BibleDictionary.BibleWord = BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsGreek.DictionaryWord    AND  BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsGreek.LanguageGreekHebrew  = 'G' 
 FULL OUTER JOIN BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWords AS BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsHebrew (NOLOCK) ON BibleDictionary.BibleWord = BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsHebrew.DictionaryWord  AND  BibleFoundationJamesStrongExhaustiveConcordanceOfGreekAndHebrewWordsHebrew.LanguageGreekHebrew = 'H' 
 FULL OUTER JOIN BibleFoundationNaveTopicalBible               (NOLOCK) ON BibleDictionary.BibleWord = BibleFoundationNaveTopicalBible.DictionaryWord
 FULL OUTER JOIN BibleFoundationRATorreyTheNewTopicalTextBook  (NOLOCK) ON BibleDictionary.BibleWord = BibleFoundationRATorreyTheNewTopicalTextBook.DictionaryWord
 WHERE BibleDictionary.BibleWord LIKE @bibleWord 
ORDER BY
  BibleDictionary.BibleWord

END  --End Procedure

GO
/****** Object:  StoredProcedure [dbo].[QueryDictionaryWord]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[QueryDictionaryWord]
 @dictionaryWord  varchar(255)  = null
AS
BEGIN

 /*
  Exec QueryDictionaryWord @dictionaryWord = 'Noah'
 */

 /* 
  When SET NOCOUNT is ON, the count (indicating the number of rows 
  affected by a Transact-SQL statement) is not returned. When SET 
  NOCOUNT is OFF, the count is returned.
 */

 SET NOCOUNT ON

 SELECT
  DictionaryWord.DictionaryWord                                        AS  DictionaryWord,
  IsNull(BibleDatabaseBiblicalName.Commentary, '')                     AS  BibleDatabaseBiblicalNameCommentary,
  IsNull(BibleDatabaseEastons.Commentary,'')                           AS  BibleDatabaseEastonsCommentary,
  IsNull(BibleFoundationEastons.Commentary,'')                         AS  BibleFoundationEastonsCommentary,
  IsNull(BibleFoundationNaveTopicalBible.Commentary,'')                AS  BibleFoundationNaveTopicalBibleCommentary,
  IsNull(BibleFoundationRATorreyTheNewTopicalTextBook.Commentary,'')   AS  BibleFoundationRATorreyTheNewTopicalTextBookCommentary
 FROM 
  DictionaryWord (NOLOCK)
 FULL OUTER JOIN BibleDatabaseBiblicalName                       (NOLOCK) ON DictionaryWord.DictionaryWord = BibleDatabaseBiblicalName.DictionaryWord
 FULL OUTER JOIN BibleDatabaseEastons                            (NOLOCK) ON DictionaryWord.DictionaryWord = BibleDatabaseEastons.DictionaryWord
 FULL OUTER JOIN BibleFoundationEastons                          (NOLOCK) ON DictionaryWord.DictionaryWord = BibleFoundationEastons.DictionaryWord
 FULL OUTER JOIN BibleFoundationNaveTopicalBible                 (NOLOCK) ON DictionaryWord.DictionaryWord = BibleFoundationNaveTopicalBible.DictionaryWord
 FULL OUTER JOIN BibleFoundationRATorreyTheNewTopicalTextBook    (NOLOCK) ON DictionaryWord.DictionaryWord = BibleFoundationRATorreyTheNewTopicalTextBook.DictionaryWord
 WHERE
  DictionaryWord.DictionaryWord LIKE @dictionaryWord
ORDER BY
  DictionaryWord.DictionaryWord

END  --End Procedure


GO
/****** Object:  StoredProcedure [dbo].[usp_20220917PopulateBibleDictionary]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   PROCEDURE [dbo].[usp_20220917PopulateBibleDictionary]
AS
BEGIN
SELECT DictionaryWord, Commentary FROM BibleDictionary..BibleDatabaseHitchcockBiblicalName
WHERE NOT EXISTS 
(
	SELECT DictionaryWord FROM BibleDictionary..BibleDictionary 
	WHERE 
		BibleDictionary..BibleDictionary.BibleWord
		=
		BibleDictionary..BibleDatabaseHitchcockBiblicalName.DictionaryWord
) 

SELECT DictionaryWord, Commentary FROM BibleDictionary..BibleFoundationNaveTopicalBible
WHERE NOT EXISTS 
(
	SELECT DictionaryWord FROM BibleDictionary..BibleDictionary 
	WHERE 
		BibleDictionary..BibleDictionary.BibleWord
		=
		BibleDictionary..BibleFoundationNaveTopicalBible.DictionaryWord
) 

SELECT DictionaryWord, Commentary FROM BibleDictionary..BibleFoundationRATorreyTheNewTopicalTextbook
WHERE NOT EXISTS 
(
	SELECT DictionaryWord FROM BibleDictionary..BibleDictionary 
	WHERE 
		BibleDictionary..BibleDictionary.BibleWord
		=
		BibleDictionary..BibleFoundationRATorreyTheNewTopicalTextbook.DictionaryWord
) 
END
GO
/****** Object:  StoredProcedure [dbo].[uspBibleDictionaryQuery]    Script Date: 2/1/2023 2:23:57 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[uspBibleDictionaryQuery]
 @bibleFoundationJamesStrongDictionaryWord AS varchar(50)    =  null
AS
BEGIN

 --uspBibleDictionaryQuery @bibleFoundationJamesStrongDictionaryWord = 'God'
 --uspBibleDictionaryQuery @bibleFoundationJamesStrongDictionaryWord = 'David'

 DECLARE  @sql        AS nvarchar(4000)
 DECLARE  @and        AS varchar(5) 
 DECLARE  @from       AS varchar(4000)
 DECLARE  @select     AS varchar(4000)
 DECLARE  @where      AS varchar(8000)
 DECLARE  @orderBy    AS varchar(8000)
 
 SET      @select     =  'SELECT  ' +
                         ' BibleFoundationJamesStrongDictionaryWord, ' +
                         ' BibleDatabaseBiblicalNameCommentary, '      +
                         ' BibleDatabaseEastonCommentary, '            +
                         ' BibleFoundationEastonCommentary, '          +
                         ' BibleFoundationJamesStrongCommentary, '     +
                         ' BibleFoundationNaveCommentary, '            +
                         ' BibleFoundationTorreyCommentary '

 SET      @and        =  ' AND '
 SET      @from       =  ' FROM Bible..BibleDictionary '
 SET      @where      =  ' WHERE ' + SPACE(5)
 SET      @orderBy    =  ' ORDER BY BibleFoundationJamesStrongDictionaryWord '  

 IF @bibleFoundationJamesStrongDictionaryWord <> null
 BEGIN
  SET @where = @where + ' BibleFoundationJamesStrongDictionaryWord Like ''%' + @bibleFoundationJamesStrongDictionaryWord + '%''' + @and
 END

 SET @where = LEFT( @where, LEN(@where) - LEN(@and) )

 SET @sql = @select + @from + @where + @orderBy

 EXECUTE sp_executesql @sql

 PRINT @sql

END



GO
USE [master]
GO
ALTER DATABASE [BibleDictionary] SET  READ_WRITE 
GO
