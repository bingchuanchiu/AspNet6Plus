USE [Complex]
GO
/****** Object:  Table [dbo].[PlantAreas]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantAreas](
	[plant_area_id] [int] IDENTITY(1,1) NOT NULL,
	[plant_id] [int] NOT NULL,
	[plant_area_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_PlantAreas] PRIMARY KEY CLUSTERED 
(
	[plant_area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlantAreas]  WITH CHECK ADD  CONSTRAINT [FK_PlantAreas_Plants] FOREIGN KEY([plant_id])
REFERENCES [dbo].[Plants] ([plant_id])
GO
ALTER TABLE [dbo].[PlantAreas] CHECK CONSTRAINT [FK_PlantAreas_Plants]
GO
