USE [WordEngineering]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_BiblePercentage]    Script Date: 12/8/2023 2:51:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER FUNCTION [dbo].[udf_BiblePercentage]
(
	@percentage		DECIMAL		=	100,
	@firstChapter	INTEGER		=	1,
	@lastChapter	INTEGER		=	1189,
	@firstVerse		INTEGER		=	1,
	@lastVerse		INTEGER		=	31102
)
RETURNS VARCHAR(100)
AS
BEGIN
/*
SELECT
	'{"' + bookTitle + '", new Prevade {FirstChapter=' + CONVERT(VARCHAR, MIN(chapterIDSequence)) +
	', LastChapter=' + CONVERT(VARCHAR, MAX(chapterIDSequence)) +
	', FirstVerse=' + CONVERT(VARCHAR, MIN(verseIDSequence)) +
	', LastVerse=' + CONVERT(VARCHAR, MAX(verseIDSequence)) + '}},'
FROM
	Bible..Scripture_View
GROUP BY
	bookId,
	bookTitle
ORDER BY
	bookId
*/
/*
	SELECT dbo.udf_BiblePercentage(92.134831460674, 1, 1189, 1, 31102)
*/
DECLARE	@moduloChapter DECIMAL
DECLARE	@moduloVerse DECIMAL

DECLARE @chapterBackward VARCHAR(25) = ""
DECLARE @chapterForward VARCHAR(25) = ""
DECLARE @verseBackward VARCHAR(25) = ""
DECLARE @verseForward VARCHAR(25) = ""

DECLARE	@scriptureReference VARCHAR(100)

SELECT	@moduloChapter = ((@lastChapter - @firstChapter) * (@percentage / 100.0))
SELECT	@moduloVerse = ((@lastVerse - @firstVerse) * (@percentage / 100.0))

SELECT	TOP 1
		@chapterBackward = bookTitle + ' ' + CONVERT(VARCHAR, chapterId)
FROM	Bible..Scripture_View
WHERE	ChapterIdSequence <= @lastChapter - @moduloChapter
ORDER BY
		VerseIDSequence DESC

SELECT	TOP 1
		@chapterForward = bookTitle + ' ' + CONVERT(VARCHAR, chapterId)
FROM	Bible..Scripture_View
WHERE	ChapterIdSequence >= @firstChapter + @moduloChapter
ORDER BY
		VerseIDSequence ASC

SELECT	TOP 1 @verseBackward = ScriptureReference
FROM	Bible..Scripture_View
WHERE	VerseIdSequence <= @lastVerse - @moduloVerse
ORDER BY
		VerseIDSequence DESC

SELECT	TOP 1 @verseForward = ScriptureReference
FROM	Bible..Scripture_View
WHERE	VerseIdSequence >= @firstVerse + @moduloVerse
ORDER BY
		VerseIDSequence ASC

SELECT 	@scriptureReference = @verseForward + ', ' +
				@chapterForward + ', ' +
				@chapterBackward + ', ' +
				@verseBackward 

RETURN @scriptureReference
END
