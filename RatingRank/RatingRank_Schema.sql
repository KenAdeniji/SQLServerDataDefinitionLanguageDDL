USE [master]
GO
/****** Object:  Database [RatingRank]    Script Date: 2/1/2023 2:48:01 PM ******/
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
( NAME = N'RatingRank_Log', FILENAME = N'E:\SQLServerDataFiles\RatingRank\RatingRankLog.LDF' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
ALTER DATABASE [RatingRank] SET  DISABLE_BROKER 
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
ALTER DATABASE [RatingRank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RatingRank] SET QUERY_STORE = OFF
GO
USE [RatingRank]
GO
/****** Object:  User [ephwebuser]    Script Date: 2/1/2023 2:48:02 PM ******/
CREATE USER [ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephwebuser]
GO
/****** Object:  Table [dbo].[Denomination]    Script Date: 2/1/2023 2:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denomination](
	[DenominationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NULL,
	[ReligionId] [bigint] NOT NULL,
	[Denomination] [nvarchar](50) NULL,
 CONSTRAINT [PK_Denomination] PRIMARY KEY CLUSTERED 
(
	[DenominationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 2/1/2023 2:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NULL,
	[OrganizationName] [nvarchar](255) NOT NULL,
	[DenominationId] [bigint] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 2/1/2023 2:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NULL,
	[Religion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Denomination] ADD  CONSTRAINT [DF_Denomination_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [DF_Organization_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Religion] ADD  CONSTRAINT [DF_Religion_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  StoredProcedure [dbo].[uspDenominationSelect]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspRatingRankMaintenance]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspRatingRankRetrieve]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspRatingRankSelect]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspReligionSelect]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspSelfMadeSelect]    Script Date: 2/1/2023 2:48:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspTrueOriginSelect]    Script Date: 2/1/2023 2:48:02 PM ******/
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
