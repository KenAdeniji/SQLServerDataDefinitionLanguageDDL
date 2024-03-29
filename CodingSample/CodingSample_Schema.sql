USE [master]
GO
/****** Object:  Database [CodingSample]    Script Date: 2/1/2023 2:28:30 PM ******/
CREATE DATABASE [CodingSample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodingSample_Data', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleData.MDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [CodingSample_Image_FileGroup] 
( NAME = N'CodingSample_Image', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [CodingSample_Index_FileGroup] 
( NAME = N'CodingSample_Index', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [CodingSample_Text_FileGroup] 
( NAME = N'CodingSample_Text', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [CodingSample_Xml_FileGroup] 
( NAME = N'CodingSample_Xml', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'CodingSample_Log', FILENAME = N'E:\SQLServerDataFiles\CodingSample\CodingSampleLog.LDF' , SIZE = 38976KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CodingSample] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodingSample].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodingSample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodingSample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodingSample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodingSample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodingSample] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodingSample] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodingSample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodingSample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodingSample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodingSample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodingSample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodingSample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodingSample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodingSample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodingSample] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CodingSample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodingSample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodingSample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodingSample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodingSample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodingSample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodingSample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodingSample] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CodingSample] SET  MULTI_USER 
GO
ALTER DATABASE [CodingSample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodingSample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodingSample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodingSample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CodingSample] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CodingSample] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CodingSample] SET QUERY_STORE = OFF
GO
USE [CodingSample]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/1/2023 2:28:30 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[GoCount]    Script Date: 2/1/2023 2:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoCount](
	[AutoIncrement] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionAndAnswer]    Script Date: 2/1/2023 2:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAndAnswer](
	[QuestionAndAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Language] [varchar](255) NULL,
	[Code] [varchar](8000) NOT NULL,
	[Commentary] [varchar](8000) NULL,
	[Uri] [varchar](255) NULL,
 CONSTRAINT [PK_QuestionAndAnswer] PRIMARY KEY CLUSTERED 
(
	[QuestionAndAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GoCount] ADD  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[QuestionAndAnswer] ADD  CONSTRAINT [DF_QuestionAndAnswer_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
USE [master]
GO
ALTER DATABASE [CodingSample] SET  READ_WRITE 
GO
