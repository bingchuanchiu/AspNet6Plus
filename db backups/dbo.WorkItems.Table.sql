USE [Complex]
GO
/****** Object:  Table [dbo].[WorkItems]    Script Date: 9/9/2025 11:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkItems](
	[work_item_id] [int] IDENTITY(1,1) NOT NULL,
	[workflow_id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[current_item] [int] NULL,
	[previous_item] [int] NULL,
	[changed_by] [int] NULL,
	[changed_at] [datetime2](7) NULL,
 CONSTRAINT [PK_work_items] PRIMARY KEY CLUSTERED 
(
	[work_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkItems]  WITH CHECK ADD  CONSTRAINT [FK_WorkItems_Workflows] FOREIGN KEY([workflow_id])
REFERENCES [dbo].[Workflows] ([workflow_id])
GO
ALTER TABLE [dbo].[WorkItems] CHECK CONSTRAINT [FK_WorkItems_Workflows]
GO
