USE [Generative]
GO

ALTER PROCEDURE [dbo].[usp_WordEntranceSelect]
 @word							AS VARCHAR(30)		=	NULL,
 @firstOccurrenceFrom			AS DATETIME			=	NULL,
 @firstOccurrenceUntil			AS DATETIME			=	NULL,
 @lastOccurrenceFrom			AS DATETIME			=	NULL,
 @lastOccurrenceUntil			AS DATETIME			=	NULL,
 @frequencyOfOccurrenceFrom		AS INTEGER			=	NULL,
 @frequencyOfOccurrenceUntil	AS INTEGER			=	NULL,
 @sequenceOrderIdFrom			AS INTEGER			=	NULL,
 @sequenceOrderIdUntil			AS INTEGER			=	NULL,
 @alphabetSequenceIndexFrom		AS INTEGER			=	NULL,
 @alphabetSequenceIndexUntil	AS INTEGER			=	NULL,
 @clauseOrderBy		AS VARCHAR(50)		=	' ORDER BY SequenceOrderId ASC '
AS
BEGIN
	/*
		2014-02-22 Created.
	*/
 
 DECLARE @clauseAnd          AS NVARCHAR(7)
 DECLARE @clauseWhere        AS NVARCHAR(7)
 DECLARE @quote              AS NVARCHAR(1)
 DECLARE @sqlSelectStatement AS NVARCHAR(1000)
 SET @clauseAnd          = SPACE(2) + 'AND' + SPACE(2)
 SET @clauseWhere        = SPACE(1) + 'WHERE' + SPACE(1)
 SET @quote              = ''''
 SET @sqlSelectStatement = 'SELECT * FROM WordEntrance ' + @clauseWhere
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 IF @word IS NOT NULL AND @word <> ''
 BEGIN
  SET @word = REPLACE(@word, "'", "''")
  SET @sqlSelectStatement = @sqlSelectStatement + ' word LIKE ''%' + @word + '%''' + @clauseAnd
 END

 IF @firstOccurrenceFrom IS NOT NULL
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' FirstOccurrence >= ' + @quote + CONVERT( NVARCHAR, @firstOccurrenceFrom ) + @quote + @clauseAnd
 END

 IF @firstOccurrenceUntil IS NOT NULL
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' FirstOccurrence <= ' + @quote + CONVERT( NVARCHAR, @firstOccurrenceUntil ) + @quote + @clauseAnd
 END
 
 IF @lastOccurrenceFrom IS NOT NULL
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' LastOccurrence >= ' + @quote + CONVERT( NVARCHAR, @lastOccurrenceFrom ) + @quote + @clauseAnd
 END

 IF @lastOccurrenceUntil IS NOT NULL
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' LastOccurrence <= ' + @quote + CONVERT( NVARCHAR, @lastOccurrenceUntil ) + @quote + @clauseAnd
 END
 
 IF @frequencyOfOccurrenceFrom IS NOT NULL
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' frequencyOfOccurrence >= ' + CONVERT( NVARCHAR, @frequencyOfOccurrenceFrom ) + @clauseAnd
 END
 IF @frequencyOfOccurrenceUntil IS NOT NULL
 BEGIN
  SET @sqlSelectStatement = @sqlSelectStatement + ' frequencyOfOccurrence <= ' + CONVERT( NVARCHAR, @frequencyOfOccurrenceUntil ) + @clauseAnd
 END
 IF @sequenceOrderIdFrom IS NOT NULL AND @sequenceOrderIdUntil IS NOT NULL 
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' sequenceOrderId BETWEEN ' + CONVERT( NVARCHAR, @sequenceOrderIdFrom ) + ' AND ' + CONVERT( NVARCHAR, @sequenceOrderIdUNTIL ) + ' ' + @clauseAnd
 END
 ELSE 
 BEGIN
	IF @sequenceOrderIdFrom IS NOT NULL
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' sequenceOrderId >= ' + CONVERT( NVARCHAR, @sequenceOrderIdFrom ) + @clauseAnd
	END
	IF @sequenceOrderIdUntil IS NOT NULL
	BEGIN
		SET @sqlSelectStatement = @sqlSelectStatement + ' sequenceOrderId <= ' + CONVERT( NVARCHAR, @sequenceOrderIdUntil ) + @clauseAnd
	END
 END
 IF @alphabetSequenceIndexFrom IS NOT NULL AND @alphabetSequenceIndexUntil IS NOT NULL 
 BEGIN
	SET @sqlSelectStatement = @sqlSelectStatement + ' alphabetSequenceIndex BETWEEN ' + CONVERT( NVARCHAR, @alphabetSequenceIndexFrom ) + ' AND ' + CONVERT( NVARCHAR, @alphabetSequenceIndexUNTIL ) + ' ' + @clauseAnd
 END
 ELSE 
 BEGIN
	 IF @alphabetSequenceIndexFrom IS NOT NULL
	 BEGIN
	  SET @sqlSelectStatement = @sqlSelectStatement + ' alphabetSequenceIndex >= ' + CONVERT( NVARCHAR, @alphabetSequenceIndexFrom ) + @clauseAnd
	 END
	 IF @alphabetSequenceIndexUntil IS NOT NULL
	 BEGIN
	  SET @sqlSelectStatement = @sqlSelectStatement + ' alphabetSequenceIndex <= ' + CONVERT( NVARCHAR, @alphabetSequenceIndexUntil ) + @clauseAnd
	 END
 END
 IF RIGHT( @sqlSelectStatement, 7 ) = @clauseAnd
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseAnd ) )
 END
 ELSE
 BEGIN
  SET @sqlSelectStatement = LEFT( @sqlSelectStatement, LEN( @sqlSelectStatement ) - LEN( @clauseWhere ) )
 END
 PRINT @sqlSelectStatement
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 --SET @sqlSelectStatement = REPLACE(@sqlSelectStatement, "'", "''")
 --EXEC xp_logevent 60000, @sqlSelectStatement, informational
 SET @sqlSelectStatement = @sqlSelectStatement + @clauseOrderBy
 EXEC sp_executesql @sqlSelectStatement
END
GO
