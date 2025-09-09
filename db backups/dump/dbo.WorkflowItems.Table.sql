USE [Complex]
GO
/****** Object:  Table [dbo].[WorkflowItems]    Script Date: 2/11/2025 3:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowItems](
	[workflow_item_id] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[detail] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
