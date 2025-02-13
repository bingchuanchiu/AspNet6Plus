USE [Complex]
GO
/****** Object:  Table [dbo].[JobOrders]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOrders](
	[job_order_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [int] NOT NULL,
	[job_order_status_type_id] [int] NULL,
	[job_order_number] [nvarchar](100) NULL,
	[job_order_total_value] [money] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JobOrders] PRIMARY KEY CLUSTERED 
(
	[job_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobOrders] ADD  CONSTRAINT [DF_JobOrders_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JobOrders]  WITH CHECK ADD  CONSTRAINT [FK_JobOrders_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([contract_id])
GO
ALTER TABLE [dbo].[JobOrders] CHECK CONSTRAINT [FK_JobOrders_Contracts]
GO
ALTER TABLE [dbo].[JobOrders]  WITH CHECK ADD  CONSTRAINT [FK_JobOrders_JobOrderStatusTypes] FOREIGN KEY([job_order_status_type_id])
REFERENCES [dbo].[JobOrderStatusTypes] ([job_order_status_type_id])
GO
ALTER TABLE [dbo].[JobOrders] CHECK CONSTRAINT [FK_JobOrders_JobOrderStatusTypes]
GO
