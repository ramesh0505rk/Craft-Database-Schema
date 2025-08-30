USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_ValidateOtp]    Script Date: 30-08-2025 13:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 02/06/2025
-- Description:	Validating otp
-- =============================================
-- Sample Call: EXEC [dbo].[Usp_ValidateOtp] @UserEmail = 'ramesh0505rk@gmail.com', @Otp = '8608'
CREATE OR ALTER PROCEDURE [dbo].[Usp_ValidateOtp]
	@UserEmail NVARCHAR(300),
	@Otp NVARCHAR(4)
AS
BEGIN
	DECLARE
	@LocalUserEmail NVARCHAR(300) = @UserEmail,
	@LocalOtp NVARCHAR(40) = @Otp,
	@UserID UNIQUEIDENTIFIER

	SELECT @UserID = UserID FROM Users WHERE UserEmail = @LocalUserEmail

	IF @UserID IS NULL
		RETURN 0

	SELECT 
		CASE WHEN EXISTS(
			SELECT 1 FROM PasswordResetOtps WHERE UserID = @UserID AND Otp = @LocalOtp AND ExpiryDate >= GETUTCDATE() AND IsUsed = 0
		)
		THEN 1
		ELSE 0
	END AS Result
END
