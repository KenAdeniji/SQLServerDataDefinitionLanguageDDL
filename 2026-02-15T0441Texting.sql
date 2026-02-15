USE [WordEngineering]
GO

/****** Object:  Table [dbo].[Texting]    Script Date: 2/15/2026 9:40:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Texting](
	[TextingID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime2](7) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PhoneType] [nvarchar](20) NULL,
	[Email] [nvarchar](max) NULL,
	[URI] [nvarchar](max) NULL,
	[Requirement] [nvarchar](max) NULL,
	[Fulfillment] [nvarchar](max) NULL,
	[Titled] [nvarchar](max) NULL,
	[OrganizationName] [nvarchar](max) NULL,
	[ContactName] [nvarchar](max) NULL,
	[SourceURI] [nvarchar](max) NULL,
	[Requested] [datetime2](7) NULL,
	[ContactID] [int] NULL,
 CONSTRAINT [PK_Texting] PRIMARY KEY CLUSTERED 
(
	[TextingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Texting] ADD  CONSTRAINT [DF_Texting_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

ALTER TABLE [dbo].[Texting]  WITH CHECK ADD  CONSTRAINT [FK_Texting_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO

ALTER TABLE [dbo].[Texting] CHECK CONSTRAINT [FK_Texting_Contact]
GO

