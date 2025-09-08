USE [Complex]
GO
/****** Object:  Table [dbo].[efGroupAssignedOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efGroupAssignedOUs](
	[ef_group_assigned_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_group_id] [int] NOT NULL,
	[ef_ou_id] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedFIMGroups] PRIMARY KEY CLUSTERED 
(
	[ef_group_assigned_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efGroupAssignedOUs]  WITH CHECK ADD  CONSTRAINT [FK_efGroupAssignedOUs_Groups] FOREIGN KEY([ef_group_id])
REFERENCES [dbo].[efGroups] ([ef_group_id])
GO
ALTER TABLE [dbo].[efGroupAssignedOUs] CHECK CONSTRAINT [FK_efGroupAssignedOUs_Groups]
GO



