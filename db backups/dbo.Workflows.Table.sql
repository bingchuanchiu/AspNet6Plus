USE [Complex]
GO
/****** Object:  Table [dbo].[Workflows]    Script Date: 2/11/2025 3:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflows](
	[workflow_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[detail] [varchar](max) NULL,
	[current_item] [int] NULL,
	[previous_item] [int] NULL,
	[changed_by] [int] NULL,
	[changed_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Workflows] PRIMARY KEY CLUSTERED 
(
	[workflow_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
