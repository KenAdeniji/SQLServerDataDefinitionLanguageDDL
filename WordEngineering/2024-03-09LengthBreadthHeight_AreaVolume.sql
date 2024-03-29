USE [WordEngineering]
GO
/****** Object:  Table [dbo].[HowWeWouldLearnToSay]    Script Date: 3/9/2024 9:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HowWeWouldLearnToSay](
	[HowWeWouldLearnToSayID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[Length] [decimal](18, 5) NULL,
	[Breadth] [decimal](18, 5) NULL,
	[Height] [decimal](18, 5) NULL,
	[Unit] [varchar](50) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [varchar](max) NULL,
	[ContactID] [int] NULL,
	[ScriptureReference] [varchar](max) NULL,
 CONSTRAINT [PK_HowWeWouldLearnToSay] PRIMARY KEY NONCLUSTERED 
(
	[HowWeWouldLearnToSayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[HowWeWouldLearnToSay_View]    Script Date: 3/9/2024 9:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HowWeWouldLearnToSay_View]
AS
SELECT
	*,
	[Length] * [Breadth] AS Area,
	[Length] * [Breadth] * [Height] AS Volume
FROM	WordEngineering.dbo.HowWeWouldLearnToSay
GO
ALTER TABLE [dbo].[HowWeWouldLearnToSay] ADD  CONSTRAINT [DF_HowWeWouldLearnToSay_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
ALTER TABLE [dbo].[HowWeWouldLearnToSay]  WITH CHECK ADD  CONSTRAINT [FK_HowWeWouldLearnToSay_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO
ALTER TABLE [dbo].[HowWeWouldLearnToSay] CHECK CONSTRAINT [FK_HowWeWouldLearnToSay_Contact]
GO
