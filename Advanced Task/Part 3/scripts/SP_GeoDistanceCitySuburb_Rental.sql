SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GeoDistanceCitySuburb_RentalProperties]
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


		 SELECT 
		   City, Suburb,Postcode,PropertyType, Bedrooms,Lat,Long,
		   COUNT(*) NumberOfProperties,
		   ROUND((@subGeo.STDistance(geography ::Point(Lat,Long,4326))/1000),2) AS [Distance(Km)],
		   SUM(RentalMedianValue) TotalRentalMedianValue, CAST(Median AS money) as MedianIncome
  
		FROM (
			SELECT RentalMedianValue,City,Suburb,PropertyType, prop.Bedrooms, geo.Lat As Lat, geo.Long as Long, Postcode,
			PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ft.RentalMedianValue) OVER(PARTITION BY geo.city,geo.suburb,prop.propertyType) MEDIAN  
			FROM FactSuburbRentalMedian ft (NOLOCK)
			LEFT OUTER JOIN DimGeography geo (NOLOCK) ON ft.[DimGeographyKey]=geo.[DimGeographyKey]
			LEFT OUTER JOIN [dbo].[DimPropertyType] prop (NOLOCK) on ft.DimPropertyTypeKey = prop.DimPropertyTypeKey  
		) temp
		WHERE (@subGeo.STDistance(geography ::Point(temp.Lat,temp.Long,4326))/1000) <= @distance 
		GROUP BY city, suburb, MEDIAN,PropertyType, temp.Lat, temp.Long, Bedrooms,Postcode
		ORDER BY [Distance(Km)] DESC


		 
	END
