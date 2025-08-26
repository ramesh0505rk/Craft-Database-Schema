USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_ValidateUserWithCreds]    Script Date: 26-08-2025 10:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 26/08/2025
-- Description:	Created to validate the user with credentials
-- =============================================
-- Sample Call: EXEC Usp_ValidateUserWithCreds @UserName = 'ramz@gmail.com', @Password = 'Craft@1234'
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 26/08/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_ValidateUserWithCreds] 
	@UserName NVARCHAR(50),
	@Password NVARCHAR(50)
AS
BEGIN
	DECLARE @LocalUserName NVARCHAR(50) = @UserName,
			@LocalPassword NVARCHAR(50) = @Password,
			@UserId UNIQUEIDENTIFIER
	
	SELECT @UserId = UserID FROM Users WHERE 
	(CAST(UserName AS VARBINARY) = CAST(@LocalUserName AS VARBINARY)
	OR CAST(UserEmail AS VARBINARY) = CAST(@LocalUserName AS VARBINARY))
	AND CAST([Password] AS VARBINARY) = CAST(@LocalPassword AS VARBINARY)

	SELECT @UserId
END
