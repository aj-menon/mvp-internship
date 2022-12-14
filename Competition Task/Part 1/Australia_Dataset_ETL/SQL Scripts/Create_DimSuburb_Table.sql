USE [AustraliaDW]
GO

/****** Object:  Table [dbo].[DimSuburb]    Script Date: 18/08/2022 13:36:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSuburb](
	[DimSuburbKey] [int] IDENTITY(1,1) NOT NULL,
	[SuburbID] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NOT NULL,
	[Suburb] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[Postcode] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
 CONSTRAINT [PK_DimSuburb] PRIMARY KEY CLUSTERED 
(
	[DimSuburbKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


