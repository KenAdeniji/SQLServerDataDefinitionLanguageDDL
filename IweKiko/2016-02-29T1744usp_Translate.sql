USE [IweKiko]
GO
/****** Object:  StoredProcedure [dbo].[usp_Translate]    Script Date: 2/29/2016 7:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[usp_Translate]
	@FromLanguage			AS VARCHAR(50)		=	NULL,
	@DestinationLanguage	AS VARCHAR(50)		=	NULL,
	@FromWord				AS VARCHAR(255)		=	NULL,
	@clauseOrderBy			AS VARCHAR(50)		=	' ORDER BY SequenceOrderId ASC '
AS
BEGIN
/*
	2016-02-29	File created.
	2015-01-04	blogs.msdn.com/b/raulga/archive/2007/01/04/dynamic-sql-sql-injection.aspx
*/ 
	DECLARE @sqlSelectStatement AS NVARCHAR(4000)
	declare @CRLF nvarchar(10) = char(13) + char(10)

	if @FromLanguage is not null
	begin
		set @FromLanguage = '%' + @FromLanguage + '%'
	end
	
	if @DestinationLanguage is not null
	begin
		set @DestinationLanguage = '%' + @DestinationLanguage + '%'
	end

	if @FromWord is not null
	begin
		set @FromWord = '%' + @FromWord + '%'
	end

	SET @sqlSelectStatement = 'SELECT * FROM IweKiko..Translate WHERE  1 = 1 '

	+	' and ( '
	+   ' (FromLanguage like case '
	+   ' when @FromLanguage is null then FromLanguage '
	+   ' else @FromLanguage  '
	+	' end  ' 
	+	' ) '
	+   ' ) ' + @CRLF 

	+	' and ( '
	+   ' (DestinationLanguage like case '
	+   ' when @DestinationLanguage is null then DestinationLanguage '
	+   ' else @DestinationLanguage  '
	+	' end  ' 
	+	' ) '
	+   ' ) ' + @CRLF 

	+	' and ( '
	+   ' (FromWord like case '
	+   ' when @FromWord is null then FromWord '
	+   ' else @FromWord  '
	+	' end  ' 
	+	' ) '
	+   ' ) ' + @CRLF 

	--EXEC xp_logevent 60000, @sqlSelectStatement, informational

	SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy

	declare @parmDefinition nvarchar(4000)

	set @parmDefinition = '@FromLanguage nvarchar(50), @DestinationLanguage nvarchar(50), @FromWord nvarchar(255)'

	PRINT @sqlSelectStatement

	EXEC sp_executesql 
			  @sqlSelectStatement
			, @parmDefinition
			, @FromLanguage = @FromLanguage
			, @DestinationLanguage = @DestinationLanguage
			, @FromWord = @FromWord
END
GO

usp_Translate @FromWord = 'Woman'
GO
