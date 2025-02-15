USE [Complex]
GO
/****** Object:  Table [dbo].[SystemUserAssignedCellCarriers]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserAssignedCellCarriers](
	[system_user_assigned_system_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[system_user_id] [int] NOT NULL,
	[system_cell_carrier_id] [int] NOT NULL,
	[cellphone] [nvarchar](15) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_SystemUserAssignedCellCarriers] PRIMARY KEY CLUSTERED 
(
	[system_user_assigned_system_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedCellCarriers_CellCarriers1] FOREIGN KEY([system_cell_carrier_id])
REFERENCES [dbo].[SystemCellCarriers] ([system_cell_carrier_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedCellCarriers] CHECK CONSTRAINT [FK_SystemUserAssignedCellCarriers_CellCarriers1]
GO
ALTER TABLE [dbo].[SystemUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserAssignedCellCarriers_Users] FOREIGN KEY([system_user_id])
REFERENCES [dbo].[SystemUsers] ([system_user_id])
GO
ALTER TABLE [dbo].[SystemUserAssignedCellCarriers] CHECK CONSTRAINT [FK_SystemUserAssignedCellCarriers_Users]
GO
