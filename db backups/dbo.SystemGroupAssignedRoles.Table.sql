USE [Complex]
GO
/****** Object:  Table [dbo].[SystemGroupAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemGroupAssignedRoles](
	[system_group_assigned_system_role_id] [int] IDENTITY(1,1) NOT NULL,
	[system_group_id] [int] NOT NULL,
	[system_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SystemGroupAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[system_group_assigned_system_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemGroupAssignedRoles_Groups] FOREIGN KEY([system_group_id])
REFERENCES [dbo].[SystemGroups] ([system_group_id])
GO
ALTER TABLE [dbo].[SystemGroupAssignedRoles] CHECK CONSTRAINT [FK_SystemGroupAssignedRoles_Groups]
GO
ALTER TABLE [dbo].[SystemGroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemGroupAssignedRoles_SystemRoles] FOREIGN KEY([system_role_id])
REFERENCES [dbo].[SystemRoles] ([system_role_id])
GO
ALTER TABLE [dbo].[SystemGroupAssignedRoles] CHECK CONSTRAINT [FK_SystemGroupAssignedRoles_SystemRoles]
GO
