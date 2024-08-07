USE [master]
GO
/****** Object:  Database [HomeAbroad]    Script Date: 2/1/2023 2:35:37 PM ******/
CREATE DATABASE [HomeAbroad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeAbroad_Data', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadData.MDF' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [HomeAbroad_Image_FileGroup] 
( NAME = N'HomeAbroad_Image', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [HomeAbroad_Index_FileGroup] 
( NAME = N'HomeAbroad_Index', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [HomeAbroad_Text_FileGroup] 
( NAME = N'HomeAbroad_Text', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [HomeAbroad_Xml_FileGroup] 
( NAME = N'HomeAbroad_Xml', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'HomeAbroad_Log', FILENAME = N'E:\SQLServerDataFiles\HomeAbroad\HomeAbroadLog.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HomeAbroad] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeAbroad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeAbroad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeAbroad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeAbroad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeAbroad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeAbroad] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeAbroad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeAbroad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeAbroad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeAbroad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeAbroad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeAbroad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeAbroad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeAbroad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeAbroad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeAbroad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeAbroad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeAbroad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeAbroad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeAbroad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeAbroad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeAbroad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeAbroad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeAbroad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeAbroad] SET  MULTI_USER 
GO
ALTER DATABASE [HomeAbroad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeAbroad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeAbroad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeAbroad] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HomeAbroad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeAbroad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HomeAbroad] SET QUERY_STORE = OFF
GO
USE [HomeAbroad]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/1/2023 2:35:37 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[Abroad]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abroad](
	[AbroadId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NULL,
	[Commentary] [nvarchar](max) NULL,
	[ScriptureReference] [nvarchar](max) NULL,
	[WhoIsId] [bigint] NOT NULL,
	[Word] [nvarchar](max) NULL,
 CONSTRAINT [PK_Abroad] PRIMARY KEY CLUSTERED 
(
	[AbroadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WhoIs]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WhoIs](
	[WhoIsId] [bigint] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WhoIs] PRIMARY KEY CLUSTERED 
(
	[WhoIsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abroad] ADD  CONSTRAINT [DF_Abroad_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Abroad] ADD  CONSTRAINT [DF_Abroad_ByWhoId]  DEFAULT ((1)) FOR [WhoIsId]
GO
ALTER TABLE [dbo].[Abroad]  WITH CHECK ADD  CONSTRAINT [FK_WhoIs_Abroad] FOREIGN KEY([WhoIsId])
REFERENCES [dbo].[WhoIs] ([WhoIsId])
GO
ALTER TABLE [dbo].[Abroad] CHECK CONSTRAINT [FK_WhoIs_Abroad]
GO
/****** Object:  StoredProcedure [dbo].[uspAbroadInsert]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspAbroadInsert]
	@abroadId				BIGINT			=	NULL	OUTPUT,
	@dateCreated			DATETIME		=	NULL	OUTPUT,
	@whoIsId				BIGINT			=	1,
	@commentary				NVARCHAR(MAX)	=	NULL,
	@scriptureReference		NVARCHAR(MAX)	=	NULL,
	@word					NVARCHAR(MAX)	=	NULL
AS
BEGIN
/*
DECLARE		@abroadId		BIGINT
DECLARE		@dateCreated	DATETIME

EXEC [dbo].[uspAbroadInsert]
	@abroadId		=	@abroadId		OUTPUT,
	@dateCreated	=	@dateCreated	OUTPUT

SELECT '@abroadId: ', @abroadId
SELECT '@dateCreated: ', @dateCreated
GO
*/
	IF @dateCreated IS NULL
	BEGIN
		SET @dateCreated = GETDATE()
	END
	INSERT Abroad
	(
		DateCreated,
		WhoIsId,
		Commentary,
		ScriptureReference,
		Word
	)
	VALUES
	(
		@dateCreated,
		@whoIsId,
		@commentary,
		@scriptureReference,
		@word
	)
	IF @@ROWCOUNT = 1
	BEGIN
		SET @abroadId = SCOPE_IDENTITY()
	END
END

GO
/****** Object:  StoredProcedure [dbo].[uspAbroadRetrieve]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspAbroadRetrieve]
	@abroadId	BIGINT
AS
BEGIN
	--EXEC uspAbroadRetrieve @abroadId = 69
	SELECT TOP 1 *
	FROM Abroad
	WHERE AbroadId = @abroadId
END

GO
/****** Object:  StoredProcedure [dbo].[uspAbroadSelect]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[uspAbroadSelect]
	
	@abroadIdFrom			BIGINT			=	-2147483648,
	@abroadIdUntil			BIGINT			=	2147483647,
	@dateCreatedFrom		DATETIME2		=	'0001-01-01',
	@dateCreatedUntil		DATETIME2		=	'9999-01-01', --9999-12-31
	@dateUpdatedFrom		DATETIME2		=	'0001-01-01',
	@dateUpdatedUntil		DATETIME2		=	'9999-01-01', --9999-12-31
	@whoIsId				BIGINT			=	1,
	@commentary				NVARCHAR(MAX)	=	NULL,
	@scriptureReference		NVARCHAR(MAX)	=	NULL,
	@word					NVARCHAR(MAX)	=	NULL,
	@clauseOrderBy			VARCHAR(255)	=	' ORDER BY abroadId DESC '
AS
BEGIN
/*
	EXEC uspAbroadSelect @scriptureReference = 'Hosea 11:1'
	EXEC uspAbroadSelect @dateCreatedUntil = '9999-01-01' 

	EXEC uspAbroadSelect
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
	SET @sqlSelectStatement = 'SELECT * FROM Abroad ' + @clauseWhere

	DECLARE @lowestDate AS DateTime2
	SET @lowestDate = '1753-01-01' --0001-01-01

	DECLARE @highestDate AS DateTime2
	SET @highestDate = '9999-01-01' --9999-12-31

	DECLARE @lowestNumber AS INT
	SET @lowestNumber = -2147483648

	DECLARE @highestNumber AS INT
	SET @highestNumber = 2147483647

	--EXEC xp_logevent 60000, @sqlSelectStatement, informational
	IF @whoIsId IS NOT NULL
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' whoIsId = ' + CONVERT( NVARCHAR, @whoIsId ) + @clauseAnd
	END
	IF @abroadIdFrom IS NOT NULL AND @abroadIdFrom > @lowestNumber
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' abroadId >= ' + CONVERT( NVARCHAR, @abroadIdFrom ) + @clauseAnd
	END
	IF @abroadIdUntil IS NOT NULL AND @abroadIdUntil < @highestNumber
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' abroadId <= ' + CONVERT( NVARCHAR, @abroadIdUntil ) + @clauseAnd
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
	IF @commentary IS NOT NULL
	BEGIN
		SET @commentary = REPLACE(@commentary, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' commentary LIKE ''%' + @commentary + '%''' + @clauseAnd
	END
	IF @scriptureReference IS NOT NULL
	BEGIN
		SET @scriptureReference = REPLACE(@scriptureReference, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' scriptureReference LIKE ''%' + @scriptureReference + '%''' + @clauseAnd
	END
	IF @word IS NOT NULL
	BEGIN
		SET @word = REPLACE(@word, "'", "''")
		SET @sqlSelectStatement = @sqlSelectStatement + ' word LIKE ''%' + @word + '%''' + @clauseAnd
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
/****** Object:  StoredProcedure [dbo].[uspAbroadUpdate]    Script Date: 2/1/2023 2:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspAbroadUpdate]
	@abroadId				BIGINT,
	@dateUpdated			DATETIME		=	NULL	OUTPUT,
	@whoIsId				INT				=	1,
	@commentary				NVARCHAR(MAX)	=	NULL,
	@scriptureReference		NVARCHAR(MAX)	=	NULL,
	@word					NVARCHAR(MAX)	=	NULL
AS
BEGIN
	IF @dateUpdated IS NULL
	BEGIN
		SET @dateUpdated = GETDATE()
	END
	UPDATE Abroad SET
		DateUpdated				=		@dateUpdated,
		Commentary				=		@commentary,
		ScriptureReference		=		@scriptureReference,
		Word					=		@word
	WHERE
		AbroadId				=		@abroadId
	AND	WhoIsId					=		@whoIsId
END

GO
USE [master]
GO
ALTER DATABASE [HomeAbroad] SET  READ_WRITE 
GO
