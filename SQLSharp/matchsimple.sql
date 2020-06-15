SELECT 

	tbBS.KingJamesVersion
	, [SQL#].RegEx_Matchsimple
	(
		tbBS.KingJamesVersion,	--ExpressionToValidate
		'(day|week|month|year)', --RegularExpression
		1,	--CaptureGroup
		''
	)
from  Bible.dbo.Scripture tbBS

where 
	[SQL#].RegEx_Matchsimple
	(
		tbBS.KingJamesVersion,	--ExpressionToValidate
		'(day|week|month|year)', --RegularExpression
		1,	--CaptureGroup
		--'IgnoreCase'
		''
	) <> ''
