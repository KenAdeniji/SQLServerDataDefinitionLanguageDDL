USE [master]
GO
/****** Object:  Database [IShallBeTheirInheritance]    Script Date: 8/18/2019 10:31:59 PM ******/
CREATE DATABASE [IShallBeTheirInheritance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IShallBeTheirInheritance_Data', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceData.MDF' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [IShallBeTheirInheritance_Image_FileGroup] 
( NAME = N'IShallBeTheirInheritance_Image', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [IShallBeTheirInheritance_Index_FileGroup] 
( NAME = N'IShallBeTheirInheritance_Index', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [IShallBeTheirInheritance_Text_FileGroup] 
( NAME = N'IShallBeTheirInheritance_Text', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [IShallBeTheirInheritance_Xml_FileGroup] 
( NAME = N'IShallBeTheirInheritance_Xml', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'IShallBeTheirInheritance_Log', FILENAME = N'E:\SQLServerDataFiles\IShallBeTheirInheritance\IShallBeTheirInheritanceLog.LDF' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
GO
ALTER DATABASE [IShallBeTheirInheritance] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IShallBeTheirInheritance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ARITHABORT OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET RECOVERY FULL 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET  MULTI_USER 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IShallBeTheirInheritance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IShallBeTheirInheritance] SET QUERY_STORE = OFF
GO
USE [IShallBeTheirInheritance]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 8/18/2019 10:31:59 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[IncomeStatement_ProfitAndLoss]    Script Date: 8/18/2019 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeStatement_ProfitAndLoss](
	[IncomeStatement_ProfitAndLossID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NULL,
	[Debit] [decimal](8, 2) NULL,
	[Credit] [decimal](8, 2) NULL,
	[Unit] [nvarchar](50) NULL,
	[Giver] [nvarchar](255) NULL,
	[Taker] [nvarchar](255) NULL,
	[Commentary] [nvarchar](max) NULL,
	[ScriptureReference] [nvarchar](1280) NULL,
	[Uri] [nvarchar](512) NULL,
	[ContactID] [int] NULL,
	[FileName] [varchar](512) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[IncomeStatement_ProfitAndLoss] ON 

INSERT [dbo].[IncomeStatement_ProfitAndLoss] ([IncomeStatement_ProfitAndLossID], [Dated], [Debit], [Credit], [Unit], [Giver], [Taker], [Commentary], [ScriptureReference], [Uri], [ContactID], [FileName]) VALUES (1, CAST(N'2019-08-17T22:15:03.067' AS DateTime), CAST(400.00 AS Decimal(8, 2)), NULL, N'shekels of silver', N'Abraham', N'Ephron the Hittite', N'buryingplace', N'Genesis 23:16', NULL, NULL, NULL)
INSERT [dbo].[IncomeStatement_ProfitAndLoss] ([IncomeStatement_ProfitAndLossID], [Dated], [Debit], [Credit], [Unit], [Giver], [Taker], [Commentary], [ScriptureReference], [Uri], [ContactID], [FileName]) VALUES (2, CAST(N'2019-08-18T13:20:16.040' AS DateTime), CAST(20.00 AS Decimal(8, 2)), NULL, N'pieces of silver', N'Midianites merchantmen', N'Joseph''s siblings', NULL, N'Genesis 37:28', NULL, NULL, NULL)
INSERT [dbo].[IncomeStatement_ProfitAndLoss] ([IncomeStatement_ProfitAndLossID], [Dated], [Debit], [Credit], [Unit], [Giver], [Taker], [Commentary], [ScriptureReference], [Uri], [ContactID], [FileName]) VALUES (3, CAST(N'2019-08-18T13:28:27.487' AS DateTime), CAST(30.00 AS Decimal(8, 2)), NULL, N'pieces of silver', N'Children of Israel', N'Judas Iscariot', N'Betrayal', N'Zechariah 11:12, Zechariah 11:13, Matthew 26:15, Matthew 27:3, Matthew 27:9', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[IncomeStatement_ProfitAndLoss] OFF
/****** Object:  Index [PK_IncomeStatement_ProfitAndLoss]    Script Date: 8/18/2019 10:32:00 PM ******/
ALTER TABLE [dbo].[IncomeStatement_ProfitAndLoss] ADD  CONSTRAINT [PK_IncomeStatement_ProfitAndLoss] PRIMARY KEY NONCLUSTERED 
(
	[IncomeStatement_ProfitAndLossID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_IncomeStatement_ProfitAndLoss_Dated]    Script Date: 8/18/2019 10:32:00 PM ******/
ALTER TABLE [dbo].[IncomeStatement_ProfitAndLoss] ADD  CONSTRAINT [IDX_IncomeStatement_ProfitAndLoss_Dated] UNIQUE NONCLUSTERED 
(
	[Dated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IncomeStatement_ProfitAndLoss] ADD  CONSTRAINT [DF_IncomeStatement_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
USE [master]
GO
ALTER DATABASE [IShallBeTheirInheritance] SET  READ_WRITE 
GO
