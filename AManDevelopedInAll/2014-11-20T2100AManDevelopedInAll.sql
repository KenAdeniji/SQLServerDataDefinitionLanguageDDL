USE [master]
GO
/****** Object:  Database [AManDevelopedInAll]    Script Date: 11/20/2014 9:00:50 PM ******/
CREATE DATABASE [AManDevelopedInAll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AManDevelopedInAll_Data', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllData.MDF' , SIZE = 5056KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AManDevelopedInAll_Image_FileGroup] 
( NAME = N'AManDevelopedInAll_Image', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [AManDevelopedInAll_Index_FileGroup] 
( NAME = N'AManDevelopedInAll_Index', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AManDevelopedInAll_Text_FileGroup] 
( NAME = N'AManDevelopedInAll_Text', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AManDevelopedInAll_Xml_FileGroup] 
( NAME = N'AManDevelopedInAll_Xml', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'AManDevelopedInAll_Log', FILENAME = N'E:\SQLServerDataFiles\AManDevelopedInAll\AManDevelopedInAllLog.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
GO
ALTER DATABASE [AManDevelopedInAll] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AManDevelopedInAll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AManDevelopedInAll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET ARITHABORT OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AManDevelopedInAll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AManDevelopedInAll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AManDevelopedInAll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AManDevelopedInAll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AManDevelopedInAll] SET  MULTI_USER 
GO
ALTER DATABASE [AManDevelopedInAll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AManDevelopedInAll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AManDevelopedInAll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AManDevelopedInAll] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AManDevelopedInAll] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AManDevelopedInAll', N'ON'
GO
USE [AManDevelopedInAll]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 11/20/2014 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_Organization_DateCreated]  DEFAULT (getdate()),
	[DateUpdated] [datetime2](7) NULL,
	[OrganizationName] [nvarchar](1024) NOT NULL,
	[Uri] [nvarchar](256) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Term]    Script Date: 11/20/2014 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_Term_DateCreated]  DEFAULT (getdate()),
	[DateUpdated] [datetime2](7) NULL,
	[OrganizationId] [bigint] NOT NULL,
	[OrganizationYear] [int] NOT NULL,
	[YearTerm] [int] NOT NULL,
	[DateStart] [datetime2](7) NULL,
	[DateEnd] [datetime2](7) NULL,
	[Commentary] [nvarchar](max) NULL,
	[Uri] [nvarchar](256) NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [Uri]) VALUES (1, CAST(N'2014-11-18 22:11:39.8700000' AS DateTime2), NULL, N'Central Piedmont Community College (CPCC), Charlotte, North Carolina (NC) 28235-5009, United States of America (USA).', N'cpcc.edu')
SET IDENTITY_INSERT [dbo].[Organization] OFF
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([TermId], [DateCreated], [DateUpdated], [OrganizationId], [OrganizationYear], [YearTerm], [DateStart], [DateEnd], [Commentary], [Uri]) VALUES (1, CAST(N'2014-11-18 22:48:31.8100000' AS DateTime2), NULL, 1, 2015, 1, CAST(N'2015-01-12 00:00:00.0000000' AS DateTime2), CAST(N'2015-05-12 00:00:00.0000000' AS DateTime2), NULL, N'cpcc.edu/admissions/registration/semesters/spring')
INSERT [dbo].[Term] ([TermId], [DateCreated], [DateUpdated], [OrganizationId], [OrganizationYear], [YearTerm], [DateStart], [DateEnd], [Commentary], [Uri]) VALUES (2, CAST(N'2014-11-18 22:51:57.0130000' AS DateTime2), NULL, 1, 2014, 2, CAST(N'2014-05-21 00:00:00.0000000' AS DateTime2), CAST(N'2014-07-17 00:00:00.0000000' AS DateTime2), NULL, N'cpcc.edu/admissions/registration/semesters/summer')
INSERT [dbo].[Term] ([TermId], [DateCreated], [DateUpdated], [OrganizationId], [OrganizationYear], [YearTerm], [DateStart], [DateEnd], [Commentary], [Uri]) VALUES (5, CAST(N'2014-11-18 22:57:43.3600000' AS DateTime2), NULL, 1, 2014, 3, CAST(N'2014-08-18 00:00:00.0000000' AS DateTime2), CAST(N'2014-12-12 00:00:00.0000000' AS DateTime2), NULL, N'cpcc.edu/admissions/registration/semesters/prefall')
SET IDENTITY_INSERT [dbo].[Term] OFF
ALTER TABLE [dbo].[Term]  WITH CHECK ADD  CONSTRAINT [FK_Term_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[Term] CHECK CONSTRAINT [FK_Term_Organization]
GO
/****** Object:  StoredProcedure [dbo].[usp_OrganizationSelect]    Script Date: 11/20/2014 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_OrganizationSelect]
 @OrganizationName      AS NVARCHAR(1024)	=  NULL,
 @Uri					AS NVARCHAR(256)    =  NULL,
 @clauseOrderBy			AS NVARCHAR(255)	=  ' ORDER BY OrganizationName, Uri '
AS
BEGIN
 DECLARE @clauseAnd          AS NVARCHAR(7)
 DECLARE @clauseWhere        AS NVARCHAR(7)
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @sqlSelectStatement AS NVARCHAR(4000)
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @sqlSelectStatement = 'SELECT DISTINCT Organization.OrganizationId AS OrganizationId, Organization.OrganizationName AS OrganizationName, Organization.Uri AS Uri FROM Organization ' + @clauseWhere
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 IF @OrganizationName IS NOT NULL
 BEGIN
  --SET @OrganizationName = REPLACE(@OrganizationName, "'", "''")
  SET @sqlSelectStatement = @sqlSelectStatement + ' Organization.OrganizationName LIKE ''%' + @OrganizationName + '%''' + @clauseAnd
 END
 IF @Uri IS NOT NULL
 BEGIN
  --SET @Uri = REPLACE(@Uri, "'", "''")
  SET @sqlSelectStatement = @sqlSelectStatement + ' Organization.Uri LIKE ''%' + @Uri + '%''' + @clauseAnd
 END
 IF RIGHT( @sqlSelectStatement, 7 ) = @clauseAnd
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseAnd ) )
 END
 ELSE
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseWhere ) )
 END
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy
 EXEC sp_executesql @sqlSelectStatement
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TermSelect]    Script Date: 11/20/2014 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TermSelect]
 @OrganizationId	AS INT = NULL
AS
BEGIN
SELECT TOP 1 OrganizationName, Uri FROM Organization WHERE OrganizationId = @OrganizationId
SELECT DateStart, DateEnd, Uri FROM Term WHERE OrganizationId = @OrganizationId ORDER BY DateStart, DateEnd
END

GO
USE [master]
GO
ALTER DATABASE [AManDevelopedInAll] SET  READ_WRITE 
GO
