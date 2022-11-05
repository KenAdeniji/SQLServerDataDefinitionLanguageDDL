USE [master]
GO
/****** Object:  Database [IHaveDecidedToWorkOnAGradualImprovingSystem]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'I have decided to work on a gradual improving system data', FILENAME = N'E:\SQLServerDataFiles\IHaveDecidedToWorkOnAGradualImprovingSystem\IHaveDecidedToWorkOnAGradualImprovingSystemData.MDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [I have decided to work on a gradual improving system index] 
( NAME = N'I have decided to work on a gradual improving system index', FILENAME = N'E:\SQLServerDataFiles\IHaveDecidedToWorkOnAGradualImprovingSystem\IHaveDecidedToWorkOnAGradualImprovingSystemIndex.NDF' , SIZE = 1152KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'I have decided to work on a gradual improving system log', FILENAME = N'E:\SQLServerDataFiles\IHaveDecidedToWorkOnAGradualImprovingSystem\IHaveDecidedToWorkOnAGradualImprovingSystemLog.LDF' , SIZE = 3328KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IHaveDecidedToWorkOnAGradualImprovingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET QUERY_STORE = OFF
GO
USE [IHaveDecidedToWorkOnAGradualImprovingSystem]
GO
/****** Object:  User [LoginNameSecurity]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE USER [LoginNameSecurity] FOR LOGIN [LoginNameSecurity] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 11/5/2022 7:00:52 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[Contact_Fullname]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Contact_Fullname]
(
 @ContactId Integer
)
RETURNS VARCHAR(max)
BEGIN

	DECLARE	@firstName VARCHAR(max)
	DECLARE @lastName VARCHAR(max)	
	DECLARE @middleName VARCHAR(max)
	DECLARE @fullname VARCHAR(max)

	SET @fullname = NULL
	
	SELECT
		@firstName = LTRIM(RTRIM(FirstName)),
		@lastName = LTRIM(RTRIM(LastName)),
		@middleName = LTRIM(RTRIM(MiddleName))
	FROM
		Contact ( NOLOCK )
	WHERE
		ContactId  =  @contactId

	IF @@ROWCOUNT > 0
	BEGIN
		SET @fullname = ''
		IF @firstName IS NOT NULL
		BEGIN
			SET @fullname = @firstName + ' '
		END
		IF @middleName IS NOT NULL
		BEGIN
			SET @fullname = @fullname + @middleName + ' '
		END
		IF @lastName IS NOT NULL
		BEGIN
			SET @fullname = @fullname + @lastName + ' '
		END
	END		
	SET @fullname = LTRIM(RTRIM(@fullname))
	IF @fullname = ''
	BEGIN
		SET @fullname = NULL
	END
RETURN @fullname
END
GO
/****** Object:  UserDefinedFunction [dbo].[Contact_NicknameOrFullname]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Contact_NicknameOrFullname]
(
	@nickName VARCHAR(MAX),
	@fullName VARCHAR(MAX),
	@organizationName VARCHAR(MAX)
)
RETURNS VARCHAR(max)
BEGIN

	DECLARE	@nicknameOrFullName VARCHAR(max)

	SELECT 
		@nickName = LTRIM(RTRIM(@nickName)), 
		@fullName = LTRIM(RTRIM(@fullName))
		
	IF @nickName IS NOT NULL AND @nickName <> ''
		SET @nicknameOrFullName = @nickName
	ELSE IF @fullName IS NOT NULL AND @fullName <> ''
		SET @nicknameOrFullName = @fullName
	ELSE
		SET @nicknameOrFullName = @organizationName

RETURN @nicknameOrFullName
END

GO
/****** Object:  UserDefinedFunction [dbo].[Contact_Phone_Concatenate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Contact_Phone_Concatenate]
(
	@contactId Integer
)
RETURNS VARCHAR(max)
BEGIN

	DECLARE	@homePhone VARCHAR(max)
	DECLARE @mobilePhone VARCHAR(max)
	DECLARE @workPhone VARCHAR(max)
	DECLARE @pager VARCHAR(max)
	DECLARE @fax VARCHAR(max)
	DECLARE @otherPhone VARCHAR(max)

	DECLARE @phoneConcatenate VARCHAR(max)
	DECLARE @verticalBarPipeSeparator VARCHAR(1)

	SET @phoneConcatenate = ''
	SET @verticalBarPipeSeparator = '|'
	
	SELECT
		@homePhone = LTRIM(RTRIM([HomePhone])),
		@mobilePhone = LTRIM(RTRIM([MobilePhone])),
		@workPhone = LTRIM(RTRIM([WorkPhone])),
		@pager = LTRIM(RTRIM([Pager])),
		@fax = LTRIM(RTRIM([Fax])),
		@otherPhone = LTRIM(RTRIM([OtherPhone]))
	FROM
		Phone (NOLOCK)
	WHERE
		ContactId  =  @contactId
	
	IF @@ROWCOUNT > 0
	BEGIN
		IF @homePhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @homePhone + @verticalBarPipeSeparator
		END
		IF @mobilePhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @mobilePhone + @verticalBarPipeSeparator
		END
		IF @workPhone IS NOT NULL 
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @workPhone + @verticalBarPipeSeparator
		END
		IF @pager IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @pager + @verticalBarPipeSeparator
		END
		IF @fax IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @fax + @verticalBarPipeSeparator
		END
		IF @otherPhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @otherPhone + @verticalBarPipeSeparator
		END
	END
	IF @phoneConcatenate IS NOT NULL AND @phoneConcatenate != ''
	BEGIN
		SET @phoneConcatenate = LEFT(@phoneConcatenate, LEN(@phoneConcatenate) - LEN(@verticalBarPipeSeparator))
	END
	SET @phoneConcatenate = LTRIM(RTRIM(@phoneConcatenate))
	IF @phoneConcatenate = ''
	BEGIN
		SET @phoneConcatenate = NULL
	END
RETURN @phoneConcatenate
END
GO
/****** Object:  UserDefinedFunction [dbo].[Contact_PhoneNumber_Concatenate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Contact_PhoneNumber_Concatenate]
(
	@contactId Integer
)
RETURNS VARCHAR(max)
BEGIN

	DECLARE	@homePhone VARCHAR(max)
	DECLARE @mobilePhone VARCHAR(max)
	DECLARE @workPhone VARCHAR(max)
	DECLARE @pager VARCHAR(max)
	DECLARE @fax VARCHAR(max)
	DECLARE @otherPhone VARCHAR(max)

	DECLARE @phoneConcatenate VARCHAR(max)
	DECLARE @verticalBarPipeSeparator VARCHAR(1)

	SET @phoneConcatenate = ''
	SET @verticalBarPipeSeparator = '|'
	
	SELECT
		@homePhone = LTRIM(RTRIM([HomePhone])),
		@mobilePhone = LTRIM(RTRIM([MobilePhone])),
		@workPhone = LTRIM(RTRIM([WorkPhone])),
		@pager = LTRIM(RTRIM([Pager])),
		@fax = LTRIM(RTRIM([Fax])),
		@otherPhone = LTRIM(RTRIM([OtherPhone]))
	FROM
		PhoneNumber (NOLOCK)
	WHERE
		ContactId  =  @contactId
	
	IF @@ROWCOUNT > 0
	BEGIN
		IF @homePhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @homePhone + @verticalBarPipeSeparator
		END
		IF @mobilePhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @mobilePhone + @verticalBarPipeSeparator
		END
		IF @workPhone IS NOT NULL 
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @workPhone + @verticalBarPipeSeparator
		END
		IF @pager IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @pager + @verticalBarPipeSeparator
		END
		IF @fax IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @fax + @verticalBarPipeSeparator
		END
		IF @otherPhone IS NOT NULL
		BEGIN
			SET @phoneConcatenate = @phoneConcatenate + @otherPhone + @verticalBarPipeSeparator
		END
	END
	IF @phoneConcatenate IS NOT NULL AND @phoneConcatenate != ''
	BEGIN
		SET @phoneConcatenate = LEFT(@phoneConcatenate, LEN(@phoneConcatenate) - LEN(@verticalBarPipeSeparator))
	END
	SET @phoneConcatenate = LTRIM(RTRIM(@phoneConcatenate))
	IF @phoneConcatenate = ''
	BEGIN
		SET @phoneConcatenate = NULL
	END
RETURN @phoneConcatenate
END
GO
/****** Object:  UserDefinedFunction [dbo].[Contact_StreetAddress_Concatenate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Contact_StreetAddress_Concatenate]
(
	@contactId Integer,
	@informationTypeId Integer
)
RETURNS NVARCHAR(4000)
BEGIN

	DECLARE	@address NVARCHAR(1024)
	DECLARE @suburb NVARCHAR(1024)
	DECLARE @state NVARCHAR(1024)
	DECLARE @postCode NVARCHAR(1024)
	DECLARE @country NVARCHAR(1024)

	DECLARE @streetAddressConcatenate NVARCHAR(1024)
	DECLARE @commaSeparator NVARCHAR(2)
	DECLARE @spaceSeparator NVARCHAR(1)

	SET @streetAddressConcatenate = ''
	SET @commaSeparator = ', '
	SET @spaceSeparator = ' '
	
	SELECT
		@address = LTRIM(RTRIM([Address])),
		@suburb = LTRIM(RTRIM([Suburb])),
		@state = LTRIM(RTRIM([State])),
		@postCode = LTRIM(RTRIM([PostCode])),
		@country = LTRIM(RTRIM([Country]))
	FROM
		StreetAddress (NOLOCK)
	WHERE
		ContactId  =  @contactId AND
		InformationTypeId = @informationTypeId
	
	IF @@ROWCOUNT > 0
	BEGIN
		IF @address IS NOT NULL AND @address <> ''
		BEGIN
			SET @streetAddressConcatenate = @address + @commaSeparator
		END
		IF @suburb IS NOT NULL AND @suburb <> ''
		BEGIN
			SET @streetAddressConcatenate = @streetAddressConcatenate + @suburb + @commaSeparator
		END
		IF @state IS NOT NULL AND @state <> ''
		BEGIN
			SET @streetAddressConcatenate = @streetAddressConcatenate + @state + @commaSeparator
		END
		IF @postCode IS NOT NULL AND @postCode <> ''
		BEGIN
			IF @streetAddressConcatenate IS NOT NULL
			BEGIN
				SET @streetAddressConcatenate = LEFT(@streetAddressConcatenate, LEN(@streetAddressConcatenate) - LEN(@commaSeparator)) + @spaceSeparator
			END
			SET @streetAddressConcatenate = @streetAddressConcatenate + @postCode + @commaSeparator
		END
		IF @country IS NOT NULL AND @country <> ''
		BEGIN
			SET @streetAddressConcatenate = @streetAddressConcatenate + @country + @commaSeparator
		END
	END
	IF @streetAddressConcatenate IS NOT NULL AND @streetAddressConcatenate != ''
	BEGIN
		SET @streetAddressConcatenate = LEFT(@streetAddressConcatenate, LEN(@streetAddressConcatenate) - LEN(@commaSeparator))
	END
	SET @streetAddressConcatenate = LTRIM(RTRIM(@streetAddressConcatenate))
	IF @streetAddressConcatenate = ''
	BEGIN
		SET @streetAddressConcatenate = NULL
	END
RETURN @streetAddressConcatenate
END
GO
/****** Object:  UserDefinedFunction [dbo].[Contact_StreetAddress_Join]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Contact_StreetAddress_Join]
(
	@contactId Integer
)
RETURNS VARCHAR(max)
BEGIN

	DECLARE @joinSeparator VARCHAR(3)
	DECLARE @joinStreetAddress VARCHAR(MAX)
	DECLARE @organizationStreetAddress VARCHAR(MAX)
	DECLARE @personalStreetAddress VARCHAR(MAX)
	SET @joinSeparator = ' | '
	
	SET @organizationStreetAddress = dbo.Contact_StreetAddress_Concatenate(@contactId, 1)
	SET @personalStreetAddress = dbo.Contact_StreetAddress_Concatenate(@contactId, 2) 

	IF @organizationStreetAddress IS NOT NULL
	BEGIN
		SET @joinStreetAddress = @organizationStreetAddress + @joinSeparator
	END

	IF @personalStreetAddress IS NOT NULL
	BEGIN
		SET @joinStreetAddress = @joinStreetAddress + @personalStreetAddress + @joinSeparator
	END

	IF @joinStreetAddress IS NOT NULL AND @joinStreetAddress != ''
	BEGIN
		SET @joinStreetAddress = LEFT(@joinStreetAddress, LEN(@joinStreetAddress) - LEN(@joinSeparator))
		SET @joinStreetAddress = LTRIM(RTRIM(@joinStreetAddress))
	END
	IF @joinStreetAddress = ''
	BEGIN
		SET @joinStreetAddress = NULL
	END
RETURN @joinStreetAddress
END
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[LeadId] [int] NULL,
	[Birthday] [datetime] NULL,
	[Anniversary] [datetime] NULL,
	[Note] [varchar](max) NULL,
	[OrganizationName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY NONCLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ContactsList]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ContactsList]
AS
SELECT
	ASPNetDB..aspnet_Users.UserName AS Username, 
	Contact.*,
	dbo.Contact_Fullname(Contact.ContactId) AS Fullname,
	dbo.Contact_NicknameOrFullname
	(
		Nickname,
		dbo.Contact_Fullname(Contact.ContactId),
		OrganizationName
	) AS NicknameOrFullname,
	dbo.Contact_StreetAddress_Join(Contact.ContactId) AS StreetAddressJoin,
	dbo.Contact_PhoneNumber_Concatenate(Contact.ContactId) AS PhoneNumberConcatenate
FROM
	Contact (NOLOCK)
	INNER JOIN ASPNetDB..aspnet_Users ON Contact.UserId = aspnet_Users.UserId

GO
/****** Object:  Table [dbo].[Dream]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dream](
	[DreamId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Description] [varchar](max) NULL,
	[Message] [varchar](max) NULL,
	[Interpretation] [varchar](max) NULL,
 CONSTRAINT [PK_Dream] PRIMARY KEY NONCLUSTERED 
(
	[DreamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamContact]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamContact](
	[DreamContactId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[DreamId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_DreamContact] PRIMARY KEY NONCLUSTERED 
(
	[DreamContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamEvent]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamEvent](
	[DreamEventId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[DreamId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[EventTypeId] [int] NOT NULL,
 CONSTRAINT [PK_DreamEvent] PRIMARY KEY NONCLUSTERED 
(
	[DreamEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamEventType]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamEventType](
	[DreamEventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Discontinued] [bit] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_DreamEventType] PRIMARY KEY NONCLUSTERED 
(
	[DreamEventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamHistory]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamHistory](
	[DreamHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[DreamId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[ContactId] [int] NULL,
	[DreamHistoryTypeId] [int] NULL,
 CONSTRAINT [PK_DreamHistory] PRIMARY KEY NONCLUSTERED 
(
	[DreamHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamHistoryType]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamHistoryType](
	[DreamHistoryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Discontinued] [bit] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_DreamHistoryType] PRIMARY KEY NONCLUSTERED 
(
	[DreamHistoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamRole]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamRole](
	[DreamRoleId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_DreamRole] PRIMARY KEY NONCLUSTERED 
(
	[DreamRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailAddress]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailAddress](
	[EmailAddressId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ContactId] [int] NOT NULL,
	[PersonalEmail] [nvarchar](max) NULL,
	[WorkEmail] [nvarchar](max) NULL,
	[OtherEmail] [nvarchar](max) NULL,
	[PreferredEmailId] [int] NULL,
 CONSTRAINT [PK_EmailAddress] PRIMARY KEY NONCLUSTERED 
(
	[EmailAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EmailAddress_NaturalPrimaryKey] UNIQUE NONCLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationType]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationType](
	[InformationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_InformationType] PRIMARY KEY NONCLUSTERED 
(
	[InformationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[InterviewId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CoordinatorId] [int] NULL,
	[Description] [varchar](max) NULL,
	[Appointment] [datetime] NULL,
	[DatedUntil] [datetime] NULL,
	[BackgroundInfo] [varchar](max) NULL,
	[AppointmentDeliverable] [varchar](max) NULL,
 CONSTRAINT [PK_Interview] PRIMARY KEY NONCLUSTERED 
(
	[InterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviewer]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviewer](
	[InterviewerId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[InterviewId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
 CONSTRAINT [PK_Interviewer] PRIMARY KEY NONCLUSTERED 
(
	[InterviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewQuestionAnswer]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewQuestionAnswer](
	[InterviewQuestionAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[InterviewId] [int] NULL,
	[InterviewerId] [int] NULL,
	[Question] [varchar](max) NULL,
	[Answer] [varchar](max) NULL,
	[Feedback] [varchar](max) NULL,
 CONSTRAINT [PK_InterviewQuestionAnswer] PRIMARY KEY NONCLUSTERED 
(
	[InterviewQuestionAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewReference]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewReference](
	[InterviewReferenceId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[InterviewId] [int] NULL,
	[InterviewQuestionAnswerId] [int] NULL,
	[Title] [varchar](max) NULL,
	[Uri] [varchar](max) NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_InterviewReference] PRIMARY KEY NONCLUSTERED 
(
	[InterviewReferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneCall]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneCall](
	[PhoneCallId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_PhoneCall] PRIMARY KEY NONCLUSTERED 
(
	[PhoneCallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneCallParty]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneCallParty](
	[PhoneCallPartyId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[PhoneCallId] [int] NULL,
	[CallerId] [int] NULL,
	[ReceiverId] [int] NULL,
 CONSTRAINT [PK_PhoneCallParty] PRIMARY KEY NONCLUSTERED 
(
	[PhoneCallPartyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneConversation]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneConversation](
	[PhoneConversationId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[PhoneCallId] [int] NOT NULL,
	[SpeakerId] [int] NULL,
	[Statement] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PhoneConversation] PRIMARY KEY NONCLUSTERED 
(
	[PhoneConversationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumber]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumber](
	[PhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ContactId] [int] NOT NULL,
	[HomePhone] [varchar](max) NULL,
	[MobilePhone] [varchar](max) NULL,
	[WorkPhone] [varchar](max) NULL,
	[Pager] [varchar](max) NULL,
	[Fax] [varchar](max) NULL,
	[OtherPhone] [varchar](max) NULL,
 CONSTRAINT [PK_PhoneNumber] PRIMARY KEY NONCLUSTERED 
(
	[PhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferredEmail]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferredEmail](
	[PreferredEmailId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PreferredEmail] PRIMARY KEY NONCLUSTERED 
(
	[PreferredEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PreferredEmail_NaturalPrimaryKey] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StreetAddress]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreetAddress](
	[StreetAddressId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ContactId] [int] NULL,
	[InformationTypeId] [int] NULL,
	[Address] [varchar](max) NULL,
	[Suburb] [varchar](max) NULL,
	[State] [varchar](max) NULL,
	[PostCode] [varchar](max) NULL,
	[Country] [varchar](max) NULL,
 CONSTRAINT [PK_StreetAddress] PRIMARY KEY NONCLUSTERED 
(
	[StreetAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_StreetAddress_NaturalPrimaryKey] UNIQUE NONCLUSTERED 
(
	[ContactId] ASC,
	[InformationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UriAddress]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UriAddress](
	[UriAddressId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ContactId] [int] NOT NULL,
	[Website] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UriAddress] PRIMARY KEY NONCLUSTERED 
(
	[UriAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contact_Names]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Contact_Names] ON [dbo].[Contact]
(
	[FirstName] ASC,
	[MiddleName] ASC,
	[LastName] ASC,
	[NickName] ASC,
	[OrganizationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_DreamContact_NaturalPrimaryKey]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DreamContact_NaturalPrimaryKey] ON [dbo].[DreamContact]
(
	[UserId] ASC,
	[DreamId] ASC,
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DreamEventType_NaturalPrimaryKey]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DreamEventType_NaturalPrimaryKey] ON [dbo].[DreamEventType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DreamHistoryType_NaturalPrimaryKey]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DreamHistoryType_NaturalPrimaryKey] ON [dbo].[DreamHistoryType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DreamRole_NaturalPrimaryKey]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DreamRole_NaturalPrimaryKey] ON [dbo].[DreamRole]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_InformationType_NaturalPrimaryKey]    Script Date: 11/5/2022 7:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_InformationType_NaturalPrimaryKey] ON [dbo].[InformationType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [I have decided to work on a gradual improving system index]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[Dream] ADD  CONSTRAINT [DF_Dream_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamContact] ADD  CONSTRAINT [DF_DreamContact_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamEvent] ADD  CONSTRAINT [DF_DreamEvent_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamEventType] ADD  CONSTRAINT [DF_DreamEventType_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamEventType] ADD  CONSTRAINT [DF_DreamEventType_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[DreamHistory] ADD  CONSTRAINT [DF_DreamHistory_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamHistoryType] ADD  CONSTRAINT [DF_DreamHistoryType_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[DreamHistoryType] ADD  CONSTRAINT [DF_DreamHistoryType_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[DreamRole] ADD  CONSTRAINT [DF_DreamRole_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[EmailAddress] ADD  CONSTRAINT [DF_Email_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[InformationType] ADD  CONSTRAINT [DF_InformationType_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[Interview] ADD  CONSTRAINT [DF_Interview_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[Interviewer] ADD  CONSTRAINT [DF_Interviewer_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer] ADD  CONSTRAINT [DF_InterviewQuestionAnswer_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[InterviewReference] ADD  CONSTRAINT [DF_InterviewReference_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[PhoneCall] ADD  CONSTRAINT [DF_PhoneCall_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[PhoneCallParty] ADD  CONSTRAINT [DF_PhoneCallParty_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[PhoneConversation] ADD  CONSTRAINT [DF_PhoneConversation_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[PhoneNumber] ADD  CONSTRAINT [DF_Phone_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[PreferredEmail] ADD  CONSTRAINT [DF_PreferredEmail_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[StreetAddress] ADD  CONSTRAINT [DF_StreetAddress_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[UriAddress] ADD  CONSTRAINT [DF_Uri_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Lead] FOREIGN KEY([LeadId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Lead]
GO
ALTER TABLE [dbo].[DreamEvent]  WITH CHECK ADD  CONSTRAINT [FK_DreamEvent_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[DreamEvent] CHECK CONSTRAINT [FK_DreamEvent_Contact]
GO
ALTER TABLE [dbo].[DreamEvent]  WITH CHECK ADD  CONSTRAINT [FK_DreamEvent_DreamRole] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[DreamEventType] ([DreamEventTypeId])
GO
ALTER TABLE [dbo].[DreamEvent] CHECK CONSTRAINT [FK_DreamEvent_DreamRole]
GO
ALTER TABLE [dbo].[DreamHistory]  WITH CHECK ADD  CONSTRAINT [FK_DreamHistory_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[DreamHistory] CHECK CONSTRAINT [FK_DreamHistory_Contact]
GO
ALTER TABLE [dbo].[DreamHistory]  WITH CHECK ADD  CONSTRAINT [FK_DreamHistory_DreamHistoryType] FOREIGN KEY([DreamHistoryTypeId])
REFERENCES [dbo].[DreamHistoryType] ([DreamHistoryTypeId])
GO
ALTER TABLE [dbo].[DreamHistory] CHECK CONSTRAINT [FK_DreamHistory_DreamHistoryType]
GO
ALTER TABLE [dbo].[EmailAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmailAddress_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmailAddress] CHECK CONSTRAINT [FK_EmailAddress_Contact]
GO
ALTER TABLE [dbo].[EmailAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmailAddress_PreferredEmail] FOREIGN KEY([PreferredEmailId])
REFERENCES [dbo].[PreferredEmail] ([PreferredEmailId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmailAddress] CHECK CONSTRAINT [FK_EmailAddress_PreferredEmail]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [FK_Interviewer_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [FK_Interviewer_Contact]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [FK_Interviewer_Interviewer] FOREIGN KEY([InterviewerId])
REFERENCES [dbo].[Interviewer] ([InterviewerId])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [FK_Interviewer_Interviewer]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [FK_Interviewer_Interviewer1] FOREIGN KEY([InterviewerId])
REFERENCES [dbo].[Interviewer] ([InterviewerId])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [FK_Interviewer_Interviewer1]
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer] FOREIGN KEY([InterviewQuestionAnswerId])
REFERENCES [dbo].[InterviewQuestionAnswer] ([InterviewQuestionAnswerId])
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer] CHECK CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer]
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer1] FOREIGN KEY([InterviewQuestionAnswerId])
REFERENCES [dbo].[InterviewQuestionAnswer] ([InterviewQuestionAnswerId])
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer] CHECK CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer1]
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer2] FOREIGN KEY([InterviewQuestionAnswerId])
REFERENCES [dbo].[InterviewQuestionAnswer] ([InterviewQuestionAnswerId])
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer] CHECK CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer2]
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer3] FOREIGN KEY([InterviewQuestionAnswerId])
REFERENCES [dbo].[InterviewQuestionAnswer] ([InterviewQuestionAnswerId])
GO
ALTER TABLE [dbo].[InterviewQuestionAnswer] CHECK CONSTRAINT [FK_InterviewQuestionAnswer_InterviewQuestionAnswer3]
GO
ALTER TABLE [dbo].[InterviewReference]  WITH CHECK ADD  CONSTRAINT [FK_InterviewReference_Interview] FOREIGN KEY([InterviewId])
REFERENCES [dbo].[Interview] ([InterviewId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InterviewReference] CHECK CONSTRAINT [FK_InterviewReference_Interview]
GO
ALTER TABLE [dbo].[InterviewReference]  WITH CHECK ADD  CONSTRAINT [FK_InterviewReference_InterviewQuestionAnswer] FOREIGN KEY([InterviewQuestionAnswerId])
REFERENCES [dbo].[InterviewQuestionAnswer] ([InterviewQuestionAnswerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InterviewReference] CHECK CONSTRAINT [FK_InterviewReference_InterviewQuestionAnswer]
GO
ALTER TABLE [dbo].[PhoneCallParty]  WITH CHECK ADD  CONSTRAINT [FK_PhoneCallParty_Contact_Caller] FOREIGN KEY([CallerId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneCallParty] CHECK CONSTRAINT [FK_PhoneCallParty_Contact_Caller]
GO
ALTER TABLE [dbo].[PhoneCallParty]  WITH CHECK ADD  CONSTRAINT [FK_PhoneCallParty_PhoneCall] FOREIGN KEY([PhoneCallId])
REFERENCES [dbo].[PhoneCall] ([PhoneCallId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneCallParty] CHECK CONSTRAINT [FK_PhoneCallParty_PhoneCall]
GO
ALTER TABLE [dbo].[PhoneConversation]  WITH CHECK ADD  CONSTRAINT [FK_PhoneConversation_PhoneCall] FOREIGN KEY([PhoneCallId])
REFERENCES [dbo].[PhoneCall] ([PhoneCallId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneConversation] CHECK CONSTRAINT [FK_PhoneConversation_PhoneCall]
GO
ALTER TABLE [dbo].[PhoneConversation]  WITH CHECK ADD  CONSTRAINT [FK_PhoneConversation_Speaker] FOREIGN KEY([SpeakerId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneConversation] CHECK CONSTRAINT [FK_PhoneConversation_Speaker]
GO
ALTER TABLE [dbo].[PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[PhoneNumber] CHECK CONSTRAINT [FK_Phone_Contact]
GO
ALTER TABLE [dbo].[StreetAddress]  WITH CHECK ADD  CONSTRAINT [FK_StreetAddress_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StreetAddress] CHECK CONSTRAINT [FK_StreetAddress_Contact]
GO
ALTER TABLE [dbo].[StreetAddress]  WITH CHECK ADD  CONSTRAINT [FK_StreetAddress_InformationType] FOREIGN KEY([InformationTypeId])
REFERENCES [dbo].[InformationType] ([InformationTypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StreetAddress] CHECK CONSTRAINT [FK_StreetAddress_InformationType]
GO
ALTER TABLE [dbo].[UriAddress]  WITH CHECK ADD  CONSTRAINT [FK_Uri_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[UriAddress] CHECK CONSTRAINT [FK_Uri_Contact]
GO
/****** Object:  StoredProcedure [dbo].[ContactDelete]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ContactDelete]
@contactId INT
AS
BEGIN
	DELETE FROM Contact WHERE ContactId = @contactId
END
GO
/****** Object:  StoredProcedure [dbo].[ContactInsertUpdate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ContactInsertUpdate]
	@contactId INTEGER = NULL OUTPUT,
	@userId UNIQUEIDENTIFIER = NULL,
	@firstName NVARCHAR(MAX) = NULL,
	@middleName NVARCHAR(MAX) = NULL,
	@lastName NVARCHAR(MAX) = NULL,
	@nickName NVARCHAR(MAX) = NULL,
	@birthDay DATETIME = NULL,
	@anniversary DATETIME = NULL,
	@note NVARCHAR(MAX) = NULL,
	@organizationName NVARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	IF @contactId IS NULL
	BEGIN
		INSERT INTO Contact
		(
			userId,
			firstName,
			middleName,
			lastName,
			nickName,
			birthDay,
			anniversary,
			note,
			OrganizationName
		)
		VALUES
		(
			@userId,
			@firstName,
			@middleName,
			@lastName,
			@nickName,
			@birthDay,
			@anniversary,
			@note,
			@organizationName
		)
		IF @@ROWCOUNT = 1
		BEGIN
			SET @contactId = SCOPE_IDENTITY()
		END
	END
	ELSE
	BEGIN
		UPDATE Contact SET
			firstName = @firstName,
			middleName = @middleName,
			lastName = @lastName,
			nickName = @nickName,
			birthDay = @birthDay,
			--anniversary = @anniversary,
			note = @note,
			OrganizationName = @OrganizationName
		WHERE
			ContactId = @contactId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ContactsList]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ContactsList]
@loginName VARCHAR(max) = NULL,
@whereClause VARCHAR(max) = NULL
AS
SET NOCOUNT ON
DECLARE @empty NVARCHAR(4)
DECLARE @concatenateSeparator NVARCHAR(10)
DECLARE @contactIdJoin NVARCHAR(max)
DECLARE @joinSeparator NVARCHAR(2)
DECLARE @parameterDefinition NVARCHAR(500)
DECLARE @sqlStatementContactIdCollection NVARCHAR(max)

SET @contactIdJoin = NULL
SET @empty = ''''
SET @joinSeparator = ', '
SET @parameterDefinition =	N'@contactIdJoin nvarchar(max) OUTPUT, ' +
							N'@joinSeparator nvarchar(2)'

SET @sqlStatementContactIdCollection = 'SELECT @contactIdJoin = '
	+ 'COALESCE(@contactIdJoin + @joinSeparator, ' + @empty + @empty + ') + ' +
	' CONVERT(VARCHAR, ContactId) ' + 
	' FROM vw_ContactsList ' +
	' WHERE UserName = ' + @empty + @loginName + @empty

IF @whereClause IS NOT NULL
BEGIN
	SET @sqlStatementContactIdCollection = @sqlStatementContactIdCollection + ' AND ( ' + @whereClause + ' ) '
END

EXECUTE sp_executesql 
	@sqlStatementContactIdCollection,
	@parameterDefinition,
	@contactIdJoin OUTPUT,
	@joinSeparator

IF @@ROWCOUNT = 0 RETURN

DECLARE @sqlStatementContact AS NVARCHAR(max)
SET @sqlStatementContact = 'SELECT * FROM vw_ContactsList ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
SET @sqlStatementContact = @sqlStatementContact + ' ORDER BY NicknameOrFullname '
EXECUTE sp_executesql @sqlStatementContact

DECLARE @sqlStatementEmailAddress AS NVARCHAR(max)
SET @sqlStatementEmailAddress = 'SELECT * FROM EmailAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementEmailAddress

DECLARE @sqlStatementPhoneNumber AS NVARCHAR(max)
SET @sqlStatementPhoneNumber = 'SELECT * FROM PhoneNumber ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementPhoneNumber

DECLARE @sqlStatementPersonalStreetAddress AS NVARCHAR(max)
SET @sqlStatementPersonalStreetAddress = 'SELECT *, ' + 
	'dbo.Contact_StreetAddress_Concatenate(ContactId, InformationTypeId) AS StreetAddressConcatenate ' +
	'FROM StreetAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ') AND InformationTypeId = 2'
EXECUTE sp_executesql @sqlStatementPersonalStreetAddress

DECLARE @sqlStatementBusinessStreetAddress AS NVARCHAR(max)
SET @sqlStatementBusinessStreetAddress = 'SELECT *, ' + 
	'dbo.Contact_StreetAddress_Concatenate(ContactId, InformationTypeId) AS StreetAddressConcatenate ' +
	'FROM StreetAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ') AND InformationTypeId = 1'
EXECUTE sp_executesql @sqlStatementBusinessStreetAddress

DECLARE @sqlStatementUriAddress AS NVARCHAR(max)
SET @sqlStatementUriAddress = 'SELECT * FROM UriAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementUriAddress



GO
/****** Object:  StoredProcedure [dbo].[ContactsList_v2]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
CREATE PROC [dbo].[ContactsList_v2]
as
	select 1

*/
	
