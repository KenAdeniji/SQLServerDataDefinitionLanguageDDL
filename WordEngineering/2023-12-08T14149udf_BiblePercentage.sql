USE [WordEngineering]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_BiblePercentage]    Script Date: 12/8/2023 2:51:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER FUNCTION [dbo].[udf_BiblePercentage]
(
	@percentage		DECIMAL(38, 30)		=	100,
	@firstChapter	INTEGER				=	1,
	@lastChapter	INTEGER				=	1189,
	@firstVerse		INTEGER				=	1,
	@lastVerse		INTEGER				=	31102
)
RETURNS VARCHAR(100)
AS
BEGIN
/*
	WordEngineering..HisWord
		158946	2023-12-08 12:38:16.367	Depart from me.	12:41 Microsoft sql server management studio hourglass.
				Euro Asian. Eurasia. I remembered the name Michael at 4760 Creekwood Drive.
				I recalled the name Victoria at 34320 Siward Drive.
				18:40 Wienerschnitzel Lightskinned African descent male sitting on the lawn and facing South.	
				NULL	13642	NULL	NULL	NULL	Harley-Davidson. 4760 Creekwood Drive.	NULL
	2023-12-08T14:49:00...2023-12-08T18:40:00	BiblePercentage.html select the nearese and closest between a BiblePercentage greater than or equal to, >=, and a BiblePercentage less than or equal, <=, the specified percentage.
		http://stackoverflow.com/questions/592209/find-closest-numeric-value-in-database
	2023-12-08T18:09:00	http://learn.microsoft.com/en-us/sql/t-sql/data-types/decimal-and-numeric-transact-sql?view=sql-server-ver16
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
	2023-12-08T20:17:00...2023-12-08T20:56:00 
		We have always maintained...there are creditability questions?
		We have always maintained...there are credibility questions?
*/
/*
	2023-12-08T14:49:00
		SELECT dbo.udf_BiblePercentage(92.134831460674, 1, 1189, 1, 31102)
			1 Corinthians 11:13, Galatians 3, Leviticus 6, Exodus 33:15
	2023-12-08T18:40:00
		SELECT dbo.udf_BiblePercentage(92.134831460674, 1, 1189, 1, 31102)
			1 Corinthians 12:21, Galatians 4, Leviticus 4, Exodus 32:8
*/

DECLARE	@moduloChapter DECIMAL
DECLARE	@moduloVerse DECIMAL

DECLARE @chapterBackward VARCHAR(25) = ""
DECLARE @chapterForward VARCHAR(25) = ""
DECLARE @verseBackward VARCHAR(25) = ""
DECLARE @verseForward VARCHAR(25) = ""

DECLARE	@scriptureReference VARCHAR(100)

--2023-12-08T15:55:00
DECLARE	@lowNumber DECIMAL(38, 30)
DECLARE	@highNumber DECIMAL(38, 30)

--2023-12-08T16:13:00
DECLARE	@nearestClosestNumber DECIMAL(38, 30)

SELECT	@moduloChapter = ((@lastChapter - @firstChapter) * (@percentage / 100.0))
SELECT	@moduloVerse = ((@lastVerse - @firstVerse) * (@percentage / 100.0))

/*
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

SELECT 	@scriptureReference = 
	@verseForward
	+ ', ' + @chapterForward
	+ ', ' + @chapterBackward
	+ ', ' + @verseBackward 

RETURN @scriptureReference
*/

--VerseForward
SELECT TOP 1 @lowNumber = VerseIDSequencePercent
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent <= @percentage
ORDER BY VerseIDSequencePercent DESC

SELECT TOP 1 @highNumber = VerseIDSequencePercent
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent >= @percentage
ORDER BY VerseIDSequencePercent ASC

IF ( ABS(@percentage - @lowNumber) < ABS(@percentage - @highNumber) )
BEGIN
	SET @nearestClosestNumber = @lowNumber
END
ELSE
BEGIN
	SET @nearestClosestNumber = @highNumber
END

SELECT TOP 1 @verseForward = ScriptureReference
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent = @nearestClosestNumber

--ChapterForward
SELECT TOP 1 @lowNumber = ChapterIDSequencePercent
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent <= @percentage
ORDER BY ChapterIDSequencePercent DESC

SELECT TOP 1 @highNumber = ChapterIDSequencePercent
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent >= @percentage
ORDER BY ChapterIDSequencePercent ASC

IF ( ABS(@percentage - @lowNumber) < ABS(@percentage - @highNumber) )
BEGIN
	SET @nearestClosestNumber = @lowNumber
END
ELSE
BEGIN
	SET @nearestClosestNumber = @highNumber
END

SELECT TOP 1 @chapterForward = BookTitle + ' ' + CONVERT(VARCHAR, ChapterID)
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent = @nearestClosestNumber

--ChapterBackward
SELECT TOP 1 @lowNumber = ChapterIDSequencePercent
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent <= 100 - @percentage
ORDER BY ChapterIDSequencePercent DESC

SELECT TOP 1 @highNumber = ChapterIDSequencePercent
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent >= 100 - @percentage
ORDER BY ChapterIDSequencePercent ASC

IF ( ABS(@percentage - @lowNumber) < ABS(@percentage - @highNumber) )
BEGIN
	SET @nearestClosestNumber = @lowNumber
END
ELSE
BEGIN
	SET @nearestClosestNumber = @highNumber
END

SELECT TOP 1 @chapterBackward = BookTitle + ' ' + CONVERT(VARCHAR, ChapterID)
FROM Bible..Scripture_View
WHERE ChapterIDSequencePercent = @nearestClosestNumber

--VerseBackward
SELECT TOP 1 @lowNumber = VerseIDSequencePercent
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent <= 100 - @percentage
ORDER BY VerseIDSequencePercent DESC

SELECT TOP 1 @highNumber = VerseIDSequencePercent
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent >= 100 - @percentage
ORDER BY VerseIDSequencePercent ASC

IF ( ABS(@percentage - @lowNumber) < ABS(@percentage - @highNumber) )
BEGIN
	SET @nearestClosestNumber = @lowNumber
END
ELSE
BEGIN
	SET @nearestClosestNumber = @highNumber
END

SELECT TOP 1 @verseBackward = ScriptureReference
FROM Bible..Scripture_View
WHERE VerseIDSequencePercent = @nearestClosestNumber

--Concatenate result
SELECT 	@scriptureReference = 
	@verseForward
	+ ', ' + @chapterForward
	+ ', ' + @chapterBackward
	+ ', ' + @verseBackward 

RETURN @scriptureReference
END
