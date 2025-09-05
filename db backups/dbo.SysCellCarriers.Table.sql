USE [Complex]
GO
/****** Object:  Table [dbo].[SysCellCarriers]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCellCarriers](
	[Sys_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[cell_carrier_name] [nvarchar](150) NOT NULL,
	[sms_gateway] [nvarchar](150) NOT NULL,
	[sms_notifications] [bit] NULL,
 CONSTRAINT [PK_SysCellCarriers] PRIMARY KEY CLUSTERED 
(
	[Sys_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


