USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[OUAssignedRoles]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUAssignedRoles](
	[ou_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_OUAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[ou_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_OUAssignedRoles_OUs] FOREIGN KEY([ou_id])
REFERENCES [dbo].[OUs] ([ou_id])
GO
ALTER TABLE [dbo].[OUAssignedRoles] CHECK CONSTRAINT [FK_OUAssignedRoles_OUs]
GO
ALTER TABLE [dbo].[OUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_OUAssignedRoles_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[OUAssignedRoles] CHECK CONSTRAINT [FK_OUAssignedRoles_Roles]
GO
