USE [AdvancedTask_AustraliaDW]
GO

/****** Object:  Table [dbo].[TempMedianValues]    Script Date: 06/10/2022 12:25:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TempMedianValues](
	[Year] [int] NOT NULL,
	[MedianValue] [money] NOT NULL,
	[ValueGrowth_1y] [money] NOT NULL,
	[ValueGrowth_5y] [money] NOT NULL,
	[ValueGrowth_10y] [money] NOT NULL
) ON [PRIMARY]
GO


