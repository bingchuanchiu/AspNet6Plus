USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[RoleAssignedPermissions]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAssignedPermissions](
	[role_assigned_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_RoleAssignedPermissions] PRIMARY KEY CLUSTERED 
(
	[role_assigned_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssignedPermissions_Permissions] FOREIGN KEY([permission_id])
REFERENCES [dbo].[Permissions] ([permission_id])
GO
ALTER TABLE [dbo].[RoleAssignedPermissions] CHECK CONSTRAINT [FK_RoleAssignedPermissions_Permissions]
GO
ALTER TABLE [dbo].[RoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssignedPermissions_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[RoleAssignedPermissions] CHECK CONSTRAINT [FK_RoleAssignedPermissions_Roles]
GO
