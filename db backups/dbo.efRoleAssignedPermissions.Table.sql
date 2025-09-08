USE [Complex]
GO
/****** Object:  Table [dbo].[efRoleAssignedPermissions]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efRoleAssignedPermissions](
	[ef_role_assigned_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_permission_id] [int] NOT NULL,
	[ef_role_id] [int] NOT NULL,
 CONSTRAINT [PK_efRoleAssignedPermissions] PRIMARY KEY CLUSTERED 
(
	[ef_role_assigned_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_efRoleAssignedPermissions_Roles] FOREIGN KEY([ef_role_id])
REFERENCES [dbo].[efRoles] ([ef_role_id])
GO
ALTER TABLE [dbo].[efRoleAssignedPermissions] CHECK CONSTRAINT [FK_efRoleAssignedPermissions_Roles]
GO
ALTER TABLE [dbo].[efRoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_efRoleAssignedPermissions_efPermissions] FOREIGN KEY([ef_permission_id])
REFERENCES [dbo].[efPermissions] ([ef_permission_id])
GO
ALTER TABLE [dbo].[efRoleAssignedPermissions] CHECK CONSTRAINT [FK_efRoleAssignedPermissions_efPermissions]
GO




