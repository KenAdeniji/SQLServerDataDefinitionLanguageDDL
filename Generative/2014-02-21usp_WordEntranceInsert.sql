USE [Generative]
GO
/****** Object:  StoredProcedure [dbo].[usp_WordEntranceInsert]    Script Date: 2/21/2014 10:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[usp_WordEntranceInsert]
	@Word					VARCHAR(30)		=	NULL,
	@FirstOccurrence		DateTime		=	NULL, 
	@LastOccurrence			DateTime		=	NULL,
	@Difference				INT				=	NULL,
	@FrequencyOfOccurrence	INT				=	NULL
AS
BEGIN
	INSERT INTO WordEntrance
	(
		Word,
		FirstOccurrence, 
		LastOccurrence,
		[Difference],
		FrequencyOfOccurrence
	)
	VALUES
	(
		@Word,
		@FirstOccurrence, 
		@LastOccurrence,
		@Difference,
		@FrequencyOfOccurrence
	)
END
