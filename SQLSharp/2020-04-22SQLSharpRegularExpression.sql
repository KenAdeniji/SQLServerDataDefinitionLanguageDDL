--2020-04-22 https://sqlsharp.com/download/SQLsharp_Manual.pdf
/*
RegEx_CaptureGroup(ExpressionToValidate NVARCHAR(MAX), RegularExpression NVARCHAR(MAX), CaptureGroupNumber INT, NotFoundReplacement NVARCHAR(MAX), StartAt INT, Length INT, RegExOptionsList NVARCHAR(4000))
*/
/*
SELECT SQL#.RegEx_CaptureGroup
(
	'there were 123 web errors + 5 ftp errors',	--ExpressionToValidate
	'(\d+) (web|ftp) errors', --RegularExpression
	2,	--CaptureGroup
	NULL,
	1,
	-1,
	''
) --Web

*/
/*
SELECT SQL#.RegEx_CaptureGroup('there were 123 web errors + 5 ftp errors','(\d+) (web|ftp) errors',2,NULL,1,8,'') --NULL
SELECT SQL#.RegEx_CaptureGroup('there were 123 web errors + 5 ftp errors','(\d+) (web|ftp) errors',2,NULL,15,-1,'') --ftp
SELECT SQL#.RegEx_CaptureGroup('errors','(\d+) (web|ftp) errors',2,'Not Found',1,-1,'') --Not Found
*/

/*
SELECT 

		  tbBS.KingJamesVersion
		, SQL#.RegEx_CaptureGroup
(
	tbBS.KingJamesVersion,	--ExpressionToValidate
	'(day|week|month|year)', --RegularExpression
	1,	--CaptureGroup
	NULL,
	1,
	-1,
	''
) as [captureGroup]

from  Bible.dbo.Scripture tbBS

where 
SQL#.RegEx_CaptureGroup
(
	tbBS.KingJamesVersion,	--ExpressionToValidate
	'(day|week|month|year)', --RegularExpression
	1,	--CaptureGroup
	NULL,
	1,
	-1,
	''
) is not null

order by 
		2 asc


*/

;with cte
as
(
	SELECT 

			  tbBS.KingJamesVersion
			, SQL#.RegEx_CaptureGroup4K
	(
		cast(tbBS.KingJamesVersion as varchar(4000)),	--ExpressionToValidate
		'(day|week|month|year|season)', --RegularExpression
		1,	--CaptureGroup
		NULL,
		1,
		-1,
		--'IgnoreCase'
		''
	) as [captureGroup]

	from  Bible.dbo.Scripture tbBS
/*
	where 
	SQL#.RegEx_CaptureGroup4K
	(
		tbBS.KingJamesVersion,	--ExpressionToValidate
		'(day|week|month|year|season)', --RegularExpression
		1,	--CaptureGroup
		NULL,
		1,
		-1,
		''
	) is not null
*/

)

select 
		  cte.captureGroup AS TimeSpan
		, Count(*) AS Occurrences
from cte
where cte.captureGroup is not null
group by 
		cte.captureGroup

--SQLsharp_SetSecurity @PermissionSet INT
