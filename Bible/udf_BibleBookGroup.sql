USE [Bible]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_BibleGroup] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE OR ALTER FUNCTION [dbo].[udf_BibleBookGroup]
(
	@bookID INTEGER
)
RETURNS VARCHAR(20)
AS
BEGIN
	--Created 2020-10-24
	DECLARE @bibleBookGroup VARCHAR(20)

	SELECT @bibleBookGroup =
		CASE WHEN @bookID <= 5 THEN 'Pentateuch' 
			 WHEN @bookID >= 40 AND @bookID <= 43 THEN 'Gospel' 
			 ELSE NULL 
		END

	RETURN @bibleBookGroup
END