CREATE PROCEDURE [dbo].[ContactsList_v2]
@loginName VARCHAR(max) = NULL,
@whereClause VARCHAR(max) = NULL
AS
SET NOCOUNT ON
DECLARE @empty NVARCHAR(4)
DECLARE @concatenateSeparator NVARCHAR(10)
DECLARE @contactIdJoin NVARCHAR(max)
DECLARE @joinSeparator NVARCHAR(2)
DECLARE @parameterDefinition NVARCHAR(500)
DECLARE @sqlStatementContactIdCollection NVARCHAR(max)

DECLARE @whereClauseWildCard varchar(max)

set @whereClauseWildCard = '%' + @whereClause + '%'

select *
from   vw_ContactsList 
where  UserName = @LoginName
and    (
			   ([FirstName] like @whereClauseWildCard)
			or ([LastName] like @whereClauseWildCard)			
			or ([NickName] like @whereClauseWildCard)						
	    )
/*
SET @contactIdJoin = NULL
SET @empty = ''''
SET @joinSeparator = ', '
SET @parameterDefinition =	N'@contactIdJoin nvarchar(max) OUTPUT, ' +
							N'@joinSeparator nvarchar(2)'

SET @sqlStatementContactIdCollection = 'SELECT @contactIdJoin = '
	+ 'COALESCE(@contactIdJoin + @joinSeparator, ' + @empty + @empty + ') + ' +
	' CONVERT(VARCHAR, ContactId) ' + 
	' FROM vw_ContactsList ' +
	' WHERE UserName = ' + @empty + @loginName + @empty

print '@sqlStatementContactIdCollection:' + isNull(@sqlStatementContactIdCollection, '')

IF @whereClause IS NOT NULL
BEGIN
	SET @sqlStatementContactIdCollection = @sqlStatementContactIdCollection + ' AND ( ' + @whereClause + ' ) '
END

EXECUTE sp_executesql 
	@sqlStatementContactIdCollection,
	@parameterDefinition,
	@contactIdJoin OUTPUT,
	@joinSeparator

IF @@ROWCOUNT = 0 RETURN

DECLARE @sqlStatementContact AS NVARCHAR(max)
SET @sqlStatementContact = 'SELECT * FROM vw_ContactsList ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
SET @sqlStatementContact = @sqlStatementContact + ' ORDER BY NicknameOrFullname '
EXECUTE sp_executesql @sqlStatementContact

DECLARE @sqlStatementEmailAddress AS NVARCHAR(max)
SET @sqlStatementEmailAddress = 'SELECT * FROM EmailAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementEmailAddress

DECLARE @sqlStatementPhoneNumber AS NVARCHAR(max)
SET @sqlStatementPhoneNumber = 'SELECT * FROM PhoneNumber ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementPhoneNumber

DECLARE @sqlStatementPersonalStreetAddress AS NVARCHAR(max)
SET @sqlStatementPersonalStreetAddress = 'SELECT *, ' + 
	'dbo.Contact_StreetAddress_Concatenate(ContactId, InformationTypeId) AS StreetAddressConcatenate ' +
	'FROM StreetAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ') AND InformationTypeId = 2'
EXECUTE sp_executesql @sqlStatementPersonalStreetAddress

DECLARE @sqlStatementBusinessStreetAddress AS NVARCHAR(max)
SET @sqlStatementBusinessStreetAddress = 'SELECT *, ' + 
	'dbo.Contact_StreetAddress_Concatenate(ContactId, InformationTypeId) AS StreetAddressConcatenate ' +
	'FROM StreetAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ') AND InformationTypeId = 1'
EXECUTE sp_executesql @sqlStatementBusinessStreetAddress

DECLARE @sqlStatementUriAddress AS NVARCHAR(max)
SET @sqlStatementUriAddress = 'SELECT * FROM UriAddress ' +
	'WHERE ContactId IN (' + @contactIdJoin + ')'
EXECUTE sp_executesql @sqlStatementUriAddress

*/

