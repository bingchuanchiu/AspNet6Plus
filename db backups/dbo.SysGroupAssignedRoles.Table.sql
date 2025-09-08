USE [Complex]
GO
/****** Object:  Table [dbo].[SysGroupAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGroupAssignedRoles](
	[Sys_group_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_group_id] [int] NOT NULL,
	[Sys_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SysGroupAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[Sys_group_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysGroupAssignedRoles_Groups] FOREIGN KEY([Sys_group_id])
REFERENCES [dbo].[SysGroups] ([Sys_group_id])
GO
ALTER TABLE [dbo].[SysGroupAssignedRoles] CHECK CONSTRAINT [FK_SysGroupAssignedRoles_Groups]
GO
ALTER TABLE [dbo].[SysGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysGroupAssignedRoles_SysRoles] FOREIGN KEY([Sys_role_id])
REFERENCES [dbo].[SysRoles] ([Sys_role_id])
GO
ALTER TABLE [dbo].[SysGroupAssignedRoles] CHECK CONSTRAINT [FK_SysGroupAssignedRoles_SysRoles]
GO


