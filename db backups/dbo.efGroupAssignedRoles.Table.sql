USE [Complex]
GO
/****** Object:  Table [dbo].[efGroupAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efGroupAssignedRoles](
	[ef_group_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_group_id] [int] NOT NULL,
	[ef_role_id] [int] NOT NULL,
 CONSTRAINT [PK_efGroupAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[ef_group_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efGroupAssignedRoles_Groups] FOREIGN KEY([ef_group_id])
REFERENCES [dbo].[efGroups] ([ef_group_id])
GO
ALTER TABLE [dbo].[efGroupAssignedRoles] CHECK CONSTRAINT [FK_efGroupAssignedRoles_Groups]
GO
ALTER TABLE [dbo].[efGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efGroupAssignedRoles_efRoles] FOREIGN KEY([ef_role_id])
REFERENCES [dbo].[efRoles] ([ef_role_id])
GO
ALTER TABLE [dbo].[efGroupAssignedRoles] CHECK CONSTRAINT [FK_efGroupAssignedRoles_efRoles]
GO



