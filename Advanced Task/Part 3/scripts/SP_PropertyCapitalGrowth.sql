USE [AdvancedTask_AustraliaDW]
GO
/****** Object:  StoredProcedure [dbo].[Properties_CapitalGrowth]    Script Date: 06/10/2022 09:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Properties_CapitalGrowth]
	-- Add the parameters for the stored procedure here
	@City VARCHAR(50),
	@Suburb VARCHAR(50)
	 
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		 
		-- Insert statements for procedure here
		SELECT dates.CalendarYear, property.HouseMedianPrice, 
			ROUND(property.HouseMedianPrice * 1.05, 2)as "Growth in 1Y",    -- Capital Growth = Initial Investment * (1+ growth rate)^ investment period (taken fom https://propertiesandpathways.com.au/calculate-capital-growth-property-investment/)
			ROUND(property.HouseMedianPrice * POWER(CAST(1.05 AS FLOAT), 5),2) as "Growth in 5Y",
			ROUND(property.HouseMedianPrice *POWER(CAST(1.05 AS FLOAT), 10),2) AS "Growth in 10Y"
		FROM [dbo].[FactPropertyMedian] property
		INNER JOIN DimGeography geo on property.DimGeographyKey = geo.DimGeographyKey
		INNER JOIN	DimDate dates on property.DimDateKey = dates.DateKey
		WHERE 
			City=@City AND Suburb=@Suburb  AND 
			dates.CalendarYear =
				(SELECT MAX(CalendarYear) 
				 FROM DimDate d 
				 INNER JOIN FactPropertyMedian f on d.DateKey= f.DimDateKey
				 )

 


		

		 
	END
