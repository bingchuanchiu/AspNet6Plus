USE [Complex]
GO
/****** Object:  Table [dbo].[SystemGroupAssignedOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemGroupAssignedOUs](
	[system_group_assigned_system_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[system_group_id] [int] NOT NULL,
	[system_ou_id] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedFIMGroups] PRIMARY KEY CLUSTERED 
(
	[system_group_assigned_system_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemGroupAssignedOUs]  WITH CHECK ADD  CONSTRAINT [FK_SystemGroupAssignedOUs_Groups] FOREIGN KEY([system_group_id])
REFERENCES [dbo].[SystemGroups] ([system_group_id])
GO
ALTER TABLE [dbo].[SystemGroupAssignedOUs] CHECK CONSTRAINT [FK_SystemGroupAssignedOUs_Groups]
GO
