USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[GroupAssignedRoles]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAssignedRoles](
	[group_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_GroupAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[group_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedRoles_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[GroupAssignedRoles] CHECK CONSTRAINT [FK_GroupAssignedRoles_Groups]
GO
ALTER TABLE [dbo].[GroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedRoles_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[GroupAssignedRoles] CHECK CONSTRAINT [FK_GroupAssignedRoles_Roles]
GO
