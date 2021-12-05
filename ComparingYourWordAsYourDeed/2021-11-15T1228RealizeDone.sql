USE [ComparingYourWordAsYourDeed]
GO

/****** Object:  Table [dbo].[RealizeDone]    Script Date: 11/15/2021 12:51:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RealizeDone](
	[RealizeDoneID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[Commentary] [varchar](max) NULL,
	[What] [varchar](max) NULL,
	[When] [varchar](max) NULL,
	[Where] [varchar](max) NULL,
	[Who] [varchar](max) NULL,
	[URI] [nvarchar](max) NULL,
	[ContactID] [int] NULL,
	[HisWordID] [int] NULL,
 CONSTRAINT [PK_RealizeDone] PRIMARY KEY NONCLUSTERED 
(
	[RealizeDoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[RealizeDone] ADD  CONSTRAINT [DF_RealizeDoneSimplyIHaveProvidedSufficientNeedForReUsingYouILetTheLightOpenToAdmireMine_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

ALTER TABLE [dbo].[RealizeDone]  WITH CHECK ADD  CONSTRAINT [FK_RealizeDone_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactID])
GO

ALTER TABLE [dbo].[RealizeDone] CHECK CONSTRAINT [FK_RealizeDone_Contact]
GO

EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'The RealizeDoneID column is an identity column, maintained by SQL Server, which automatically generates a sequential next identity. The goodness of this technique is that it is a candidate primary key, data loss is trackable, and it provides a sort key. The RealizeDoneID column may serve as the primary and/or foreign key, the backbone of the Referential Integrity Constraint. It is debatable, the need for this identity column, when there is a dated column, which does similar work, and offers almost identical benefit; we discuss the dated column, next. One benefit of the identity column, is that it is unique, and it offers performance gain when querying based on where condition, and sorting.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RealizeDone', @level2type=N'COLUMN',@level2name=N'RealizeDoneID'
GO

EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'The Dated column, as the name implies, is of the DateTime type. If an insert statement does not explicitly specify a value for the dated column, then it defaults to the current date and time of the (UTC-08:00) Pacific Time (US & Canada) time zone. There is a preference for the Coordinated Universal Time (UTC) format. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RealizeDone', @level2type=N'COLUMN',@level2name=N'Dated'
GO

EXEC sys.sp_addextendedproperty @name=N'Commentary', @value=N'As the name of the table denotes, the RealizeDone table, is what the author heard from the source. The entries in the RealizeDone table is exact, and representable in alphanumeric format (Numbers 12:6-8). In following, the Bible''s New Testament convention, where there is translation of Hebrew words to English, which is being interpreted, (Matthew 1:23, Mark 5:41, Mark 15:22, Mark 15:34, John 1:38, John 1:41, Acts 4:36); so also, there is translation of Yoruba words to English.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RealizeDone'
GO


