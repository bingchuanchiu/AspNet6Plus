USE [Complex]
GO
/****** Object:  Table [dbo].[SystemOUAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemOUAssignedRoles](
	[system_ou_assigned_system_role_id] [int] IDENTITY(1,1) NOT NULL,
	[system_ou_id] [int] NULL,
	[system_role_id] [int] NULL,
 CONSTRAINT [PK_SystemOUAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[system_ou_assigned_system_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemOUAssignedRoles_OUs] FOREIGN KEY([system_ou_id])
REFERENCES [dbo].[SystemOUs] ([system_ou_id])
GO
ALTER TABLE [dbo].[SystemOUAssignedRoles] CHECK CONSTRAINT [FK_SystemOUAssignedRoles_OUs]
GO
ALTER TABLE [dbo].[SystemOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_SystemOUAssignedRoles_Roles] FOREIGN KEY([system_role_id])
REFERENCES [dbo].[SystemRoles] ([system_role_id])
GO
ALTER TABLE [dbo].[SystemOUAssignedRoles] CHECK CONSTRAINT [FK_SystemOUAssignedRoles_Roles]
GO
