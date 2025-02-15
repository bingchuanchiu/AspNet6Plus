USE [Complex]
GO
/****** Object:  Table [dbo].[SystemUserAssignedGroups]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserAssignedGroups](
	[system_user_assigned_group_id] [int] IDENTITY(1,1) NOT NULL,
	[system_user_id] [int] NOT NULL,
	[system_group_id] [int] NOT NULL,
 CONSTRAINT [PK_SystemUserAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[system_user_assigned_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedGroups_Groups] FOREIGN KEY([system_group_id])
REFERENCES [dbo].[SystemGroups] ([system_group_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedGroups] CHECK CONSTRAINT [FK_SystemUserAssignedGroups_Groups]
GO
ALTER TABLE [dbo].[SystemUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedGroups_Users] FOREIGN KEY([system_user_id])
REFERENCES [dbo].[SystemUsers] ([system_user_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedGroups] CHECK CONSTRAINT [FK_SystemUserAssignedGroups_Users]
GO
