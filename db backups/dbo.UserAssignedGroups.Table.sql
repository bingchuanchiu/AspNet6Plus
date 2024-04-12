USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[UserAssignedGroups]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedGroups](
	[user_assigned_group_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_UserAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[user_assigned_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedGroups_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[UserAssignedGroups] CHECK CONSTRAINT [FK_UserAssignedGroups_Groups]
GO
ALTER TABLE [dbo].[UserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedGroups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserAssignedGroups] CHECK CONSTRAINT [FK_UserAssignedGroups_Users]
GO
