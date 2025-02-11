USE [Complex]
GO
/****** Object:  Table [dbo].[WorkflowItems]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowItems](
	[workflow_item_id] [int] NULL,
	[name] [varchar](max) NULL,
	[detail] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
