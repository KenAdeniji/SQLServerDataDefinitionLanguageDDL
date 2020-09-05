CREATE OR ALTER VIEW Scripture_View
AS
-- 2020-09-03 Created for MySQL database.
	SELECT *, 
	(case when [BookID]<=(39) then 'Old' else 'New' end) AS Testament,
	([dbo].[udf_BookTitle]([BookID])) AS BookTitle,
	([dbo].[udf_ScriptureReference]([bookID],[chapterID],[verseID])) AS ScriptureReference,
	(([ChapterIdSequence]*(100.0))/(1189)) AS ChapterIDSequencePercent,
	(([VerseIdSequence]*(100.0))/(31102)) AS VerseIDSequencePercent,
	((right('00'+CONVERT([varchar](2),[BookID],(0)),(2))+right('000'+CONVERT([varchar](3),[ChapterID],(0)),(3)))+right('000'+CONVERT([varchar](3),[VerseID],(0)),(3))) AS BibleReference
FROM
	Scripture
go
