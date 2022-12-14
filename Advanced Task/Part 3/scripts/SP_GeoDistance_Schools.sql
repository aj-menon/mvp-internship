USE [AdvancedTask_AustraliaDW]
GO
/****** Object:  StoredProcedure [dbo].[GeoDistance_Schools]    Script Date: 05/10/2022 13:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GeoDistance_Schools] 
	-- Add the parameters for the stored procedure here
	@City VARCHAR(50),
	@Suburb VARCHAR(50),
	@distance INT
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		DECLARE @subGeo GEOGRAPHY, @subLat DECIMAL(9,6), @subLong DECIMAL(9,6);
		-- Insert statements for procedure here
		SELECT TOP 1 @subLat = Lat, @subLong = Long
		FROM DimGeography (NOLOCK)
		WHERE City = @City AND Suburb= @Suburb

		SET @subGeo = geography ::Point(@subLat,@subLong,4326)

		SELECT geo.City, geo.Suburb, SchoolName, SchoolType,
		ROUND((@subGeo.STDistance(geography ::Point(school.Lat,school.Long,4326))/1000),2) AS [Distance(Km)]
		FROM [dbo].[DimAustraliaLocalSchools] school (NOLOCK)
		LEFT OUTER JOIN DimGeography geo ON geo.Postcode = school.Postcode
		WHERE (@subGeo.STDistance(geography ::Point(school.Lat,school.Long,4326))/1000) <= @distance
		ORDER BY [Distance(Km)] DESC
	END
