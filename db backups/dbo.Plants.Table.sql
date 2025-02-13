USE [Complex]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[plant_id] [int] IDENTITY(1,1) NOT NULL,
	[plant_name] [nvarchar](max) NULL,
	[heading] [float] NOT NULL,
	[height] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[pitch] [float] NOT NULL,
	[roll] [float] NOT NULL,
	[plant_number] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[hopper_size] [int] NULL,
	[is_dewatering] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[plant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
