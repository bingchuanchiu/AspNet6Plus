USE [Complex]
GO
/****** Object:  Table [dbo].[efUserAssignedGroups]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efUserAssignedGroups](
	[ef_user_assigned_group_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_user_id] [int] NOT NULL,
	[ef_group_id] [int] NOT NULL,
 CONSTRAINT [PK_efUserAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[ef_user_assigned_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedGroups_Groups] FOREIGN KEY([ef_group_id])
REFERENCES [dbo].[efGroups] ([ef_group_id])
GO
ALTER TABLE [dbo].[efUserAssignedGroups] CHECK CONSTRAINT [FK_efUserAssignedGroups_Groups]
GO
ALTER TABLE [dbo].[efUserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedGroups_Users] FOREIGN KEY([ef_user_id])
REFERENCES [dbo].[efUsers] ([ef_user_id])
GO
ALTER TABLE [dbo].[efUserAssignedGroups] CHECK CONSTRAINT [FK_efUserAssignedGroups_Users]
GO


