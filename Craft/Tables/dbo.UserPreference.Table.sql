USE [Craft]
GO

/****** Object:  Table [dbo].[UserPreference]    Script Date: 31-05-2025 19:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('PasswordResetOtps', 'U') IS NULL
BEGIN

	CREATE TABLE [dbo].[UserPreference](
		[UserID] [uniqueidentifier] NULL,
		[DarkTheme] [bit] NULL,
		[LightTheme] [bit] NULL,
		[EnableNotification] [bit] NULL
	) ON [PRIMARY]


	ALTER TABLE [dbo].[UserPreference] ADD  CONSTRAINT [DF_UserPreference_DarkTheme]  DEFAULT ((0)) FOR [DarkTheme]

	ALTER TABLE [dbo].[UserPreference] ADD  CONSTRAINT [DF_UserPreference_LightTheme]  DEFAULT ((1)) FOR [LightTheme]

	ALTER TABLE [dbo].[UserPreference]  WITH CHECK ADD  CONSTRAINT [FK_UserPreference_Users_UserID] FOREIGN KEY([UserID])
	REFERENCES [dbo].[Users] ([UserID])

	ALTER TABLE [dbo].[UserPreference] CHECK CONSTRAINT [FK_UserPreference_Users_UserID]
END
GO


