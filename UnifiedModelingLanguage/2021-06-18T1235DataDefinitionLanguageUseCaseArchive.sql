USE [UnifiedModelingLanguage]
GO

CREATE TABLE [dbo].[UseCases](
	[UseCaseID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[UseCaseTitle] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_UseCase] PRIMARY KEY NONCLUSTERED 
(
	[UseCaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[UseCases] ADD  CONSTRAINT [DF_UseCases_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[ActorName] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY NONCLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Actors] ADD  CONSTRAINT [DF_Actors_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[RoleTitle] [varchar](2000) NULL,a
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

CREATE TABLE [dbo].[Actors_Roles](
	[ActorRoleID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[ScriptureReference] [varchar](max) NULL,
	[ActorID] [int] NULL,
	[RoleID] [int] NULL,
	[ActorRoleTitle] [varchar](2000) NULL,
	[Commentary] [varchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_ActorsRoles] PRIMARY KEY NONCLUSTERED 
(
	[ActorRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Actors_Roles] ADD  CONSTRAINT [DF_Actors_Roles_Dated]  DEFAULT (getdate()) FOR [Dated]
GO

ALTER TABLE [dbo].[Actors_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Roles_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[Actors_Roles] CHECK CONSTRAINT [FK_Actors_Roles_Actors]
GO

ALTER TABLE [dbo].[Actors_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Roles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Actors_Roles] CHECK CONSTRAINT [FK_Actors_Roles_Roles]
GO
