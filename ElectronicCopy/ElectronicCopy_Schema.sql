USE [master]
GO
/****** Object:  Database [ElectronicCopy]    Script Date: 2/1/2023 2:33:18 PM ******/
CREATE DATABASE [ElectronicCopy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectronicCopy_Data', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyData.MDF' , SIZE = 3008KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ElectronicCopy_Image_FileGroup] 
( NAME = N'ElectronicCopy_Image', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ElectronicCopy_Index_FileGroup] 
( NAME = N'ElectronicCopy_Index', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ElectronicCopy_Text_FileGroup] 
( NAME = N'ElectronicCopy_Text', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ElectronicCopy_Xml_FileGroup] 
( NAME = N'ElectronicCopy_Xml', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'ElectronicCopy_Log', FILENAME = N'E:\SQLServerDataFiles\ElectronicCopy\ElectronicCopyLog.LDF' , SIZE = 3328KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ElectronicCopy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicCopy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicCopy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectronicCopy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectronicCopy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectronicCopy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectronicCopy] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectronicCopy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectronicCopy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectronicCopy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicCopy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectronicCopy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectronicCopy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectronicCopy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectronicCopy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectronicCopy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectronicCopy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectronicCopy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectronicCopy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectronicCopy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectronicCopy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectronicCopy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectronicCopy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectronicCopy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectronicCopy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElectronicCopy] SET  MULTI_USER 
GO
ALTER DATABASE [ElectronicCopy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectronicCopy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectronicCopy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectronicCopy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ElectronicCopy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectronicCopy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ElectronicCopy] SET QUERY_STORE = OFF
GO
USE [ElectronicCopy]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/1/2023 2:33:19 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[ContactImage]    Script Date: 2/1/2023 2:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactImage](
	[TheWordId] [int] NULL,
	[ContactID] [int] NOT NULL,
	[ContactImageID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ImageSource] [varchar](255) NOT NULL,
	[ImageType] [varchar](50) NOT NULL,
	[ImageContent] [varbinary](max) NULL
) ON [ElectronicCopy_Image_FileGroup] TEXTIMAGE_ON [ElectronicCopy_Image_FileGroup]
GO
/****** Object:  Index [IDX_ContactImage_ContactId]    Script Date: 2/1/2023 2:33:19 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ContactImage_ContactId] ON [dbo].[ContactImage]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ElectronicCopy_Index_FileGroup]
GO
ALTER TABLE [dbo].[ContactImage] ADD  CONSTRAINT [DF_ContactImage_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
/****** Object:  StoredProcedure [dbo].[uspContactImageUpdate]    Script Date: 2/1/2023 2:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspContactImageUpdate]
 @contactImageID  INT             =  NULL,
 @dated            DATETIME        =  NULL,
 @contactId        INT             =  NULL,
 @imageContent     IMAGE           =  NULL,
 @imageSource      VARCHAR(255)    =  NULL,
 @imageType        VARCHAR(50)     =  NULL
AS
BEGIN
 --EXEC xp_logevent 60000, @imageSource, informational
 IF @contactImageID < 1
 BEGIN
  SET @contactImageID = NULL
 END
 IF @dated IS NULL
 BEGIN
  SET @dated = GETDATE()
 END
 SELECT 1 FROM ContactImage WHERE contactImageID = @contactImageID
 IF @@ROWCOUNT = 1
 BEGIN
  IF @imageContent IS NULL
  BEGIN
   UPDATE ContactImage SET
    dated         =  @dated,
    imageSource   =  @imageSource,
    imageType     =  @imageType 
   WHERE
    contactImageID = @contactImageID
  END 
  ELSE
  BEGIN
   UPDATE ContactImage SET
    dated         =  @dated,
    imageContent  =  @imageContent,
    imageSource   =  @imageSource,
    imageType     =  @imageType 
   WHERE
    contactImageID = @contactImageID
  END
 END
 ELSE IF @contactImageID IS NOT NULL AND @contactImageID > 0
 BEGIN
  SET IDENTITY_INSERT ContactImage ON
  INSERT ContactImage
  (
   contactImageID,
   dated,
   contactId,
   imageContent,
   imageSource,
   imageType
  )
  VALUES
  (
   @contactImageID,
   @dated,
   @contactId,
   @imageContent,
   @imageSource,
   @imageType
  )
  SET IDENTITY_INSERT ContactImage OFF
 END
 ELSE
 BEGIN
  INSERT ContactImage
  (
   dated,
   contactId,
   imageContent,
   imageSource,
   imageType
  )
  VALUES
  (
   @dated,
   @contactId,
   @imageContent,
   @imageSource,
   @imageType
  )
 END
END

GO
USE [master]
GO
ALTER DATABASE [ElectronicCopy] SET  READ_WRITE 
GO
