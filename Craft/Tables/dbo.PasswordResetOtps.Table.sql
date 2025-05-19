USE [Craft]
GO

/****** Object:  Table [dbo].[PasswordResetOtps]    Script Date: 5/19/2025 1:37:02 PM ******/
IF OBJECT_ID('PasswordResetOtps', 'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[PasswordResetOtps](
		[PassResetOtpId] [int] IDENTITY(1,1) NOT NULL,
		[UserID] [uniqueidentifier] NOT NULL,
		[Otp] [nvarchar](4) NOT NULL,
		[ExpiryDate] [datetime] NOT NULL,
		[IsUsed] [bit] NOT NULL,
	 CONSTRAINT [PK_PasswordResetOtps_PassResetOtpId] PRIMARY KEY CLUSTERED 
	(
		[PassResetOtpId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	ALTER TABLE [dbo].[PasswordResetOtps] ADD  DEFAULT ((0)) FOR [IsUsed]

	ALTER TABLE [dbo].[PasswordResetOtps]  WITH CHECK ADD  CONSTRAINT [FK_PasswordResetOtps_Users_UserID] FOREIGN KEY([UserID])
	REFERENCES [dbo].[Users] ([UserID])

	ALTER TABLE [dbo].[PasswordResetOtps] CHECK CONSTRAINT [FK_PasswordResetOtps_Users_UserID]
END
GO


