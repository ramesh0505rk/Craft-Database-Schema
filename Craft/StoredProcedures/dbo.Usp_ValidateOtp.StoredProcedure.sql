USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_ValidateOtp]    Script Date: 19-08-2025 10:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 02/06/2025
-- Description:	Validating otp
-- =============================================
-- Sample Call: EXEC [dbo].[Usp_ValidateOtp] @Email = 'ramesh0505rk@gmail.com', @Otp = '8608'
CREATE OR ALTER PROCEDURE [dbo].[Usp_ValidateOtp]
	@Email NVARCHAR(300),
	@Otp NVARCHAR(4)
AS
BEGIN
	DECLARE
	@LocalEmail NVARCHAR(300) = @Email,
	@LocalOtp NVARCHAR(40) = @Otp,
	@UserID UNIQUEIDENTIFIER

	SELECT @UserID = UserID FROM Users WHERE UserEmail = @LocalEmail
	SELECT 
		CASE WHEN EXISTS(
			SELECT 1 FROM PasswordResetOtps WHERE UserID = @UserID AND Otp = @LocalOtp AND ExpiryDate >= GETUTCDATE() AND IsUsed = 0
		)
		THEN 1
		ELSE 0
	END AS Result
END
