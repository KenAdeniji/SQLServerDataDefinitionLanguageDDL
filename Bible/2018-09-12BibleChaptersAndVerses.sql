CREATE PROCEDURE ChaptersAndVersesCount AS
SELECT
	--BookID,
	--TRIM(BookTitle) AS BookTitle,
	--MAX(ChapterID) AS Chapters,
	--COUNT(VerseID) AS Verses
	'new BibleBook{ ' +
	'ID = ' + CONVERT(VARCHAR, BookID) + 
	', Title = "' + TRIM(BookTitle) + '"' +
	', Chapters = ' + CONVERT(VARCHAR, MAX(ChapterID)) + '' +
	', Verses = ' + CONVERT(VARCHAR, COUNT(VerseID)) + '' +
	' },'
FROM
	Bible..Scripture AS Entire
GROUP BY
	BookID,
	BookTitle
ORDER BY
	BookID
