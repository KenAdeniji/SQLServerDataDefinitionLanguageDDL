USE [master]
GO
/****** Object:  Database [RatingRank]    Script Date: 6/24/2017 11:30:16 AM ******/
CREATE DATABASE [RatingRank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RatingRank_Data', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankData.MDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [RatingRank_Image_FileGroup] 
( NAME = N'RatingRank_Image', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [RatingRank_Index_FileGroup] 
( NAME = N'RatingRank_Index', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [RatingRank_Text_FileGroup] 
( NAME = N'RatingRank_Text', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [RatingRank_Xml_FileGroup] 
( NAME = N'RatingRank_Xml', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'RatingRank_Log', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankLog.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
GO
ALTER DATABASE [RatingRank] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RatingRank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RatingRank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RatingRank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RatingRank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RatingRank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RatingRank] SET ARITHABORT OFF 
GO
ALTER DATABASE [RatingRank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RatingRank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RatingRank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RatingRank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RatingRank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RatingRank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RatingRank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RatingRank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RatingRank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RatingRank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RatingRank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RatingRank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RatingRank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RatingRank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RatingRank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RatingRank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RatingRank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RatingRank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RatingRank] SET  MULTI_USER 
GO
ALTER DATABASE [RatingRank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RatingRank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RatingRank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RatingRank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RatingRank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RatingRank', N'ON'
GO
USE [RatingRank]
GO
/****** Object:  User [ephwebuser]    Script Date: 6/24/2017 11:30:16 AM ******/
CREATE USER [ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephwebuser]
GO
/****** Object:  Table [dbo].[Denomination]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denomination](
	[DenominationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_Denomination_DateCreated]  DEFAULT (getdate()),
	[DateUpdated] [datetime2](7) NULL,
	[ReligionId] [bigint] NOT NULL,
	[Denomination] [nvarchar](50) NULL,
 CONSTRAINT [PK_Denomination] PRIMARY KEY CLUSTERED 
(
	[DenominationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_Organization_DateCreated]  DEFAULT (getdate()),
	[DateUpdated] [datetime2](7) NULL,
	[OrganizationName] [nvarchar](255) NOT NULL,
	[DenominationId] [bigint] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Religion]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_Religion_DateCreated]  DEFAULT (getdate()),
	[DateUpdated] [datetime2](7) NULL,
	[Religion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Denomination] ON 

INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (1, CAST(N'2014-08-18 18:55:54.6130000' AS DateTime2), NULL, 2, N'Catholic')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (2, CAST(N'2014-08-18 18:56:51.5170000' AS DateTime2), NULL, 2, N'Lutheran')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (3, CAST(N'2014-08-18 18:57:10.1670000' AS DateTime2), NULL, 2, N'Episcopal')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (4, CAST(N'2014-08-18 18:57:40.5970000' AS DateTime2), NULL, 2, N'Methodist')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (5, CAST(N'2014-08-18 18:57:48.8670000' AS DateTime2), NULL, 2, N'Baptist')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (6, CAST(N'2014-08-18 18:58:41.7500000' AS DateTime2), NULL, 2, N'Latter Day Saints')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (7, CAST(N'2014-08-18 19:02:22.3430000' AS DateTime2), NULL, 2, N'(Non denominational)')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (8, CAST(N'2014-08-18 19:02:41.8970000' AS DateTime2), NULL, 2, N'Greek Orthodox')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (9, CAST(N'2014-08-18 19:07:16.2700000' AS DateTime2), NULL, 2, N'Valley Bible Church')
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (10, CAST(N'2014-08-18 19:15:44.9270000' AS DateTime2), NULL, 3, NULL)
INSERT [dbo].[Denomination] ([DenominationId], [DateCreated], [DateUpdated], [ReligionId], [Denomination]) VALUES (11, CAST(N'2014-08-18 19:16:51.8200000' AS DateTime2), NULL, 4, NULL)
SET IDENTITY_INSERT [dbo].[Denomination] OFF
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (1, CAST(N'2012-12-04 00:00:00.0000000' AS DateTime2), CAST(N'2014-08-18 21:11:35.8830000' AS DateTime2), N'Resurrection Lutheran Church', 2)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (2, CAST(N'2013-07-03 21:00:30.3900000' AS DateTime2), CAST(N'2013-07-03 21:59:43.0570000' AS DateTime2), N'Islamic Studies of East Bay', 10)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (3, CAST(N'2013-07-03 22:22:45.2830000' AS DateTime2), CAST(N'2013-07-04 15:36:16.6270000' AS DateTime2), N'Saint Edward''s Catholic Church', 1)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (4, CAST(N'2013-07-03 22:25:36.3200000' AS DateTime2), NULL, N'Our Lady of Lourdes Catholic Church', 1)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (5, CAST(N'2013-07-03 22:26:58.4430000' AS DateTime2), CAST(N'2013-07-04 15:23:27.2800000' AS DateTime2), N'Christian Layman Church', 7)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (6, CAST(N'2013-07-03 22:32:54.2700000' AS DateTime2), CAST(N'2013-07-03 22:33:05.2700000' AS DateTime2), N'St. James Episcopal Church', 3)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (7, CAST(N'2013-07-03 22:35:37.0830000' AS DateTime2), NULL, N'St. Paul''s Episcopal Church', 3)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (8, CAST(N'2013-07-03 22:38:08.2630000' AS DateTime2), NULL, N'Valley Bible Church at the Crossing', 9)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (9, CAST(N'2013-07-03 22:40:10.6800000' AS DateTime2), NULL, N'Abu Bakr Siddiq Mosque', 10)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (10, CAST(N'2014-08-11 20:22:26.9500000' AS DateTime2), NULL, N'St Paul United Methodist', 4)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (11, CAST(N'2014-08-11 21:13:17.8300000' AS DateTime2), CAST(N'2014-08-17 21:23:32.7570000' AS DateTime2), N'Greek Orthodox Church of the Ascension', 8)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (12, CAST(N'2014-08-15 14:26:54.8530000' AS DateTime2), NULL, N'The Light of Buddha Temple', 11)
INSERT [dbo].[Organization] ([OrganizationId], [DateCreated], [DateUpdated], [OrganizationName], [DenominationId]) VALUES (13, CAST(N'2014-08-15 14:48:37.2530000' AS DateTime2), CAST(N'2014-08-18 11:42:51.1100000' AS DateTime2), N'The Church of Jesus Christ of Latter-day Saints', 6)
SET IDENTITY_INSERT [dbo].[Organization] OFF
SET IDENTITY_INSERT [dbo].[Religion] ON 

INSERT [dbo].[Religion] ([ReligionId], [DateCreated], [DateUpdated], [Religion]) VALUES (1, CAST(N'2014-08-18 18:53:16.4300000' AS DateTime2), NULL, N'Judaism')
INSERT [dbo].[Religion] ([ReligionId], [DateCreated], [DateUpdated], [Religion]) VALUES (2, CAST(N'2014-08-18 18:54:32.1700000' AS DateTime2), NULL, N'Christianity')
INSERT [dbo].[Religion] ([ReligionId], [DateCreated], [DateUpdated], [Religion]) VALUES (3, CAST(N'2014-08-18 18:54:39.2170000' AS DateTime2), NULL, N'Islam')
INSERT [dbo].[Religion] ([ReligionId], [DateCreated], [DateUpdated], [Religion]) VALUES (4, CAST(N'2014-08-18 18:55:10.2130000' AS DateTime2), NULL, N'Buddhist')
INSERT [dbo].[Religion] ([ReligionId], [DateCreated], [DateUpdated], [Religion]) VALUES (5, CAST(N'2014-08-18 18:55:15.7000000' AS DateTime2), NULL, N'Hindu')
SET IDENTITY_INSERT [dbo].[Religion] OFF
/****** Object:  StoredProcedure [dbo].[uspDenominationSelect]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDenominationSelect]
AS
BEGIN
	--EXEC uspDenominationSelect
	SELECT 
        DenominationId,
        Religion,
        ISNULL(Denomination, Religion) AS Denomination
	FROM Denomination JOIN Religion ON Denomination.ReligionId = Religion.ReligionId
	ORDER BY Religion, Denomination
END


GO
/****** Object:  StoredProcedure [dbo].[uspRatingRankMaintenance]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspRatingRankMaintenance]
	@organizationId			BIGINT			=	NULL	OUTPUT,
	@dateCreated			DATETIME		=	NULL	OUTPUT,
	@dateUpdated			DATETIME		=	NULL	OUTPUT,
	@organizationName		NVARCHAR(MAX)	=	NULL,
	@denominationId			BIGINT         	=	NULL
AS
BEGIN
	/*
		EXEC uspRatingRankMaintenance
			@organizationId = 1,
			@organizationName = 'Resurrection Lutheran Church'
	*/

	IF @organizationId IS NULL AND @dateCreated IS NULL
	BEGIN
		SET @dateCreated = GETDATE()
	END

	IF @organizationId IS NOT NULL AND @dateUpdated IS NULL
	BEGIN
		SET @dateUpdated = GETDATE()
	END

	IF @organizationId IS NULL 
	BEGIN
		INSERT INTO Organization
		(
			DateCreated,
			OrganizationName,
			DenominationId
		)
		VALUES
		(
			@dateCreated,
			@organizationName,
			@denominationId
		)
		IF @@ROWCOUNT = 1
		BEGIN
			SET @organizationId = SCOPE_IDENTITY()
		END
	END
	ELSE
	BEGIN
		UPDATE Organization SET
			OrganizationName	=	@organizationName,
			DenominationId		=	@denominationId,
			DateUpdated			=	@dateUpdated
		WHERE
			OrganizationId		=	@organizationId
	END
END


GO
/****** Object:  StoredProcedure [dbo].[uspRatingRankRetrieve]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspRatingRankRetrieve]
	@organizationId	BIGINT
AS
BEGIN
	--EXEC uspRatingRankRetrieve @organizationId = 1
	SELECT TOP 1 *
	FROM Organization
	WHERE organizationId = @organizationId
END


GO
/****** Object:  StoredProcedure [dbo].[uspRatingRankSelect]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[uspRatingRankSelect]
	@organizationIdFrom		BIGINT			=	-2147483648,
	@organizationIdUntil	BIGINT			=	2147483647,
	@dateCreatedFrom		DATETIME2		=	'0001-01-01',
	@dateCreatedUntil		DATETIME2		=	'9999-01-01', --9999-12-31
	@dateUpdatedFrom		DATETIME2		=	'0001-01-01',
	@dateUpdatedUntil		DATETIME2		=	'9999-01-01', --9999-12-31
	@organizationName		NVARCHAR(MAX)	=	NULL,
	@religion				NVARCHAR(MAX)	=	NULL,
	@denomination			NVARCHAR(MAX)	=	NULL,
	@clauseOrderBy			VARCHAR(255)	=	' ORDER BY organizationId DESC '
AS
BEGIN
/*
	EXEC uspRatingRankSelect @religion = 'Christianity'

    EXEC uspRatingRankSelect @denomination = 'Catholic'

	EXEC uspRatingRankSelect
	@dateCreatedFrom				=	'0001-01-01',
	@dateCreatedUntil				=	'9999-01-01', --9999-12-31
	@dateUpdatedFrom				=	'0001-01-01',
	@dateUpdatedUntil				=	'9999-01-01' --9999-12-31
*/
	DECLARE @clauseAnd          AS NVARCHAR(7)
	DECLARE @clauseWhere        AS NVARCHAR(7)
	DECLARE @quote              AS NVARCHAR(1)
	DECLARE @sqlSelectStatement AS NVARCHAR(4000)
	SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
	SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
	SET @quote              = ''''
	SET @sqlSelectStatement = 'SELECT * FROM Organization JOIN Denomination ON Organization.DenominationId = Denomination.DenominationId JOIN Religion ON Denomination.ReligionId = Religion.ReligionId' + @clauseWhere

	DECLARE @lowestDate AS DateTime2
	SET @lowestDate = '1753-01-01' --0001-01-01

	DECLARE @highestDate AS DateTime2
	SET @highestDate = '9999-01-01' --9999-12-31

	DECLARE @lowestNumber AS INT
	SET @lowestNumber = -2147483648

	DECLARE @highestNumber AS INT
	SET @highestNumber = 2147483647

	IF @organizationIdFrom IS NOT NULL AND @organizationIdFrom > @lowestNumber
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' organizationId >= ' + CONVERT( NVARCHAR, @organizationIdFrom ) + @clauseAnd
	END
	IF @organizationIdUntil IS NOT NULL AND @organizationIdUntil < @highestNumber
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' organizationId <= ' + CONVERT( NVARCHAR, @organizationIdUntil ) + @clauseAnd
	END

	IF @dateCreatedFrom IS NOT NULL AND @dateCreatedFrom > @lowestDate
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' dateCreated >= ' + @quote + CONVERT( NVARCHAR, @dateCreatedFrom ) + @quote + @clauseAnd
	END
	IF @dateCreatedUntil IS NOT NULL AND @dateCreatedUntil < @highestDate
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' dateCreated <= ' + @quote + CONVERT( NVARCHAR, @dateCreatedUntil ) + @quote + @clauseAnd
	END

	IF @dateUpdatedFrom IS NOT NULL AND @dateUpdatedFrom > @lowestDate
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' dateUpdated >= ' + @quote + CONVERT( NVARCHAR, @dateUpdatedFrom ) + @quote + @clauseAnd
	END
	IF @dateUpdatedUntil IS NOT NULL AND @dateUpdatedUntil < @highestDate
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' dateUpdated <= ' + @quote + CONVERT( NVARCHAR, @dateUpdatedUntil ) + @quote + @clauseAnd
	END

	IF @organizationName IS NOT NULL
	BEGIN
		SET @organizationName = REPLACE(@organizationName, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' organizationName LIKE ''%' + @organizationName + '%''' + @clauseAnd
	END

	IF @religion IS NOT NULL
	BEGIN
		SET @religion = REPLACE(@religion, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' religion LIKE ''%' + @religion + '%''' + @clauseAnd
	END

	IF @denomination IS NOT NULL
	BEGIN
		SET @denomination = REPLACE(@denomination, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' denomination LIKE ''%' + @denomination + '%''' + @clauseAnd
	END

	IF RIGHT( @sqlSelectStatement, 7 ) = @clauseAnd
	BEGIN
	SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseAnd ) )
	END
	ELSE
	BEGIN
	SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseWhere ) )
	END

	EXEC xp_logevent 60000, @sqlSelectStatement, informational
	SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy
	EXEC sp_executesql @sqlSelectStatement
	--PRINT @sqlSelectStatement
END


GO
/****** Object:  StoredProcedure [dbo].[uspReligionSelect]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspReligionSelect]
AS
BEGIN
	--EXEC uspReligionSelect
	SELECT 
        ReligionId,
        Religion
	FROM Religion
	ORDER BY Religion
END


GO
/****** Object:  StoredProcedure [dbo].[uspSelfMadeSelect]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelfMadeSelect]
AS
BEGIN
	--EXEC uspSelfMadeSelect
	SELECT TOP 1 
    OrganizationName,
    Religion.Religion AS Religion,
    Denomination.Denomination AS Denomination
	FROM Organization JOIN Denomination ON Organization.DenominationId = Denomination.DenominationId JOIN Religion ON Denomination.ReligionId = Religion.ReligionId 
	ORDER BY NewID()
END


GO
/****** Object:  StoredProcedure [dbo].[uspTrueOriginSelect]    Script Date: 6/24/2017 11:30:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspTrueOriginSelect]
@TOP AS INTEGER = 10
AS
BEGIN
	--EXEC uspTrueOriginSelect
	SELECT TOP (@TOP) OrganizationId, OrganizationName, DenominationId
	FROM Organization 
	ORDER BY NewID()
END


GO
USE [master]
GO
ALTER DATABASE [RatingRank] SET  READ_WRITE 
GO
