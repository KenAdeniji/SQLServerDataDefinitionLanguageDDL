USE [master]
GO
/****** Object:  Database [UsualPassage]    Script Date: 3/3/2018 8:40:59 AM ******/
CREATE DATABASE [UsualPassage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UsualPassage_Data', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageData.MDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UsualPassage_Image_FileGroup] 
( NAME = N'UsualPassage_Image', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [UsualPassage_Index_FileGroup] 
( NAME = N'UsualPassage_Index', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UsualPassage_Text_FileGroup] 
( NAME = N'UsualPassage_Text', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UsualPassage_Xml_FileGroup] 
( NAME = N'UsualPassage_Xml', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'UsualPassage_Log', FILENAME = N'E:\SQLServerDataFiles\UsualPassage\UsualPassageLog.LDF' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
GO
ALTER DATABASE [UsualPassage] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UsualPassage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UsualPassage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UsualPassage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UsualPassage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UsualPassage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UsualPassage] SET ARITHABORT OFF 
GO
ALTER DATABASE [UsualPassage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UsualPassage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UsualPassage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UsualPassage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UsualPassage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UsualPassage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UsualPassage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UsualPassage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UsualPassage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UsualPassage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UsualPassage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UsualPassage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UsualPassage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UsualPassage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UsualPassage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UsualPassage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UsualPassage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UsualPassage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UsualPassage] SET  MULTI_USER 
GO
ALTER DATABASE [UsualPassage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UsualPassage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UsualPassage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UsualPassage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UsualPassage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UsualPassage]
GO
/****** Object:  Table [dbo].[Passage]    Script Date: 3/3/2018 8:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Passage](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime2](7) NOT NULL CONSTRAINT [DF_Passage_Dated]  DEFAULT (getdate()),
	[email] [varchar](256) NOT NULL,
	[URI] [nvarchar](1024) NULL,
	[ScriptureReference] [varchar](max) NULL,
	[Title] [varchar](max) NULL,
	[Commentary] [varchar](max) NULL,
	[Keyword] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Passage] ON 

INSERT [dbo].[Passage] ([SequenceOrderId], [Dated], [email], [URI], [ScriptureReference], [Title], [Commentary], [Keyword]) VALUES (1, CAST(N'2018-02-27 00:00:00.0000000' AS DateTime2), N'KenAdeniji@hotmail.com', N'http://KenAdeniji.WordPress.com', N'Genesis 22, Daniel 9, Hebrews 11', N'70 Weeks of Daniel', N'What is clearly ...', N'prophecy')
INSERT [dbo].[Passage] ([SequenceOrderId], [Dated], [email], [URI], [ScriptureReference], [Title], [Commentary], [Keyword]) VALUES (2, CAST(N'2018-02-28 00:00:00.0000000' AS DateTime2), N'', N'', N'', N'', N'
								', N'')
INSERT [dbo].[Passage] ([SequenceOrderId], [Dated], [email], [URI], [ScriptureReference], [Title], [Commentary], [Keyword]) VALUES (4, CAST(N'2018-02-28 00:00:00.0000000' AS DateTime2), N'KenAdeniji@hotmail.com', N'', N'Isaiah 53', N'The Holy of Holies', N'Commentary
								', N'')
INSERT [dbo].[Passage] ([SequenceOrderId], [Dated], [email], [URI], [ScriptureReference], [Title], [Commentary], [Keyword]) VALUES (6, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), N'KenAdeniji@hotmail.com', N'KenAdeniji.WordPress.com', N'Genesis 22', N'Akedah', N'sssss
								', N'Passover')
SET IDENTITY_INSERT [dbo].[Passage] OFF
/****** Object:  Index [PK_Passage]    Script Date: 3/3/2018 8:40:59 AM ******/
ALTER TABLE [dbo].[Passage] ADD  CONSTRAINT [PK_Passage] PRIMARY KEY NONCLUSTERED 
(
	[Dated] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UsualPassage] SET  READ_WRITE 
GO
