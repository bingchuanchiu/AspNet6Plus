USE [Complex]
GO
/****** Object:  Table [dbo].[SysUserAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserAssignedRoles](
	[Sys_user_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_user_id] [int] NOT NULL,
	[Sys_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SysUserAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[Sys_user_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedRoles] FOREIGN KEY([Sys_role_id])
REFERENCES [dbo].[SysRoles] ([Sys_role_id])
GO
ALTER TABLE [dbo].[SysUserAssignedRoles] CHECK CONSTRAINT [FK_SysUserAssignedRoles]
GO
ALTER TABLE [dbo].[SysUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedRoles] FOREIGN KEY([Sys_user_id])
REFERENCES [dbo].[SysUsers] ([Sys_user_id])
GO
ALTER TABLE [dbo].[SysUserAssignedRoles] CHECK CONSTRAINT [FK_SysUserAssignedRoles]
GO


