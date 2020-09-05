/****** Object:  StoredProcedure [dbo].[usp_BibleBooksAuthor]    Script Date: 3/23/2020 11:56:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_BibleBooksAuthor]
AS
/*
	2020-03-21	https://stackoverflow.com/questions/12668528/sql-server-group-by-clause-to-get-comma-separated-values
	2020-03-23	Added Category	
*/
SELECT 
	Author AS BibleInfo,
	STUFF
	(
		(
			SELECT ', ' + bookTitle
			FROM Bible..BibleBook BibleBookSecond
			WHERE BibleBookFirst.Author = BibleBookSecond.Author
			FOR XML PATH('')
		), 1, 2, ''
	) AS BibleBooks
FROM Bible..BibleBook AS BibleBookFirst
WHERE BibleBookFirst.author IS NOT NULL
GROUP BY Author
UNION
SELECT 
	Category AS BibleInfo,
	STUFF
	(
		(
			SELECT ', ' + bookTitle
			FROM Bible..BibleBook BibleBookSecond
			WHERE BibleBookFirst.Category = BibleBookSecond.Category
			FOR XML PATH('')
		), 1, 2, ''
	) AS BibleBooks
FROM Bible..BibleBook AS BibleBookFirst
WHERE BibleBookFirst.category IS NOT NULL
GROUP BY Category
ORDER BY BibleInfo
GO


