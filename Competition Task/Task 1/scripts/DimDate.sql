USE [AustraliaDW]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 17/08/2022 12:43:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NULL,
	[DateName] [nchar](11) NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nchar](10) NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekdayWeekend] [nchar](10) NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[MonthName] [nchar](10) NOT NULL,
	[MonthOfYear] [tinyint] NOT NULL,
	[IsLastDayOfMonth] [nchar](1) NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarYearMonth] [nchar](10) NOT NULL,
	[CalendarYearQtr] [nchar](10) NOT NULL,
	[FiscalMonthOfYear] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[FiscalYearMonth] [nchar](10) NOT NULL,
	[FiscalYearQtr] [nchar](10) NOT NULL,
 CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


