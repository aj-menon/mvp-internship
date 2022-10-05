DELETE FROM [dbo].[TempMedianValues];

INSERT INTO [dbo].[TempMedianValues]
EXEC [dbo].[Properties_CapitalGrowth] @City, @Suburb;


SELECT 
    p.[Columns],
    p.[Value]
FROM (
    SELECT 
        [MedianValue],[ValueGrowth_1y],[ValueGrowth_5y],[ValueGrowth_10y]
    FROM [dbo].[TempMedianValues]
) x
UNPIVOT(
    [Value] FOR [Columns] IN ([MedianValue],[ValueGrowth_1y],[ValueGrowth_5y],[ValueGrowth_10y]) -- 
) AS P;