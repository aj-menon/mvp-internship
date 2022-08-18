USE [AustraliaDW]
GO

/****** Object:  Table [dbo].[DimNSWStations]    Script Date: 18/08/2022 13:34:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimNSWStations](
	[DimStationKey] [int] IDENTITY(1,1) NOT NULL,
	[StationName] [nvarchar](255) NOT NULL,
	[StreetName] [nvarchar](255) NOT NULL,
	[SuburbID] [nvarchar](255) NOT NULL,
	[Postcode] [int] NOT NULL,
	[EntranceType] [nvarchar](50) NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[StationID] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_DimNSWStations] PRIMARY KEY CLUSTERED 
(
	[DimStationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