GO
/****** Object:  StoredProcedure [dbo].[ContactsReport]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ContactsReport]
AS
SELECT
	Contact.ContactId,
	dbo.Contact_Fullname(Contact.ContactId) AS ContactFullname,
	Contact.NickName AS Nickname,
	Organization.OrganizationName AS OrganizationName,
	Organization.Title AS Title,
	EmailAddress.PersonalEmail,
	EmailAddress.WorkEmail,
	EmailAddress.OtherEmail,
	PhoneNumber.HomePhone,
	PhoneNumber.MobilePhone,
	PhoneNumber.WorkPhone,
	PhoneNumber.Pager,
	PhoneNumber.Fax,
	PhoneNumber.OtherPhone,
	dbo.Contact_StreetAddress_Concatenate(Contact.ContactId, StreetAddress.InformationTypeId) AS StreetAddress
FROM
	Contact
LEFT OUTER JOIN Organization ON Contact.ContactId = Organization.ContactId
LEFT OUTER JOIN EmailAddress ON Contact.ContactId = EmailAddress.ContactId
LEFT OUTER JOIN PhoneNumber ON Contact.ContactId = PhoneNumber.ContactId
LEFT OUTER JOIN StreetAddress ON Contact.ContactId = StreetAddress.ContactId
ORDER BY
	dbo.Contact_Fullname(Contact.ContactId)
GO
/****** Object:  StoredProcedure [dbo].[EmailAddressInsertUpdate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmailAddressInsertUpdate]
	@emailAddressId INTEGER = NULL OUTPUT,
	@contactId INTEGER,
	@personalEmail VARCHAR(MAX) = NULL,
	@workEmail VARCHAR(MAX) = NULL,
	@otherEmail VARCHAR(MAX) = NULL,
	@preferredEmailId INTEGER = NULL
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @empty BIT
	SELECT
		@personalEmail = LTRIM(RTRIM(@personalEmail)),
		@workEmail = LTRIM(RTRIM(@workEmail)),
		@otherEmail = LTRIM(RTRIM(@otherEmail))
	IF	(@personalEmail IS NULL OR @personalEmail = '') AND
		(@workEmail IS NULL OR @workEmail = '') AND
		(@otherEmail IS NULL OR @otherEmail = '')
		SET @empty = 1
	ELSE
		SET @empty = 0
	IF NOT EXISTS( SELECT 1 FROM EmailAddress WHERE ContactId = @contactId )
	BEGIN
		IF @empty = 1
			RETURN
		INSERT INTO EmailAddress
		(
			contactId,
			personalEmail,
			workEmail,
			otherEmail,
			preferredEmailId
		)
		VALUES
		(
			@contactId,
			@personalEmail,
			@workEmail,
			@otherEmail,
			@preferredEmailId
		)
		IF @@ROWCOUNT = 1
			SET @emailAddressId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		IF @empty = 0
			UPDATE EmailAddress
				SET
					personalEmail = @personalEmail,
					workEmail = @workEmail,
					otherEmail = @otherEmail,
					preferredEmailId = @preferredEmailId
				WHERE ContactId = @contactId
		ELSE
			DELETE EmailAddress WHERE ContactId = @contactId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PhoneNumberInsertUpdate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PhoneNumberInsertUpdate]
	@phoneNumberId INTEGER = NULL OUTPUT,
	@contactId INTEGER,
	@homePhone VARCHAR(MAX) = NULL,
	@mobilePhone VARCHAR(MAX) = NULL,
	@workPhone VARCHAR(MAX) = NULL,
	@pager VARCHAR(MAX) = NULL,
	@fax VARCHAR(MAX) = NULL,
	@otherPhone VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @empty BIT
	SELECT
		@homePhone = LTRIM(RTRIM(@homePhone)),
		@mobilePhone = LTRIM(RTRIM(@mobilePhone)),
		@workPhone = LTRIM(RTRIM(@workPhone)),
		@pager = LTRIM(RTRIM(@pager)),
		@fax = LTRIM(RTRIM(@fax)),
		@otherPhone = LTRIM(RTRIM(@otherPhone))
	IF	(@homePhone IS NULL OR @homePhone = '') AND
		(@mobilePhone IS NULL OR @mobilePhone = '') AND
		(@workPhone IS NULL OR @workPhone = '') AND
		(@pager IS NULL OR @pager = '') AND
		(@fax IS NULL OR @fax = '') AND
		(@otherPhone IS NULL OR @otherPhone = '')
		SET @empty = 1
	ELSE
		SET @empty = 0
	IF NOT EXISTS( SELECT 1 FROM PhoneNumber WHERE ContactId = @contactId )
	BEGIN
		IF @empty = 1
			RETURN
		INSERT INTO PhoneNumber
		(
			contactId,
			homePhone,
			mobilePhone,
			workPhone,
			pager,
			fax,
			otherPhone
		)
		VALUES
		(
			@contactId,
			@homePhone,
			@mobilePhone,
			@workPhone,
			@pager,
			@fax,
			@otherPhone
		)
		IF @@ROWCOUNT = 1
			SET @phoneNumberId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		IF @empty = 0
			UPDATE PhoneNumber
				SET
					homePhone = @homePhone,
					mobilePhone = @mobilePhone,
					workPhone = @workPhone,
					pager = @pager,
					fax = @fax,
					otherPhone = @otherPhone
				WHERE ContactId = @contactId
		ELSE
			DELETE FROM PhoneNumber WHERE ContactId = @contactId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[StreetAddressInsertUpdate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StreetAddressInsertUpdate]
	@streetAddressId INTEGER = NULL OUTPUT,
	@contactId INTEGER,
	@informationTypeId INT,
	@address VARCHAR(MAX) = NULL,
	@suburb VARCHAR(MAX) = NULL,
	@state VARCHAR(MAX) = NULL,
	@postCode VARCHAR(MAX) = NULL,
	@country VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @empty BIT
	SELECT
		@address = LTRIM(RTRIM(@address)),
		@suburb = LTRIM(RTRIM(@suburb)),
		@state = LTRIM(RTRIM(@state)),
		@postCode = LTRIM(RTRIM(@postCode)),
		@country = LTRIM(RTRIM(@country))
	IF	(@address IS NULL OR @address = '') AND
		(@suburb IS NULL OR @suburb = '') AND
		(@state IS NULL OR @state = '') AND
		(@postCode IS NULL OR @postCode = '') AND
		(@country IS NULL OR @country = '')
		SET @empty = 1
	ELSE
		SET @empty = 0
	IF NOT EXISTS( SELECT 1 FROM StreetAddress WHERE ContactId = @contactId AND InformationTypeId = @informationTypeId)
	BEGIN
		IF	@empty = 1
			RETURN
		INSERT INTO StreetAddress
		(
			contactId,
			informationTypeId,
			address,
			suburb,
			state,
			postCode,
			country
		)
		VALUES
		(
			@contactId,
			@informationTypeId,
			@address,
			@suburb,
			@state,
			@postCode,
			@country
		)
		IF @@ROWCOUNT = 1
			SET @streetAddressId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		IF @empty = 0
			UPDATE StreetAddress
				SET
					address = @address,
					suburb = @suburb,
					state = @state,
					postCode = @postCode,
					country = @country
				WHERE ContactId = @contactId AND InformationTypeId = @informationTypeId
		ELSE
			DELETE StreetAddress 
				WHERE ContactId = @contactId AND InformationTypeId = @informationTypeId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UriAddressInsertUpdate]    Script Date: 11/5/2022 7:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UriAddressInsertUpdate]
	@uriAddressId INTEGER = NULL OUTPUT,
	@contactId INTEGER,
	@website VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @empty BIT
	SET @website = LTRIM(RTRIM(@website))
	IF @website IS NULL OR @website = ''
		SET @empty = 1
	ELSE
		SET @empty = 0
	IF NOT EXISTS( SELECT 1 FROM UriAddress WHERE ContactId = @contactId)
	BEGIN
		IF @empty = 1
			RETURN
		INSERT INTO UriAddress
		(
			contactId,
			website
		)
		VALUES
		(
			@contactId,
			@website
		)
		IF @@ROWCOUNT = 1
			SET @uriAddressId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		IF @empty = 0
			UPDATE UriAddress 
				SET website = @website 
				WHERE ContactId = @contactId
		ELSE
			DELETE FROM UriAddress WHERE ContactId = @contactId
	END
END
GO
USE [master]
GO
ALTER DATABASE [IHaveDecidedToWorkOnAGradualImprovingSystem] SET  READ_WRITE 
GO
