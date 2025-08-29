USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_RequestOTP]    Script Date: 29-08-2025 10:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 27/08/2025
-- Description:	Created to generate OTP for password reset.
-- =============================================
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 26/08/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_RequestOTP]
	@UserEmail NVARCHAR(300)
AS
BEGIN
--------------------------------------------------------
-- Declare local variables
--------------------------------------------------------
	DECLARE @LocalUserEmail NVARCHAR(300) = @UserEmail,
			@UserID UNIQUEIDENTIFIER,
			@Otp int
--------------------------------------------------------
	
	-- Check if user exists
	SELECT @UserID = UserID FROM Users WHERE UserEmail = @LocalUserEmail

	IF @UserID IS NULL
	BEGIN
		-- Set OTP = 0, if the user doesn't exist
		SET @Otp = 0 
		RETURN
	END

	-- Generate 4 digit OTP
	SET @Otp = FLOOR(RAND() * 9000) + 1000

	INSERT INTO PasswordResetOtps (UserID, Otp, ExpiryDate, IsUsed) VALUES
	(@UserID, @Otp, DATEADD(MINUTE,10,GETUTCDATE()), 0)

	SELECT @Otp AS Otp
END
