USE [AustraliaDW]
GO

/****** Object:  Table [dbo].[FactProperty]    Script Date: 17/08/2022 12:43:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactProperty](
	[PK_FactPropertyKey] [int] IDENTITY(1,1) NOT NULL,
	[FK_DateKey] [int] NOT NULL,
	[FK_StationKey] [int] NOT NULL,
	[FK_SuburbKey] [int] NOT NULL,
	[FK_SchoolKey] [int] NOT NULL,
	[PropertyMedianValue] [money] NULL,
 CONSTRAINT [PK_FactProperty] PRIMARY KEY CLUSTERED 
(
	[PK_FactPropertyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactProperty]  WITH CHECK ADD  CONSTRAINT [FK_FactProperty_DimDate] FOREIGN KEY([FK_DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactProperty] CHECK CONSTRAINT [FK_FactProperty_DimDate]
GO

ALTER TABLE [dbo].[FactProperty]  WITH CHECK ADD  CONSTRAINT [FK_FactProperty_DimNSWStations] FOREIGN KEY([FK_StationKey])
REFERENCES [dbo].[DimNSWStations] ([DimStationKey])
GO

ALTER TABLE [dbo].[FactProperty] CHECK CONSTRAINT [FK_FactProperty_DimNSWStations]
GO

ALTER TABLE [dbo].[FactProperty]  WITH CHECK ADD  CONSTRAINT [FK_FactProperty_DimSchool] FOREIGN KEY([FK_SchoolKey])
REFERENCES [dbo].[DimSchool] ([DimSchoolKey])
GO

ALTER TABLE [dbo].[FactProperty] CHECK CONSTRAINT [FK_FactProperty_DimSchool]
GO

ALTER TABLE [dbo].[FactProperty]  WITH CHECK ADD  CONSTRAINT [FK_FactProperty_DimSuburb] FOREIGN KEY([FK_SuburbKey])
REFERENCES [dbo].[DimSuburb] ([DimSuburbKey])
GO

ALTER TABLE [dbo].[FactProperty] CHECK CONSTRAINT [FK_FactProperty_DimSuburb]
GO


