USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUserList]    Script Date: 26-08-2025 09:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar K
-- Create date: 24/08/2025
-- Description:	To get the user list
-- =============================================
-- Sample Call: EXEC Usp_GetUserList @Page = 1, @PageSize = 10
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 31/07/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[Usp_GetUserList]
	@Page int,
	@PageSize int,
	@SearchString NVARCHAR(MAX) = ''
AS
BEGIN
--------------------------------------------------------
-- Declare local variables
--------------------------------------------------------
	DECLARE @LocalPage int = @Page - 1,
			@LocalPageSize int = @PageSize,
			@LocalSearchString NVARCHAR(MAX) = @SearchString
--------------------------------------------------------
	
	SELECT * FROM Users
	ORDER BY FirstName
	OFFSET (@LocalPage * @LocalPageSize) ROWS
	FETCH NEXT @LocalPageSize ROWS ONLY

END
