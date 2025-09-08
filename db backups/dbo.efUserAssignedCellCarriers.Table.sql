USE [Complex]
GO
/****** Object:  Table [dbo].[efUserAssignedCellCarriers]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efUserAssignedCellCarriers](
	[ef_user_assigned_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_user_id] [int] NOT NULL,
	[ef_cell_carrier_id] [int] NOT NULL,
	[cellphone] [nvarchar](15) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_efUserAssignedCellCarriers] PRIMARY KEY CLUSTERED 
(
	[ef_user_assigned_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[efUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedCellCarriers_CellCarriers1] FOREIGN KEY([ef_cell_carrier_id])
REFERENCES [dbo].[efCellCarriers] ([ef_cell_carrier_id])
GO
ALTER TABLE [dbo].[efUserAssignedCellCarriers] CHECK CONSTRAINT [FK_efUserAssignedCellCarriers_CellCarriers1]
GO
ALTER TABLE [dbo].[efUserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_efUserAssignedCellCarriers_Users] FOREIGN KEY([ef_user_id])
REFERENCES [dbo].[efUsers] ([ef_user_id])
GO
ALTER TABLE [dbo].[efUserAssignedCellCarriers] CHECK CONSTRAINT [FK_efUserAssignedCellCarriers_Users]
GO



