USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUserDetails]    Script Date: 26-08-2025 10:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 26/08/2025
-- Description:	Created to get the user based on the UserID
-- =============================================
-- Sample Call: EXEC Usp_GetUserDetails @UserID = 'D0B8B681-969F-4AF7-A8DF-406A5ECAD1CE'
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 26/08/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_GetUserDetails]
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
--------------------------------------------------------
-- Declare local variables
--------------------------------------------------------
	DECLARE @LocalUserID UNIQUEIDENTIFIER = @UserID
--------------------------------------------------------
	
	SELECT UserID, UserName, FirstName, LastName, UserEmail FROM Users WHERE UserID = @LocalUserID
	
END
