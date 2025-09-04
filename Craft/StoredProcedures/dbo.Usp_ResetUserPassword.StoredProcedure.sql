USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_ResetUserPassword]    Script Date: 04-09-2025 22:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 05/06/2025
-- Description:	Created to reset the user password
-- =============================================
-- Sample Call: EXEC Usp_ResetUserPassword @Email = 'ramesh0505rk@gmail.com', @NewPassword = 'Craft@12345'
-- ====================================================================================================================================================
-- Changes field
-- Date of change			Name				Description
-- 06/06/2025				Rameshkumar K		Implemented a logic to set the IsUsed field to 1 (PasswordResetOtps table).
-- 31/08/2025				Rameshkumar K		Updated the return logic
-- 04/09/2025				Rameshkumar K		Updated the conditon logic for UserID retrival
-- ====================================================================================================================================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_ResetUserPassword]
	@UserEmail NVARCHAR(300),
	@NewPassword NVARCHAR(50),
	@Otp NVARCHAR(4)
AS
BEGIN
	DECLARE @LocalEmail NVARCHAR(300) = @UserEmail,
			@LocalNewPassword NVARCHAR(50) = @NewPassword,
			@LocalOtp NVARCHAR(40) = @Otp,
			@UserID UNIQUEIDENTIFIER

	SELECT TOP 1 @UserID = U.UserID
	FROM Users U
	INNER JOIN 
	PasswordResetOtps pro
	ON pro.UserID = u.UserID
	WHERE pro.Otp = @LocalOtp AND pro.IsUsed = 0 AND U.UserEmail = @LocalEmail AND pro.ExpiryDate > GETUTCDATE()
	ORDER BY pro.ExpiryDate DESC

	IF EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
	BEGIN
		UPDATE Users SET Password = @LocalNewPassword WHERE UserID = @UserID 
		UPDATE PasswordResetOtps SET IsUsed = 1 WHERE Otp = @LocalOtp AND UserID = @UserID AND ExpiryDate > GETUTCDATE()
		SELECT 1 AS Result
		RETURN
	END
	SELECT 0 AS Result
	RETURN
END
