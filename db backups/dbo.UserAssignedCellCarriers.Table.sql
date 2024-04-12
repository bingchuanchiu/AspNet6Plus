USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[UserAssignedCellCarriers]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedCellCarriers](
	[user_assigned_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[cell_carrier_id] [int] NOT NULL,
	[cellphone] [nvarchar](15) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedCellCarriers] PRIMARY KEY CLUSTERED 
(
	[user_assigned_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedCellCarriers_CellCarriers1] FOREIGN KEY([cell_carrier_id])
REFERENCES [dbo].[CellCarriers] ([cell_carrier_id])
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers] CHECK CONSTRAINT [FK_UserAssignedCellCarriers_CellCarriers1]
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedCellCarriers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers] CHECK CONSTRAINT [FK_UserAssignedCellCarriers_Users]
GO
