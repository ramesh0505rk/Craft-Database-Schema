USE [Craft]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateProject]    Script Date: 17-09-2025 14:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rameshkumar Krishnasamy
-- Create date: 11/09/2025
-- Description:	Implemented to create new project.
-- =============================================
-- Sample Call: EXEC usp_CreateProject @ProjectId = '', @ProjectName = '', @SuperAdmin = '', @ProjectOwner = '', @CreatedDate = '', @CreatedBy = '', @ModifiedDate = '', @ModifiedBy = ''
-- =============================================
-- Changes field
-- Date of change			Name						Description
-- 11/09/2025				Rameshkumar Krishnasamy		Created
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[usp_CreateProject]
	@ProjectId UNIQUEIDENTIFIER,
	@ProjectName VARCHAR(250),
	@SuperAdmin UNIQUEIDENTIFIER,
	@ProjectOwner UNIQUEIDENTIFIER,
	@CreatedDate DATETIME,
	@CreatedBy UNIQUEIDENTIFIER,
	@ModifiedDate DATETIME,
	@ModifiedBy UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

--------------------------------------------------------
-- Declare local variables
--------------------------------------------------------
	DECLARE @LocalProjectId UNIQUEIDENTIFIER = @ProjectId,
			@LocalProjectName VARCHAR(250) = @ProjectName,
			@LocalSuperAdmin UNIQUEIDENTIFIER = @SuperAdmin,
			@LocalProjectOwner UNIQUEIDENTIFIER = @ProjectOwner,
			@LocalCreatedDate DATETIME = @CreatedDate,
			@LocalCreatedBy UNIQUEIDENTIFIER = @CreatedBy,
			@LocalModifiedDate DATETIME = @ModifiedDate,
			@LocalModifiedBy UNIQUEIDENTIFIER = @ModifiedBy,
			@RowsAffected INT
--------------------------------------------------------

--------------------------------------------------------
-- Insert the project details into the projects table
--------------------------------------------------------
	INSERT INTO dbo.Projects (ProjectId, ProjectName, SuperAdmin, ProjectOwner, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
	VALUES (@LocalProjectId, @LocalProjectName, @LocalSuperAdmin, @LocalProjectOwner, @LocalCreatedDate, @LocalCreatedBy,
			@LocalModifiedDate, @LocalModifiedBy)

	SET @RowsAffected = @@ROWCOUNT
--------------------------------------------------------
	
	SELECT @RowsAffected AS IsCreated
END
