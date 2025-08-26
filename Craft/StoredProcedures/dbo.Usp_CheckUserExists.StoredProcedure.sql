USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_CheckUserExists]    Script Date: 27-08-2025 01:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 26/08/2025
-- Description:	Created to check whether a user with same username/email exists or not
-- =============================================
-- Sample Call: EXEC Usp_CheckUserExists @Username = 'Cole', @UserEmail = 'cole@gmail.com'
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 26/08/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_CheckUserExists]
	@UserName NVARCHAR(50),
	@UserEmail NVARCHAR(300)
AS
BEGIN
--------------------------------------------------------
-- Declare local variables
--------------------------------------------------------
	DECLARE @LocalUserName NVARCHAR(50) = @UserName,
			@LocalUserEmail NVARCHAR(300) = @UserEmail,
			@IsUserNameExists BIT = 0,
			@IsUserEmailExists BIT = 0
--------------------------------------------------------

	SELECT @IsUserNameExists = 1 FROM Users WHERE UserName = @LocalUserName
	SELECT @IsUserEmailExists = 1 FROM Users WHERE UserEmail = @LocalUserEmail

	SELECT @IsUserNameExists AS IsUserNameExists, @IsUserEmailExists AS IsUserEmailExists
END
