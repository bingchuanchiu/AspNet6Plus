USE [Complex]
GO
/****** Object:  Table [dbo].[SysOUAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysOUAssignedRoles](
	[Sys_ou_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_ou_id] [int] NULL,
	[Sys_role_id] [int] NULL,
 CONSTRAINT [PK_SysOUAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[Sys_ou_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysOUAssignedRoles_OUs] FOREIGN KEY([Sys_ou_id])
REFERENCES [dbo].[SysOUs] ([Sys_ou_id])
GO
ALTER TABLE [dbo].[SysOUAssignedRoles] CHECK CONSTRAINT [FK_SysOUAssignedRoles_OUs]
GO
ALTER TABLE [dbo].[SysOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SysOUAssignedRoles_Roles] FOREIGN KEY([Sys_role_id])
REFERENCES [dbo].[SysRoles] ([Sys_role_id])
GO
ALTER TABLE [dbo].[SysOUAssignedRoles] CHECK CONSTRAINT [FK_SysOUAssignedRoles_Roles]
GO


