USE [Complex]
GO
/****** Object:  Table [dbo].[SysRoleAssignedPermissions]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoleAssignedPermissions](
	[Sys_role_assigned_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_permission_id] [int] NOT NULL,
	[Sys_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SysRoleAssignedPermissions] PRIMARY KEY CLUSTERED 
(
	[Sys_role_assigned_Sys_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_SysRoleAssignedPermissions_Roles] FOREIGN KEY([Sys_role_id])
REFERENCES [dbo].[SysRoles] ([Sys_role_id])
GO
ALTER TABLE [dbo].[SysRoleAssignedPermissions] CHECK CONSTRAINT [FK_SysRoleAssignedPermissions_Roles]
GO
ALTER TABLE [dbo].[SysRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_SysRoleAssignedPermissions_SysPermissions] FOREIGN KEY([Sys_permission_id])
REFERENCES [dbo].[SysPermissions] ([Sys_permission_id])
GO
ALTER TABLE [dbo].[SysRoleAssignedPermissions] CHECK CONSTRAINT [FK_SysRoleAssignedPermissions_SysPermissions]
GO


