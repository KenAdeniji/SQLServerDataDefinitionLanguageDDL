USE [WordEngineering]
GO

/****** Object:  Table [dbo].[NameReferenceTo]    Script Date: 12/19/2023 5:50:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NameReferenceTo](
	[NameReferenceToID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[Named] [nvarchar](max) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactID] [int] NULL,
	[ScriptureReference] [nvarchar](max) NULL,
	[Filename] [nvarchar](max) NULL,
	[YearsLived] [int] NULL,
	[Namer] [int] NULL,
	[NameReference] [nvarchar](max) NULL,
	[Typed] [nvarchar](max) NULL,
	[GenerationID] [int] NULL,
	[BirthOrder] [int] NULL,
	[SiblingCount] [int] NULL,
	[CovenantOrder] [int] NULL,
	[ProphecyFulfilledCount] [int] NULL,
	[ResurrectionOrder] [int] NULL,
	[HolinessOrder] [int] NULL,
	[SpouseCount] [int] NULL,
	[ConcubineCount] [int] NULL,
	[DivorceCount] [int] NULL,
 CONSTRAINT [PK_NameReferenceTo] PRIMARY KEY NONCLUSTERED 
(
	[NameReferenceToID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[NameReferenceTo] ADD  CONSTRAINT [DF_NameReferenceTo_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

ALTER TABLE [dbo].[NameReferenceTo]  WITH CHECK ADD  CONSTRAINT [FK_NameReferenceTo_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO

ALTER TABLE [dbo].[NameReferenceTo] CHECK CONSTRAINT [FK_NameReferenceTo_Contact]
GO

