USE [AManDevelopedInAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_TermSelect]    Script Date: 11/20/2014 6:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_TermSelect]
 @OrganizationId	AS INT = NULL
AS
BEGIN
SELECT TOP 1 OrganizationName, Uri FROM Organization WHERE OrganizationId = @OrganizationId
SELECT DateStart, DateEnd, Uri FROM Term WHERE OrganizationId = @OrganizationId ORDER BY DateStart, DateEnd
END
GO

usp_TermSelect @OrganizationId = 1
 
