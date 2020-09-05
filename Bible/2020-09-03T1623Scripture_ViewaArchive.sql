CREATE VIEW Scripture_View
AS
-- 2020-09-03 Created for MySQL database.
	SELECT *, 
	(case when [BookId]<=(39) then 'Old' else 'New' end) AS Testament,
	([dbo].[udf_BookTitle]([BookID])) AS BookTitle,
	([dbo].[udf_ScriptureReference]([bookID],[chapterID],[verseID])) AS ScriptureReference,
	(([ChapterIdSequence]*(100.0))/(1189)) AS ChapterIdSequencePercent,
	(([VerseIdSequence]*(100.0))/(31102)) AS VerseIdSequencePercent,
	((right('00'+CONVERT([varchar](2),[BookId],(0)),(2))+right('000'+CONVERT([varchar](3),[ChapterId],(0)),(3)))+right('000'+CONVERT([varchar](3),[VerseId],(0)),(3))) AS BibleReference
FROM
	Scripture
go
