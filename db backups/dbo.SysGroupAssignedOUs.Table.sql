USE [Complex]
GO
/****** Object:  Table [dbo].[SysGroupAssignedOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGroupAssignedOUs](
	[Sys_group_assigned_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_group_id] [int] NOT NULL,
	[Sys_ou_id] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedFIMGroups] PRIMARY KEY CLUSTERED 
(
	[Sys_group_assigned_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysGroupAssignedOUs]  WITH CHECK ADD  CONSTRAINT [FK_SysGroupAssignedOUs_Groups] FOREIGN KEY([Sys_group_id])
REFERENCES [dbo].[SysGroups] ([Sys_group_id])
GO
ALTER TABLE [dbo].[SysGroupAssignedOUs] CHECK CONSTRAINT [FK_SysGroupAssignedOUs_Groups]
GO


