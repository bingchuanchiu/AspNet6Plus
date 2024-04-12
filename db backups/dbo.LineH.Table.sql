USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[LineH]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineH](
	[line_h_id] [int] IDENTITY(1,1) NOT NULL,
	[line_h_name] [nvarchar](50) NULL,
	[line_h_increase_amount] [money] NULL,
	[line_h_decrease_amount] [money] NULL,
	[removed_by] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
 CONSTRAINT [PK_LineH] PRIMARY KEY CLUSTERED 
(
	[line_h_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LineH] ADD  CONSTRAINT [DF_LineH_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
