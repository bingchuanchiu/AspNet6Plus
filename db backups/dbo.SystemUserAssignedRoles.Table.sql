USE [Complex]
GO
/****** Object:  Table [dbo].[SystemUserAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserAssignedRoles](
	[system_user_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[system_user_id] [int] NOT NULL,
	[system_role_id] [int] NOT NULL,
 CONSTRAINT [PK_SystemUserAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[system_user_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedRoles_Roles] FOREIGN KEY([system_role_id])
REFERENCES [dbo].[SystemRoles] ([system_role_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedRoles] CHECK CONSTRAINT [FK_SystemUserAssignedRoles_Roles]
GO
ALTER TABLE [dbo].[SystemUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedRoles_SystemUsers] FOREIGN KEY([system_user_id])
REFERENCES [dbo].[SystemUsers] ([system_user_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedRoles] CHECK CONSTRAINT [FK_SystemUserAssignedRoles_SystemUsers]
GO
