USE [Craft]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05-05-2025 18:28:58 ******/
IF OBJECT_ID('Users', 'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[Users](
		[UserID] [uniqueidentifier] NOT NULL,
		[UserName] [nvarchar](50) NULL,
		[Password] [nvarchar](50) NULL,
		[FirstName] [varchar](50) NULL,
		[LastName] [varchar](50) NULL,
		[UserEmail] [nvarchar](300) NULL,
	 CONSTRAINT [PK_Users_UserID] PRIMARY KEY CLUSTERED 
	(
		[UserID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO