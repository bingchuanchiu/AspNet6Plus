USE [Complex]
GO
/****** Object:  Table [dbo].[JobOrderStatusTypes]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOrderStatusTypes](
	[job_order_status_type_id] [int] IDENTITY(1,1) NOT NULL,
	[job_order_status_type_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_JobOrderStatusTypes] PRIMARY KEY CLUSTERED 
(
	[job_order_status_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
