USE [Craft]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetUserPreferencesByUserID]    Script Date: 17-09-2025 14:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar Krishnasamy
-- Create date: 07/09/2025
-- Description:	Created to get the user preferences by userID.
-- =============================================
-- Sample Call: SELECT * FROM ufn_GetUserPreferencesByUserID('B73AEEAB-E170-4436-B9F2-3DF624880009')
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[ufn_GetUserPreferencesByUserID]
(	
	@UserID UNIQUEIDENTIFIER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT DarkTheme, LightTheme, EnableNotification FROM UserPreference WHERE UserID = @UserID
)
