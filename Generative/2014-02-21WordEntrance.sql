USE [Generative]
GO

/****** Object:  Table [dbo].[WordEntrance]    Script Date: 2/21/2014 9:46:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WordEntrance](
	[SequenceOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Word] [varchar](30) NOT NULL,
	[FirstOccurrence] [DateTime] NOT NULL,
	[LastOccurrence] [DateTime] NULL,
	[Difference] [int] NULL,
	[FrequencyOfOccurrence] [int] NOT NULL,
	[AlphabetSequenceIndex]  AS (dbo.udf_AlphabetSequenceIndex([Word])),
	[FromUntil]  AS (DATEDIFF(day, [FirstOccurrence], [LastOccurrence])),
 CONSTRAINT [PK_WordEntrance] PRIMARY KEY CLUSTERED 
(
	[SequenceOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

