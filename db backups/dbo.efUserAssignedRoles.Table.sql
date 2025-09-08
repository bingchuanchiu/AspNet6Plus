USE [Complex]
GO
/****** Object:  Table [dbo].[efUserAssignedRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efUserAssignedRoles](
	[ef_user_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_user_id] [int] NOT NULL,
	[ef_role_id] [int] NOT NULL,
 CONSTRAINT [PK_efUserAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[ef_user_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedRoles] FOREIGN KEY([ef_role_id])
REFERENCES [dbo].[efRoles] ([ef_role_id])
GO
ALTER TABLE [dbo].[efUserAssignedRoles] CHECK CONSTRAINT [FK_efUserAssignedRoles]
GO
ALTER TABLE [dbo].[efUserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedRoles] FOREIGN KEY([ef_user_id])
REFERENCES [dbo].[efUsers] ([ef_user_id])
GO
ALTER TABLE [dbo].[efUserAssignedRoles] CHECK CONSTRAINT [FK_efUserAssignedRoles]
GO



