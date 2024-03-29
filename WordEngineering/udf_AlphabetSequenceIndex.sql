USE [WordEngineering]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_AlphabetSequenceIndex]    Script Date: 8/30/2020 7:17:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER FUNCTION [dbo].[udf_AlphabetSequenceIndex]
(
	@word VARCHAR(600)
)
RETURNS INTEGER
AS
BEGIN
-- 2009-10-20	udf_AlphabetSequenceIndex create date.
-- 2018-08-01	SET @alphabetSequenceIndex = TRY_PARSE(@Word AS INTEGER)
DECLARE @alphabetSequenceIndex DECIMAL
DECLARE @currentAscii INTEGER
DECLARE @currentCharacter CHARACTER
DECLARE @length INTEGER
DECLARE @position INTEGER
SET @alphabetSequenceIndex = TRY_PARSE(@Word AS decimal)
IF @alphabetSequenceIndex IS NOT NULL
BEGIN
	RETURN CONVERT(INTEGER, @alphabetSequenceIndex)
END
SET @word = REPLACE(@word,'''','''''');
SET @word = LTRIM(RTRIM(UPPER(@word)))
SET @alphabetSequenceIndex = 0
SET @length = LEN(@word)
SET @position = 0
WHILE @position < @length
BEGIN
	SET @position = @position + 1
	SET @currentCharacter = SUBSTRING(@word, @position, 1)
	SET @currentAscii = ASCII(@currentCharacter)
	IF @currentAscii < 65 OR @currentAscii > 90
	BEGIN
		CONTINUE
	END
	SET @alphabetSequenceIndex = @alphabetSequenceIndex + (@currentAscii - 64) --A = 65
END
RETURN @alphabetSequenceIndex
END
