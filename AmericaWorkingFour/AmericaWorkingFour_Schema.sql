USE [master]
GO
/****** Object:  Database [AmericaWorkingFour]    Script Date: 2/1/2023 1:26:47 PM ******/
CREATE DATABASE [AmericaWorkingFour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AmericaWorkingFour_Data', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourData.MDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AmericaWorkingFour_Image_FileGroup] 
( NAME = N'AmericaWorkingFour_Image', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AmericaWorkingFour_Index_FileGroup] 
( NAME = N'AmericaWorkingFour_Index', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AmericaWorkingFour_Text_FileGroup] 
( NAME = N'AmericaWorkingFour_Text', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [AmericaWorkingFour_Xml_FileGroup] 
( NAME = N'AmericaWorkingFour_Xml', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'AmericaWorkingFour_Log', FILENAME = N'E:\SQLServerDataFiles\AmericaWorkingFour\AmericaWorkingFourLog.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AmericaWorkingFour] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AmericaWorkingFour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AmericaWorkingFour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET ARITHABORT OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AmericaWorkingFour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AmericaWorkingFour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AmericaWorkingFour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET TRUSTWORTHY ON 
GO
ALTER DATABASE [AmericaWorkingFour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AmericaWorkingFour] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AmericaWorkingFour] SET  MULTI_USER 
GO
ALTER DATABASE [AmericaWorkingFour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AmericaWorkingFour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AmericaWorkingFour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AmericaWorkingFour] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AmericaWorkingFour] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AmericaWorkingFour] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AmericaWorkingFour] SET QUERY_STORE = OFF
GO
USE [AmericaWorkingFour]
GO
/****** Object:  User [ephwebuser]    Script Date: 2/1/2023 1:26:47 PM ******/
CREATE USER [ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ephwebuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephwebuser]
GO
/****** Object:  Table [dbo].[BibleBook]    Script Date: 2/1/2023 1:26:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibleBook](
	[BookID] [int] NOT NULL,
	[BookTitle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BibleBook] PRIMARY KEY NONCLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BibleBook_BookTitle] UNIQUE NONCLUSTERED 
(
	[BookTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [AmericaWorkingFour] SET  READ_WRITE 
GO
