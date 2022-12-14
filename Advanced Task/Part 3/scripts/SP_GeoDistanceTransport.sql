USE [AdvancedTask_AustraliaDW]
GO
/****** Object:  StoredProcedure [dbo].[CalculateGeoDistance_Train]    Script Date: 30/09/2022 16:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GeoDistance_Transportation] 
	-- Add the parameters for the stored procedure here
	@City VARCHAR(50),
	@Suburb VARCHAR(50),
	@distance FLOAT
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		DECLARE @subGeo GEOGRAPHY, @subLat DECIMAL(9,6), @subLong DECIMAL(9,6);
		-- Insert statements for procedure here
		SELECT  TOP 1 @subLat = Lat, @subLong = Long
		FROM DimGeography (NOLOCK)
		WHERE City = @City AND Suburb= @Suburb
		 
		SET @subGeo = geography ::Point(@subLat,@subLong,4326)

		SELECT StopName, TransportMode,
		ROUND((@subGeo.STDistance(geography ::Point(StopLatitude,StopLongitude,4326))/1000),2) AS [Distance(Km)]
		FROM DimPublicTransport (NOLOCK)
		WHERE (@subGeo.STDistance(geography ::Point(StopLatitude,StopLongitude,4326))/1000) <= @distance
		ORDER BY [Distance(Km)] DESC
	END
