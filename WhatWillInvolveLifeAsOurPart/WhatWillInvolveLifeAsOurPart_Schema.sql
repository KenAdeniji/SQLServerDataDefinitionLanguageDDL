USE [master]
GO
/****** Object:  Database [WhatWillInvolveLifeAsOurPart]    Script Date: 10/23/2023 4:08:35 PM ******/
CREATE DATABASE [WhatWillInvolveLifeAsOurPart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WhatWillInvolveLifeAsOurPart_Data', FILENAME = N'E:\SQLServerDataFiles\WhatWillInvolveLifeAsOurPart\WhatWillInvolveLifeAsOurPartData.MDF' , SIZE = 8000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'WhatWillInvolveLifeAsOurPart_Log', FILENAME = N'E:\SQLServerDataFiles\WhatWillInvolveLifeAsOurPart\WhatWillInvolveLifeAsOurPartLog.LDF' , SIZE = 8000KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WhatWillInvolveLifeAsOurPart].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ARITHABORT OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET RECOVERY FULL 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET  MULTI_USER 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET QUERY_STORE = ON
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WhatWillInvolveLifeAsOurPart]
GO
/****** Object:  User [LoginNameSecurity]    Script Date: 10/23/2023 4:08:35 PM ******/
CREATE USER [LoginNameSecurity] FOR LOGIN [LoginNameSecurity] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 10/23/2023 4:08:35 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 10/23/2023 4:08:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[BibleWord] [nvarchar](350) NOT NULL,
	[Typed] [nvarchar](50) NOT NULL,
	[ScriptureReference] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](4000) NULL,
	[URI] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[BibleWord] ASC,
	[Typed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 10/23/2023 4:08:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[BibleWord] [nvarchar](350) NOT NULL,
	[Typed] [nvarchar](50) NOT NULL,
	[ScriptureReference] [nvarchar](4000) NULL,
	[Commentary] [nvarchar](4000) NULL,
	[URI] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[BibleWord] ASC,
	[Typed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[Actor] ADD  CONSTRAINT [DF_Actor_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
EXEC [WhatWillInvolveLifeAsOurPart].sys.sp_addextendedproperty @name=N'Creation', @value=N'2023-10-22' 
GO
EXEC [WhatWillInvolveLifeAsOurPart].sys.sp_addextendedproperty @name=N'Commentary', @value=N'Keep track of history? Historical account? 2023-10-23T16:06:06 Keyword? Database for Unified Modeling Language (UML), actor, place, activity, action ' 
GO
EXEC sys.sp_addextendedproperty @name=N'Created', @value=N'2023-10-23T09:14:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Actor', @level2type=N'COLUMN',@level2name=N'Typed'
GO
EXEC sys.sp_addextendedproperty @name=N'Creation', @value=N'2023-10-22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Actor'
GO
USE [master]
GO
ALTER DATABASE [WhatWillInvolveLifeAsOurPart] SET  READ_WRITE 
GO
