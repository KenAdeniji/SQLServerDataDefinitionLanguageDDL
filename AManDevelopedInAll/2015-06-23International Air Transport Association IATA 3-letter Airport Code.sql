ALTER PROCEDURE [dbo].[usp_InternationalAirTransportAssociationIATA3LetterAirportCodeSelect]
	@airportName		AS VARCHAR(255)		=	'',
	@airportCode		AS VARCHAR(5)		=	''
AS
BEGIN
	/*
		2015-06-23	Created. 
			usp_InternationalAirTransportAssociationIATA3LetterAirportCodeSelect
				@airportCode = ''
				,@airportName = 'San'

	SELECT * FROM IataAirportCode where len(Code) <> 3
	GO

Code  Airport
----- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Keel  Cocos Islands, Cocos 
      Dalat, Viet Nam - Lienkhang DLI)
FYRO  Skopie, Macedonia 

(3 row(s) affected)
	*/
	SET @airportName = LTRIM(RTRIM(@airportName))
	IF (@airportName IS NOT NULL)
	BEGIN
		SET @airportName = '%' + @airportName + '%'
	END

	SET @airportCode = LTRIM(RTRIM(@airportCode))
	IF (@airportCode IS NOT NULL)
	BEGIN
		SET @airportCode = '%' + @airportCode + '%'
	END

	SELECT *
	FROM AManDevelopedInAll..IataAirportCode
	WHERE 
		Code LIKE @airportCode 
		AND Airport LIKE @airportName
	ORDER BY Airport
END
GO
