USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_ResetUserPassword]    Script Date: 19-08-2025 10:11:17 ******/
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

	SELECT @UserID = U.UserID 
	FROM Users U
	INNER JOIN 
	PasswordResetOtps pro
	ON pro.UserID = u.UserID
	WHERE pro.Otp = @LocalOtp AND pro.IsUsed = 0 AND U.UserEmail = @LocalEmail

	IF EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
	BEGIN
		UPDATE Users SET Password = @LocalNewPassword WHERE UserID = @UserID 
		UPDATE PasswordResetOtps SET IsUsed = 1 WHERE Otp = @LocalOtp AND UserID = @UserID
		RETURN 0
	END
	RETURN -1
END
