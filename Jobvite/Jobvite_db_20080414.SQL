CREATE DATABASE [JobVite] ON  PRIMARY 
( NAME = N'JobVite_Data', FILENAME = N'D:\SQLServerDataFiles\JobVite\JobViteData.MDF' , SIZE = 2MB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%) 
 LOG ON 
( NAME = N'JobVite_Log', FILENAME = N'D:\SQLServerDataFiles\JobVite\JobViteLog.LDF' , SIZE = 1MB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
GO

CREATE TABLE [dbo].[Book]
(
	[Isbn] 		[bigint] NOT NULL,
	[Title] 	[nvarchar](80) NULL,
	[SalesPrice]	[money] NULL,
	[Publisher] 	[nvarchar](60) NULL,
	[Year] 		[int] NULL,
	CONSTRAINT [PK_Book] PRIMARY KEY NONCLUSTERED 
	(
		[Isbn] ASC
	)
) 
GO

CREATE TABLE [dbo].[Author]
(
	[Isbn] 		[bigint] NOT NULL,
	[Name]	 	[nvarchar](80) NULL,
	[Rank] 		[int] NOT NULL,
	CONSTRAINT [PK_Author] PRIMARY KEY NONCLUSTERED 
	(
		[Isbn] ASC,
		[Rank] ASC
	)
) 
GO

CREATE TABLE [dbo].[Purchases]
(
	[Isbn] 		[bigint] NOT NULL,
	[Store]	 	[nvarchar](80) NULL,
	[Price] 	[Money] NOT NULL,
	[PurchasesId] 	[int] IDENTITY(1,1) NOT NULL,
	CONSTRAINT [PK_Purchases] PRIMARY KEY NONCLUSTERED 
	(
		[PurchasesId] ASC
	)
) 
GO
