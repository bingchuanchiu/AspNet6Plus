USE [Complex]
GO
/****** Object:  Table [dbo].[SysUserAssignedGroups]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserAssignedGroups](
	[Sys_user_assigned_group_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_user_id] [int] NOT NULL,
	[Sys_group_id] [int] NOT NULL,
 CONSTRAINT [PK_SysUserAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[Sys_user_assigned_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedGroups_Groups] FOREIGN KEY([Sys_group_id])
REFERENCES [dbo].[SysGroups] ([Sys_group_id])
GO
ALTER TABLE [dbo].[SysUserAssignedGroups] CHECK CONSTRAINT [FK_SysUserAssignedGroups_Groups]
GO
ALTER TABLE [dbo].[SysUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedGroups_Users] FOREIGN KEY([Sys_user_id])
REFERENCES [dbo].[SysUsers] ([Sys_user_id])
GO
ALTER TABLE [dbo].[SysUserAssignedGroups] CHECK CONSTRAINT [FK_SysUserAssignedGroups_Users]
GO

