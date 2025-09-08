USE [Complex]
GO
/****** Object:  Table [dbo].[efExceptionLogs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efExceptionLogs](
	[ef_exception_log_id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[inner_exception] [nvarchar](max) NULL,
	[stack_trace] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_efExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[ef_exception_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[efExceptionLogs] ADD  CONSTRAINT [DF_efExceptionLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO


