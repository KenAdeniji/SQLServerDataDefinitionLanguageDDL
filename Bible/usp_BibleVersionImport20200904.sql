/****** Object:  StoredProcedure [dbo].[usp_BibleVersionImport20200904]    Script Date: 9/4/2020 7:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[usp_BibleVersionImport20200904]
AS
/*
UPDATE Bible..Scripture 
SET BibleInBasicEnglish =
(
	SELECT Bible..Narration
	FROM b_bbe
	WHERE BIB_ID = VerseIDSequence
)
*/

/*
UPDATE Bible..Scripture 
SET DarbyEnglishBible =
(
	SELECT Narration
	FROM Bible..b_darby
	WHERE BIB_ID = VerseIDSequence
)
*/

/*
UPDATE Bible..Scripture 
SET WebsterBible =
(
	SELECT Narration
	FROM Bible..b_web
	WHERE BIB_ID = VerseIDSequence
)
*/

/*
UPDATE Bible..Scripture 
SET YoungLiteralTranslation =
(
	SELECT Narration
	FROM Bible..b_ylt
	WHERE BIB_ID = VerseIDSequence
)
*/

/*
SELECT        TOP (200) Book, BookTitle, Chapter, Verse, TextData
FROM            BibleTable
*/

/*
UPDATE Bible..Scripture 
SET AmericanStandardBible =
(
	SELECT TextData
	FROM Bible..BibleTable
	WHERE Book = BookID AND Chapter = ChapterID AND Verse = VerseID
)
*/

/*
with cteBase
as
(
	SELECT 
	  BookID
	, ChapterID

	FROM Bible..Scripture AS InnerQuery

	group by
	  BookID
	, ChapterID

)
, cteBookChapterSequence
as
(
	SELECT 
		  BookID
		, ChapterID
		, ROW_NUMBER() OVER
					(
						ORDER BY BookID, ChapterID
					) AS ChapterIDSequence
	FROM cteBase
)

UPDATE Bible..Scripture
    SET ChapterIDSequence = cteBookChapterSequence.ChapterIDSequence
FROM Bible..Scripture
    INNER JOIN cteBookChapterSequence ON 
		Scripture.BookID = cteBookChapterSequence.BookID 
	AND	Scripture.ChapterID = cteBookChapterSequence.ChapterID 
*/
