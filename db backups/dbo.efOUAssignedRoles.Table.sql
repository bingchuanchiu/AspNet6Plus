USE [Complex]
GO
/****** Object:  Table [dbo].[efOUAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efOUAssignedRoles](
	[ef_ou_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_ou_id] [int] NULL,
	[ef_role_id] [int] NULL,
 CONSTRAINT [PK_efOUAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[ef_ou_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efOUAssignedRoles_OUs] FOREIGN KEY([ef_ou_id])
REFERENCES [dbo].[efOUs] ([ef_ou_id])
GO
ALTER TABLE [dbo].[efOUAssignedRoles] CHECK CONSTRAINT [FK_efOUAssignedRoles_OUs]
GO
ALTER TABLE [dbo].[efOUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efOUAssignedRoles_Roles] FOREIGN KEY([ef_role_id])
REFERENCES [dbo].[efRoles] ([ef_role_id])
GO
ALTER TABLE [dbo].[efOUAssignedRoles] CHECK CONSTRAINT [FK_efOUAssignedRoles_Roles]
GO



