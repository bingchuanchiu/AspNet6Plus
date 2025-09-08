USE [Complex]
GO
/****** Object:  Table [dbo].[SysUserAssignedCellCarriers]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserAssignedCellCarriers](
	[Sys_user_assigned_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_user_id] [int] NOT NULL,
	[Sys_cell_carrier_id] [int] NOT NULL,
	[cellphone] [nvarchar](15) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_SysUserAssignedCellCarriers] PRIMARY KEY CLUSTERED 
(
	[Sys_user_assigned_Sys_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedCellCarriers_CellCarriers1] FOREIGN KEY([Sys_cell_carrier_id])
REFERENCES [dbo].[SysCellCarriers] ([Sys_cell_carrier_id])
GO
ALTER TABLE [dbo].[SysUserAssignedCellCarriers] CHECK CONSTRAINT [FK_SysUserAssignedCellCarriers_CellCarriers1]
GO
ALTER TABLE [dbo].[SysUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_SysUserAssignedCellCarriers_Users] FOREIGN KEY([Sys_user_id])
REFERENCES [dbo].[SysUsers] ([Sys_user_id])
GO
ALTER TABLE [dbo].[SysUserAssignedCellCarriers] CHECK CONSTRAINT [FK_SysUserAssignedCellCarriers_Users]
GO

