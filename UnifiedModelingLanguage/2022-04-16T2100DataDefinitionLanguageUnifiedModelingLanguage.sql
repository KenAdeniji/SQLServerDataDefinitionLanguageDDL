USE [master]
GO
/****** Object:  Database [UnifiedModelingLanguage]    Script Date: 4/16/2022 9:49:24 PM ******/
CREATE DATABASE [UnifiedModelingLanguage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnifiedModelingLanguage_Data', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageData.MDF' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Image_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Image', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [UnifiedModelingLanguage_Index_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Index', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Text_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Text', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Xml_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Xml', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'UnifiedModelingLanguage_Log', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageLog.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UnifiedModelingLanguage] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnifiedModelingLanguage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET RECOVERY FULL 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET  MULTI_USER 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UnifiedModelingLanguage] SET QUERY_STORE = OFF
GO
USE [UnifiedModelingLanguage]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 4/16/2022 9:49:24 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 4/16/2022 9:49:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[ActorName] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActorTitles]    Script Date: 4/16/2022 9:49:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorTitles](
	[ActorTitleID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[ActorID] [int] NULL,
	[ActorTitle] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCases]    Script Date: 4/16/2022 9:49:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCases](
	[UseCaseID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[UseCaseTitle] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([ActorID], [Dated], [ScriptureReference], [ActorName], [Commentary], [Uri], [ContactId]) VALUES (1, CAST(N'2021-06-18T13:31:57.573' AS DateTime), N'Genesis 1:1', N'God', NULL, NULL, NULL)
INSERT [dbo].[Actors] ([ActorID], [Dated], [ScriptureReference], [ActorName], [Commentary], [Uri], [ContactId]) VALUES (2, CAST(N'2021-06-18T13:35:28.143' AS DateTime), N'Genesis 2:19', N'Adam', NULL, NULL, NULL)
INSERT [dbo].[Actors] ([ActorID], [Dated], [ScriptureReference], [ActorName], [Commentary], [Uri], [ContactId]) VALUES (3, CAST(N'2021-06-18T13:37:14.533' AS DateTime), N'Genesis 3:20', N'Eve', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[ActorTitles] ON 

INSERT [dbo].[ActorTitles] ([ActorTitleID], [Dated], [ScriptureReference], [ActorID], [ActorTitle], [Commentary], [Uri], [ContactId]) VALUES (1, CAST(N'2021-06-18T13:52:25.420' AS DateTime), N'1 Corinthians 15:45', 2, N'First man', NULL, NULL, NULL)
INSERT [dbo].[ActorTitles] ([ActorTitleID], [Dated], [ScriptureReference], [ActorID], [ActorTitle], [Commentary], [Uri], [ContactId]) VALUES (2, CAST(N'2021-06-18T13:54:23.850' AS DateTime), N'Genesis 3:20', 3, N'Eve', N'mother of all living.', NULL, NULL)
INSERT [dbo].[ActorTitles] ([ActorTitleID], [Dated], [ScriptureReference], [ActorID], [ActorTitle], [Commentary], [Uri], [ContactId]) VALUES (3, CAST(N'2021-06-18T13:58:13.127' AS DateTime), N'Genesis 2:23', 3, N'Woman', N'because she was taken out of Man.', NULL, NULL)
INSERT [dbo].[ActorTitles] ([ActorTitleID], [Dated], [ScriptureReference], [ActorID], [ActorTitle], [Commentary], [Uri], [ContactId]) VALUES (4, CAST(N'2021-06-18T14:02:58.290' AS DateTime), N'Genesis 2:7', 2, N'Adam', N'dust of the ground', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActorTitles] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCases] ON 

INSERT [dbo].[UseCases] ([UseCaseID], [Dated], [ScriptureReference], [UseCaseTitle], [Commentary], [Uri], [ContactId]) VALUES (1, CAST(N'2021-06-18T13:07:56.490' AS DateTime), N'Genesis 1', N'Creation', NULL, NULL, NULL)
INSERT [dbo].[UseCases] ([UseCaseID], [Dated], [ScriptureReference], [UseCaseTitle], [Commentary], [Uri], [ContactId]) VALUES (2, CAST(N'2021-06-18T13:14:06.447' AS DateTime), N'Genesis 3', N'Fall of Man', NULL, NULL, NULL)
INSERT [dbo].[UseCases] ([UseCaseID], [Dated], [ScriptureReference], [UseCaseTitle], [Commentary], [Uri], [ContactId]) VALUES (3, CAST(N'2021-06-18T13:14:24.747' AS DateTime), N'Genesis 4', N'Cain and Abel', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UseCases] OFF
GO
/****** Object:  Index [PK_Actor]    Script Date: 4/16/2022 9:49:52 PM ******/
ALTER TABLE [dbo].[Actors] ADD  CONSTRAINT [PK_Actor] PRIMARY KEY NONCLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_ActorTitle]    Script Date: 4/16/2022 9:49:52 PM ******/
ALTER TABLE [dbo].[ActorTitles] ADD  CONSTRAINT [PK_ActorTitle] PRIMARY KEY NONCLUSTERED 
(
	[ActorTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_UseCase]    Script Date: 4/16/2022 9:49:52 PM ******/
ALTER TABLE [dbo].[UseCases] ADD  CONSTRAINT [PK_UseCase] PRIMARY KEY NONCLUSTERED 
(
	[UseCaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actors] ADD  CONSTRAINT [DF_Actors_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[ActorTitles] ADD  CONSTRAINT [DF_ActorTitles_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[UseCases] ADD  CONSTRAINT [DF_UseCases_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[ActorTitles]  WITH CHECK ADD  CONSTRAINT [FK_ActorTitles_Actors] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[ActorTitles] CHECK CONSTRAINT [FK_ActorTitles_Actors]
GO
USE [master]
GO
ALTER DATABASE [UnifiedModelingLanguage] SET  READ_WRITE 
GO
