USE [AManDevelopedInAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_OrganizationSelect]    Script Date: 11/21/2014 4:04:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_OrganizationSelect]
 @OrganizationName      AS NVARCHAR(1024)	=  NULL,
 @Uri					AS NVARCHAR(256)    =  NULL,
 @clauseOrderBy			AS NVARCHAR(255)	=  ' ORDER BY OrganizationName, Uri '
AS
BEGIN
 DECLARE @clauseAnd          AS NVARCHAR(7)
 DECLARE @clauseWhere        AS NVARCHAR(7)
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @sqlSelectStatement AS NVARCHAR(4000)
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @sqlSelectStatement = 'SELECT DISTINCT Organization.OrganizationId AS OrganizationId, Organization.OrganizationName AS OrganizationName, Organization.Uri AS Uri FROM Organization ' + @clauseWhere
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 IF @OrganizationName IS NOT NULL
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' Organization.OrganizationName LIKE ''%' + @OrganizationName + '%''' + @clauseAnd
 END
 IF @Uri IS NOT NULL
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' Organization.Uri LIKE ''%' + @Uri + '%''' + @clauseAnd
 END
 IF RIGHT( @sqlSelectStatement, 7 ) = @clauseAnd
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseAnd ) )
 END
 SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseWhere ) )
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy
 EXEC sp_executesql @sqlSelectStatement
END
