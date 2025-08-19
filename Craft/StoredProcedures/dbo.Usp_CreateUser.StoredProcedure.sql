USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_CreateUser]    Script Date: 19-08-2025 10:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 04/06/2025
-- Description:	To onboard a user
-- =============================================
-- Sample Call: EXEC [dbo].[Usp_CreateUser] @UserID = 'B73AEEAB-E170-4436-B9F2-3DF624880009', @UserName = 'Dave', @Password = 'Craft@1234', @FirstName = 'Dave', @LastName = 'Martinez', @UserEmail = 'dave@gmail.com'
CREATE OR ALTER PROCEDURE [dbo].[Usp_CreateUser] 
	@UserID UNIQUEIDENTIFIER,
	@UserName NVARCHAR(50),
	@Password NVARCHAR(50),
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@UserEmail NVARCHAR(300)
AS
BEGIN
	DECLARE @LocalUserID UNIQUEIDENTIFIER = @UserID,
			@LocalUserName NVARCHAR(50) = @UserName,
			@LocalPassword NVARCHAR(50) = @Password,
			@LocalFirstName VARCHAR(50) = @FirstName,
			@LocalLastName VARCHAR(50) = @LastName,
			@LocalUserEmail NVARCHAR(300) = @UserEmail

--	Inserting a new user into Users table
	INSERT INTO Users VALUES (@LocalUserID,@LocalUserName,@LocalPassword,@LocalFirstName,@LocalLastName,@LocalUserEmail)

--	Inserting the default user preference values along with the UserID for the newly inserted user
	INSERT INTO UserPreference (UserID, EnableNotification) VALUES (@LocalUserID, 0)

	SELECT * from dbo.Users WHERE UserID = @LocalUserID
END
