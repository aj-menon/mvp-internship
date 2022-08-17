USE [AustraliaDW]
GO

/****** Object:  Table [dbo].[DimSchool]    Script Date: 17/08/2022 12:42:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSchool](
	[DimSchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [int] NOT NULL,
	[SchoolName] [nvarchar](255) NOT NULL,
	[SchoolAddress] [nvarchar](255) NOT NULL,
	[Suburb] [nvarchar](255) NOT NULL,
	[PostCode] [int] NOT NULL,
	[SuburbID] [nvarchar](255) NOT NULL,
	[SchoolPhone] [nvarchar](255) NOT NULL,
	[SchoolEmail] [nvarchar](255) NOT NULL,
	[YearSchoolOpen] [int] NOT NULL,
	[StudentNumber] [float] NOT NULL,
	[SchoolingLevel] [nvarchar](255) NOT NULL,
	[SpecialityType] [nvarchar](255) NOT NULL,
	[SchoolGender] [nvarchar](255) NOT NULL,
	[SchoolSubtype] [nvarchar](255) NOT NULL,
	[DistanceEducation] [nvarchar](255) NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_DimSchool] PRIMARY KEY CLUSTERED 
(
	[DimSchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


