USE [WordEngineering]
GO

/****** Object:  Table [dbo].[ToKnowMyOwn]    Script Date: 7/6/2015 3:42:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ToKnowMyOwn](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NULL CONSTRAINT [DF_ToKnowMyOwn_Dated]  DEFAULT (getdate()),
	[Word] [nvarchar](MAX) NOT NULL,
	[Originator] [varchar](20) NULL,
	[Commentary] [nvarchar](MAX) NULL,
	[ContactId] [int] NULL,
	[Uri] [varchar](255) NULL,
 CONSTRAINT [PK_ToKnowMyOwn] PRIMARY KEY NONCLUSTERED 
(
	[SequenceOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IDX_ToKnowMyOwn_Dated] UNIQUE NONCLUSTERED 
(
	[Dated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ToKnowMyOwn]  WITH CHECK ADD  CONSTRAINT [FK_ToKnowMyOwn_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([SequenceOrderId])
GO

ALTER TABLE [dbo].[ToKnowMyOwn] CHECK CONSTRAINT [FK_ToKnowMyOwn_Contact]
GO


