USE [Complex]
GO
/****** Object:  Table [dbo].[SystemRoleAssignedPermissions]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemRoleAssignedPermissions](
	[system_role_assigned_system_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[system_permission_id] [int] NOT NULL,
	[system_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SystemRoleAssignedPermissions] PRIMARY KEY CLUSTERED 
(
	[system_role_assigned_system_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_SystemRoleAssignedPermissions_Roles] FOREIGN KEY([system_role_id])
REFERENCES [dbo].[SystemRoles] ([system_role_id])
GO
ALTER TABLE [dbo].[SystemRoleAssignedPermissions] CHECK CONSTRAINT [FK_SystemRoleAssignedPermissions_Roles]
GO
ALTER TABLE [dbo].[SystemRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_SystemRoleAssignedPermissions_SystemPermissions] FOREIGN KEY([system_permission_id])
REFERENCES [dbo].[SystemPermissions] ([system_permission_id])
GO
ALTER TABLE [dbo].[SystemRoleAssignedPermissions] CHECK CONSTRAINT [FK_SystemRoleAssignedPermissions_SystemPermissions]
GO
