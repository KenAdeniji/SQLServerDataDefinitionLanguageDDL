ALTER VIEW WhoWhatWhenWhereWhy_View AS
-- 2021-11-20T07:16:00 https://stackoverflow.com/questions/28153610/using-sql-is-not-null-in-a-select-statement
SELECT
	WhoWhatWhenWhereWhyID,
	Dated,
	ScriptureReference,
	Commentary,
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Who] + CHAR(13)+CHAR(10), '' ) + 
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[What] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[When] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Where] + CHAR(13)+CHAR(10), '' ) +
	COALESCE( ' - ' + WhoWhatWhenWhereWhy.[Why] + CHAR(13)+CHAR(10), '' )
	AS Combined,
	URI,
	ContactID,
	HisWordID
FROM WhoWhatWhenWhereWhy


