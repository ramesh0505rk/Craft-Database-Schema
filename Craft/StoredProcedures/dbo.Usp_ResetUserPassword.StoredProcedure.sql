USE [Craft]
GO
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
CREATE OR ALTER PROCEDURE Usp_ResetUserPassword
	@Email NVARCHAR(300),
	@NewPassword NVARCHAR(50)
AS
BEGIN
	DECLARE @LocalEmail NVARCHAR(300) = @Email,
			@LocalNewPassword NVARCHAR(50) = @NewPassword,
			@UserID UNIQUEIDENTIFIER

	SELECT @UserID = UserID FROM Users WHERE UserEmail = @LocalEmail

	IF EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
	BEGIN
		UPDATE Users SET Password = @LocalNewPassword WHERE UserID = @UserID 
		RETURN 0
	END
	RETURN -1
END
GO
