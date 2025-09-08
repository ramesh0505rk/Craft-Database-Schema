USE [Craft]
GO

/****** Object:  Table [dbo].[Projects]    Script Date: 08-09-2025 09:39:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Projects](
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ProjectName] [varchar](250) NOT NULL,
	[SuperAdmin] [uniqueidentifier] NULL,
	[ProjectOwner] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Projects_ProjectId] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_ProjectOwner] FOREIGN KEY([ProjectOwner])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_ProjectOwner]
GO

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_SuperAdmin] FOREIGN KEY([SuperAdmin])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_SuperAdmin]
GO


